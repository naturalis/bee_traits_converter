<?php
if (!file_exists(__DIR__ . '/config.php')) {
    throw new Exception('No config file present, please rename config.php.tpl to config.php');
}
require_once 'config.php';


$import = new Import();
$import->setDb([
    'host' => HOST,
    'user' => USER,
    'pw' => PW,
    'db' => FMP_DB
]);
$import->createBeesDb(FMP_SQL);
$import->setCsv(FMP_CSV);
echo $import->importCsv() . " records imported\n";


$convert = new Convert();
$convert->setDbs([
    'host' => HOST,
    'user' => USER,
    'pw' => PW,
    'fmp' => FMP_DB,
    'lin' => LIN_DB,
]);
$convert->createLinnaeusDb(LIN_SQL);
$convert->createUsers();
$convert->createTaxa();
$convert->createNames();
$convert->createReferences();
$convert->createDescriptions();
$convert->clearTraits();
$convert->createDistributionTraits();
$convert->createCropResourcesTraits();
$convert->createSpeciesResourcesTraits();
$convert->createSpecificResourcesTraits();
$convert->createGeneralTraits();
$convert->createBiometricsTraits();
$convert->createForagingRangeTraits();
$convert->sortTraits();
echo "Ready to rock!\n";

class Convert
{
    private $sourcePdo;
    private $sourceDb;
    private $sourceDbTable = 'raw';
    
    private $linPdo;
    private $linDb;
    
    private $projectId = 1;
    private $languageId = 26;
    private $nl = '';
    
    public static $ranks = [
        'familia' => ['id' => 56, 'projectId' => 2],
        'subfamilia' => ['id' => 57, 'projectId' => 3],
        'genus' => ['id' => 63, 'projectId' => 4],
        'subgenus' => ['id' => 65, 'projectId' => 5],
        'species' => ['id' => 75, 'projectId' => 6]
    ];
    
    
    public function setDbs ($db)
    {
        $this->sourceDb = $db['fmp'];
        $this->linDb = $db['lin'];
        
        $sourceDsn = 'mysql:host=' . $db['host'] . ';dbname=' . $this->sourceDb . ';';
        $linDsn = 'mysql:host=' . $db['host'] . ';dbname=' . $this->linDb . ';';
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'"
        ];
        $this->sourcePdo = new PDO($sourceDsn, $db['user'], $db['pw'], $options);
        $this->linPdo = new PDO($linDsn, $db['user'], $db['pw'], $options);
    }
    
    public function createLinnaeusDb ($sql)
    {
        if (!file_exists($sql)) {
            throw new Exception('Cannot find Linnaeus dump at ' . $sql);
        }
        $this->linPdo->exec(file_get_contents($sql));
        $this->linPdo->exec('ALTER DATABASE `linnaeus_ng_bees` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci');
    }
    
    public function createForagingRangeTraits ()
    {
        $groupName = 'Foraging range (km)';
        $groupTextId = $this->getTextId($groupName);
        $stmt = $this->linPdo->prepare('
			INSERT INTO `traits_groups`
			(project_id, sysname, name_tid, show_show_all_link, show_in_search, created)
			VALUES (1, ?, ?, 1, 1, NOW())');
        $stmt->execute([$groupName, $groupTextId]);
        $groupId = $this->linPdo->lastInsertId();
        
        foreach (self::$foragingRange as $col => $trait) {
            if (!$this->sourceColumnExists($col)) {
                die("$col column does not exist in source database!");
            }
            $textId = $this->getTextId($trait);
            $q = '
			  	INSERT INTO `traits_traits`
		  		(project_id, trait_group_id, project_type_id, sysname, name_tid, description_tid,
	  			can_select_multiple, can_include_comment, can_be_null, can_have_range, created)
  				VALUES (?, ?, 2, ?, ?, ?, 0, 1, 0, 0, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $groupId, $trait, $textId, $textId]);
            $traitId = $this->linPdo->lastInsertId();
            
            $taxa = $this->getAllTaxa([$col]);
            foreach ($taxa as $i => $row) {
                if (!empty($row[$col])) {
                    $this->setNumericalTraitValue([$row[$col]], $traitId, $row['id']);
                }
            }
        }
    }
    
    public function createBiometricsTraits ()
    {
        $types = [
            'f' => 'Female',
            'm' => 'Male',
            'w' => 'Worker',
        ];
        foreach ($types as $type => $label) {
            $groupName = 'Biometrics - ' . $label;
            $groupTextId = $this->getTextId($groupName);
            $stmt = $this->linPdo->prepare('
				INSERT INTO `traits_groups`
				(project_id, sysname, name_tid, show_show_all_link, show_in_search, created)
				VALUES (?, ?, ?, 1, 1, NOW())');
            $stmt->execute([$this->projectId, $groupName, $groupTextId]);
            $groupId = $this->linPdo->lastInsertId(); // Female
            
            foreach (self::$biometrics as $traitLabel => $traits) {
                $traitId = $this->getTextId($traitLabel);
                $this->setBiometricsType($traits, $type);
                
                // Two types of traits: min-max and mean
                $labelMinMax = $traitLabel . ' - range (mm)';
                $labelMinMaxId = $this->getTextId($labelMinMax);
                $q = '
					INSERT INTO `traits_traits`
					(project_id, trait_group_id, project_type_id, sysname, name_tid, description_tid,
					can_select_multiple, can_include_comment, can_be_null, can_have_range, created)
					VALUES (?, ?, 2, ?, ?, ?, 0, 1, 0, ?, NOW())';
                $stmt = $this->linPdo->prepare($q);
                $stmt->execute([$this->projectId, $groupId, $labelMinMax, $labelMinMaxId, $labelMinMaxId, 1]);
                $minMaxId = $this->linPdo->lastInsertId();
                
                $labelMean = $traitLabel . ' - mean (mm)';
                $labelMeanId = $this->getTextId($labelMean);
                
                $stmt = $this->linPdo->prepare($q);
                $stmt->execute([$this->projectId, $groupId, $labelMean, $labelMeanId, $labelMeanId, 0]);
                $meanId = $this->linPdo->lastInsertId();
                
                foreach ($this->getAllTaxa($traits) as $i => $row) {
                    // Min/max
                    if (!empty($row['min'])) {
                        $this->setNumericalTraitValue([$row['min'], $row['max']], $minMaxId, $row['id']);
                    }
                    // Mean
                    if (!empty($row['mean'])) {
                        $this->setNumericalTraitValue([$row['mean']], $meanId, $row['id']);
                    }
                }
            }
        }
    }
    
    private function setBiometricsType (&$traits, $type)
    {
        foreach ($traits as $k => $v) {
            $col = sprintf($v, $type);
            // Ugh, sometimes column has X in name, sometimes it doesn't
            if (!$this->sourceColumnExists($col)) {
                $col = str_ireplace('x', '', $col);
            }
            $tmp[$col] = $k;
        }
        $traits = $tmp;
        return $traits;
    }
    
    public function createSpeciesResourcesTraits ()
    {
        $this->createTraits(
            'Species resources',
            [
                'Macro-environment' => [
                    'traits' => self::$macroEnvironment,
                    'row' => 'Macroenvironment',
                ],
                'Headline resources' => [
                    'traits' => self::$headlineResources,
                    'row' => 'Headline Resources',
                ],
                'Feeding category' => [
                    'traits' => self::$feedingCategory,
                    'row' => 'Feeding Category',
                ],
                'Structural/physical resources' => [
                    'traits' => self::$structuralPhysicalResources,
                    'row' => 'Structural/Physical Resources',
                ],
            ]
            );
    }
    
    public function createSpecificResourcesTraits ()
    {
        $this->createTraits(
            'Specific resources',
            [
                'Detritus resource' => [
                    'traits' => self::$detritisResources,
                    'row' => 'Specific Detritus Resource',
                ],
                'Prey/parasite resources' => [
                    'traits' => self::$preyResources,
                    'row' => 'Specific Prey_Parasite Resources',
                ],
                'Vegetation resources' => [
                    'traits' => self::$vegetationResources,
                    'row' => 'Specific Vegetation Resource',
                ],
            ]
            );
    }
    
    public function createGeneralTraits ()
    {
        $groupName = 'General traits';
        $this->createTraits(
            $groupName,
            [
                'Lectic status (Müller & Kuhlmann)' => [
                    'traits' => $this->getDistinctSourceValues('Lecty (M&K)'),
                    'row' => 'Lecty (M&K)',
                ],
                'Lectic status (Cane & Sipes)' => [
                    'traits' => $this->getDistinctSourceValues('Lecty (Cane & Sipes)'),
                    'row' => 'Lecty (Cane & Sipes)',
                ],
                'Lectic status (Robertson)' => [
                    'traits' => $this->getDistinctSourceValues('Lecty'),
                    'row' => 'Lecty',
                ],
                'Preferred plant family' => [
                    'traits' => $this->getDistinctSourceValues('Plant family (Lecty)'),
                    'row' => 'Plant family (Lecty)',
                ],
                'Mode of pollen transport' => [
                    'traits' => $this->getDistinctSourceValues('Mode of Pollen transport'),
                    'row' => 'Mode of Pollen transport',
                ],
                'Pollen moisture' => [
                    'traits' => $this->getDistinctSourceValues('Pollen moisture'),
                    'row' => 'Pollen moisture',
                ],
                'Body form' => [
                    'traits' => $this->getDistinctSourceValues('Form'),
                    'row' => 'Form',
                ],
                'Overwintering phase' => [
                    'traits' => $this->getDistinctSourceValues('Overwintering phase'),
                    'row' => 'Overwintering phase',
                ],
                'Sociality' => [
                    'traits' => $this->getDistinctSourceValues('Sociality'),
                    'row' => 'Sociality',
                ],
                'Nesting trait' => [
                    'traits' => $this->getDistinctSourceValues('Nseting trait'),
                    'row' => 'Nseting trait',
                ],
                'Nest strategy' => [
                    'traits' => $this->getDistinctSourceValues('Pollen storer'),
                    'row' => 'Pollen storer',
                ],
                'Nest site' => [
                    'traits' => $this->getDistinctSourceValues('Nest site'),
                    'row' => 'Nest site',
                ],
                'Buzz pollinator' => [
                    'traits' => $this->getDistinctSourceValues('Buzz pollinator'),
                    'row' => 'Buzz pollinator',
                ],
                'Voltinism' => [
                    'traits' => $this->getDistinctSourceValues('Voltinism'),
                    'row' => 'Voltinism',
                ],
                'Tongue length' => [
                    'traits' => $this->getDistinctSourceValues('Tongue length guild'),
                    'row' => 'Tongue length guild',
                ],
            ]
            );
        $this->createTraitsMultiColumn($groupName, 'Flowers visited', self::$flowersVisited);
        $this->createTraitsMultiColumn($groupName, 'Flight period', self::$flightPeriod);
        $this->createTraitsMultiColumn($groupName, 'Habitat types', self::$habitatTypes);
        $this->createColonySizeTrait($groupName);
    }
    
    public function getDistinctSourceValues ($column)
    {
        $stmt = $this->sourcePdo->query("
			SELECT DISTINCT `$column`
			FROM `raw`
			WHERE `$column` != '' AND `$column` IS NOT NULL
			ORDER BY `$column`");
        $result = $stmt->fetchAll();
        return !empty($result) ? array_column($result, $column) : null;
    }
    
    
    private function createColonySizeTrait ($groupName)
    {
        $category = 'Colony size';
        $traitTextId = $this->getTextId($category);
        $labelTextId = $this->getTextId("$groupName — $category");
        $q = '
			INSERT INTO `traits_traits`
			(project_id, trait_group_id, project_type_id, sysname, name_tid, code_tid, description_tid,
			can_include_comment, can_be_null, created)
			VALUES (?, ?, 1, ?, ?, ?, ?, 1, 1, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$this->projectId, $this->getTraitGroupId($groupName),
            $category, $traitTextId, $labelTextId, $labelTextId]);
        $traitId = $this->linPdo->lastInsertId();
        
        $sort = 0;
        foreach (self::$colonySize as $range) {
            $textId = $this->getTextId($range);
            $sort++;
            $q = '
				INSERT INTO `traits_values`
				(project_id, trait_id, string_value, string_label_tid, show_order, created)
				VALUES (?, ?, ?, ?, ?, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $traitId, $range, $textId, $sort]);
        }
        
        $taxa = $this->getAllTaxa($category);
        foreach ($taxa as $i => $row) {
            if (!empty($row[$category]) && trim($row[$category]) != 'n/a') {
                foreach (self::$colonySize as $range) {
                    if ($this->rangeOverlapsRange($row[$category], $range)) {
                        $this->setTextTraitValue($range, $traitId, $row['id']);
                    }
                }
            }
        }
    }
    
    public function rangeOverlapsRange ($a, $b)
    {
        $tmp = explode('-', $b);
        if (count($tmp) == 2) {
            list($minB, $maxB) = $tmp;
        } else {
            $minB = strtok($tmp[0], ' ');
            $maxB = 1000;
        }
        $tmp = explode('-', $a);
        if (count($tmp) == 2) {
            list($minA, $maxA) = $tmp;
        } else {
            $minA = strtok($tmp[0], ' ');
            // When "or more", set max to same as comparison; else min = max
            $maxA = $maxB >= $minA && strlen($minA) < strlen($a) ? $maxB : $minA;
        }
        if (($minB <= $minA && $minA <= $maxB) || ($minB <= $maxA && $maxA <= $maxB)) {
            return true;
        }
        return false;
    }
    
    public function sortTraits ()
    {
        $stmt = $this->linPdo->query('SELECT id FROM traits_traits ORDER BY trait_group_id, sysname');
        $traits = $stmt->fetchAll();
        $stmt = $this->linPdo->prepare('UPDATE traits_traits SET show_order = ? WHERE id = ?');
        foreach ($traits as $i => $row) {
            $stmt->execute([$i, $row['id']]);
        }
    }
    
    private function createFlowersVisitedTraits ($groupName)
    {
        $category = 'Flowers visited';
        $traitTextId = $this->getTextId($category);
        $labelTextId = $this->getTextId("$groupName — $category");
        $q = '
			INSERT INTO `traits_traits`
			(project_id, trait_group_id, project_type_id, sysname, name_tid, code_tid, description_tid,
			can_include_comment, can_be_null, created)
			VALUES (?, 1, 1, ?, ?, ?, ?, 1, 1, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$this->projectId, $category, $traitTextId, $labelTextId, $labelTextId]);
        $traitId = $this->linPdo->lastInsertId();
        
        $sort = 0;
        foreach (self::$flowersVisited as $col => $family) {
            if (!$this->sourceColumnExists($col)) {
                die("$col column does not exist in source database!");
            }
            $textId = $this->getTextId($family);
            $q = '
				INSERT INTO `traits_values`
				(project_id, trait_id, string_value, string_label_tid, show_order, created)
				VALUES (?, ?, ?, ?, ?, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $traitId, $family, $textId, $sort]);
        }
        
        $taxa = $this->getAllTaxa(self::$flowersVisited);
        foreach ($taxa as $i => $row) {
            foreach (self::$flowersVisited as $family) {
                if (!empty($row[$family])) {
                    $this->setTextTraitValue($family, $traitId, $row['id']);
                }
            }
        }
    }
    
    private function createTraitsMultiColumn ($groupName, $category, $columns = [])
    {
        $traitTextId = $this->getTextId($category);
        $labelTextId = $this->getTextId("$groupName — $category");
        $q = '
			INSERT INTO `traits_traits`
			(project_id, trait_group_id, project_type_id, sysname, name_tid, code_tid, description_tid,
			can_include_comment, can_be_null, created)
			VALUES (?, ?, 1, ?, ?, ?, ?, 1, 1, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$this->projectId, $this->getTraitGroupId($groupName), $category,
            $traitTextId, $labelTextId, $labelTextId]);
        $traitId = $this->linPdo->lastInsertId();
        
        $sort = 0;
        foreach ($columns as $column => $label) {
            if (!$this->sourceColumnExists($column)) {
                die("$column column does not exist in source database!");
            }
            $textId = $this->getTextId($label);
            $q = '
				INSERT INTO `traits_values`
				(project_id, trait_id, string_value, string_label_tid, show_order, created)
				VALUES (?, ?, ?, ?, ?, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $traitId, $label, $textId, $sort]);
        }
        
        $taxa = $this->getAllTaxa($columns);
        foreach ($taxa as $i => $row) {
            foreach ($columns as $label) {
                if (!empty($row[$label])) {
                    $this->setTextTraitValue($label, $traitId, $row['id']);
                }
            }
        }
    }
    
    private function getTraitGroupId ($groupName)
    {
        $stmt = $this->linPdo->prepare('SELECT `id` FROM `traits_groups` WHERE `sysname` = ?');
        $stmt->execute([$groupName]);
        $row = $stmt->fetch();
        return isset($row['id']) ? $row['id'] : null;
    }
    
    private function createTraits ($groupName, $data)
    {
        $groupTextId = $this->getTextId($groupName);
        $stmt = $this->linPdo->prepare('
			INSERT INTO `traits_groups`
			(project_id, sysname, name_tid, show_show_all_link, show_in_search, created)
			VALUES (1, ?, ?, 1, 1, NOW())');
        $stmt->execute([$groupName, $groupTextId]);
        $traitGroupId = $this->linPdo->lastInsertId();
        
        $taxa = $this->getAllTaxa(array_column($data, 'row'));
        
        foreach ($data as $category => $traits) {
            // Add trait
            $traitTextId = $this->getTextId($category);
            $labelTextId = $this->getTextId("$groupName — $category");
            $q = '
				INSERT INTO `traits_traits`
				(project_id, trait_group_id, project_type_id, sysname, name_tid, code_tid, description_tid,
				can_include_comment, can_be_null, created)
				VALUES (?, ?, 1, ?, ?, ?, ?, 1, 1, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $traitGroupId, $category, $traitTextId, $labelTextId, $labelTextId]);
            $traitId = $this->linPdo->lastInsertId();
            
            $sort = 0;
            foreach ($traits['traits'] as $trait) {
                $sort++;
                $textId = $this->getTextId($trait);
                $q = '
					INSERT INTO `traits_values`
					(project_id, trait_id, string_value, string_label_tid, show_order, created)
					VALUES (?, ?, ?, ?, ?, NOW())';
                $stmt = $this->linPdo->prepare($q);
                $stmt->execute([$this->projectId, $traitId, $trait, $textId, $sort]);
            }
            
            foreach ($taxa as $i => $row) {
                if (!empty($row[$traits['row']])) {
                    foreach (array_map('trim', explode($this->nl, $row[$traits['row']])) as $line) {
                        if (in_array($line, $traits['traits'])) {
                            $this->setTextTraitValue($line, $traitId, $row['id']);
                        }
                    }
                }
            }
        }
    }
    
    public function createCropResourcesTraits ()
    {
        $groupTextId = $this->getTextId('Crop resources');
        $stmt = $this->linPdo->prepare('
			INSERT INTO `traits_groups`
			(project_id, sysname, name_tid, show_show_all_link, show_in_search, created)
			VALUES (1, ?, ?, 1, 1, NOW())');
        $stmt->execute(['Crop resources', $groupTextId]);
        $traitGroupId = $this->linPdo->lastInsertId();
        
        foreach (self::$cropResources as $category => $resources) {
             // Add trait
            $traitTextId = $this->getTextId($category);
            $labelTextId = $this->getTextId("Crop resources — $category");
            $q = '
				INSERT INTO `traits_traits`
				(project_id, trait_group_id, project_type_id, sysname, name_tid, code_tid, description_tid,
				can_include_comment, can_be_null, created)
				VALUES (?, ?, 1, ?, ?, ?, ?, 1, 1, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $traitGroupId, $category, $traitTextId, $labelTextId, $labelTextId]);
            $traitId = $this->linPdo->lastInsertId();
            
            $sort = 0;
            // Add trait values
            foreach ($resources as $resource) {
                $sort++;
                $textId = $this->getTextId($resource);
                $q = '
					INSERT INTO `traits_values`
					(project_id, trait_id, string_value, string_label_tid, show_order, created)
					VALUES (?, ?, ?, ?, ?, NOW())';
                $stmt = $this->linPdo->prepare($q);
                $stmt->execute([$this->projectId, $traitId, $resource, $textId, $sort]);
            }
            
            $taxa = $this->getAllTaxa(['Specific crop resource' => 'resources']);
            foreach ($taxa as $i => $row) {
                if (!empty($row['resources'])) {
                    foreach (array_map('trim', explode($this->nl, $row['resources'])) as $line) {
                        if (in_array($line, self::$cropResources[$category])) {
                            $this->setTextTraitValue($line, $traitId, $row['id']);
                        }
                    }
                }
            }
        }
    }
    
    public function createReferences ()
    {
        $taxa = $this->getAllTaxa([
            'Reference List' => 'refs',
        ]);
        
        $this->linPdo->query('TRUNCATE TABLE literature2');
        $this->linPdo->query('TRUNCATE TABLE literature_taxa');
        
        $q1 = 'INSERT INTO literature2 (id, project_id, author, date, label, created)
			VALUES (null, ' . $this->projectId. ', ?, ?, ?, NOW())';
        $stmt1 = $this->linPdo->prepare($q1);
        
        $q2 = 'INSERT INTO literature_taxa (id, project_id, taxon_id, literature_id, created)
			VALUES (null, ' . $this->projectId. ', ?, ?, NOW())';
        $stmt2 = $this->linPdo->prepare($q2);
        
        foreach ($taxa as $i => $row) {
            $linked = [];
            foreach (array_unique(explode($this->nl, $row['refs'])) as $r) {
                if (!empty($r)) {
                    $reference = $this->parseReference($r);
                    if (strlen($reference['author']) > 5) {
                        $literatureId = $this->getLiteratureId($reference);
                        if (!$literatureId) {
                            $stmt1->execute(array_values($reference));
                            $literatureId = $this->linPdo->lastInsertId();
                        }
                        if (!in_array($literatureId, $linked)) {
                            $stmt2->execute([$row['id'], $literatureId]);
                            $linked[] = $literatureId;
                        }
                    }
                }
            }
        }
        
        //print_r($references);
    }
    
    private function getLiteratureId ($reference = [])
    {
        $q = 'SELECT id FROM literature2 WHERE author = ? AND date = ? AND label = ? AND
			project_id = ' . $this->projectId;
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute(array_values($reference));
        $row = $stmt->fetch();
        return !empty($row['id']) ? $row['id'] : false;
    }
    
    private function parseReference ($reference)
    {
        $author = $year = $title = '';
        if (preg_match('/\b\d{4}\b/', $reference, $matches)) {
            $year = $matches[0];
        } else if (preg_match('/\b\d{4}[a-z]\b/', $reference, $matches)) {
            $year = $matches[0];
        }
        if (!empty($year)) {
            $tmp = explode($year, $reference);
            list($author, $title) = $tmp;
            // Add extra bits missing if year appears in title
            if (count($tmp) > 2) {
                for ($i = 2; $i < count($tmp); $i++) {
                    $title .= $year . $tmp[$i];
                }
            }
            // Last resort: store everything under author
        } else {
            $author = $reference;
        }
        return
        [
            'author' => rtrim($author, ', (-'),
            'year' => $year,
            'title' => ltrim($title, ' -.,):–'),
        ];
    }
    
    public function clearTraits ()
    {
        foreach (['traits_groups', 'traits_traits', 'traits_values', 'traits_taxon_freevalues',
            'traits_project_types', 'traits_taxon_values', 'text_translations'] as $table) {
            $this->linPdo->query("TRUNCATE TABLE `$table`");
        }
        $this->linPdo->query('INSERT INTO `traits_project_types` VALUES (1, 1, 2), (2, 1, 11)');
    }
    
    public function createDescriptions ()
    {
        $taxa = $this->getAllTaxa([
            'Description published' => 'description_published',
            'Location of type' => 'description_type_loc',
            'Description' => 'description',
            'Nesting trait' => 'nesting_trait',
            'Lectic Status' => 'lectic_status',
            'World Reference Number' => 'wrn',
            'Notes' => 'notes',
            'Habitat' => 'habitat',
            'ITIS Serial Number' => 'itis',
            'BRC Number' => 'brc',
            'NBN Taxon Key' => 'nbn',
            'CH Number' => 'ch',
            'CZ Number' => 'cz',
            'PL Number' => 'pl',
            'NL Number' => 'nl',
            'Distribution; world' => 'distribution_world',
            'Abundance; world' => 'abundance_world',
            'Conservation status; world' => 'conservation_world',
        ]);
        
        $this->linPdo->query('DELETE FROM content_taxa WHERE page_id IN (1, 2, 3, 4, 5, 7, 8)');
        $q = 'INSERT INTO content_taxa (id, project_id, taxon_id, language_id, page_id, content, publish, created)
			VALUES (null, ' . $this->projectId. ', ?, ' . $this->languageId . ', ?, ?, 1, NOW())';
        $stmt = $this->linPdo->prepare($q);
        
        foreach ($taxa as $i => $row) {
            $id = $row['id'];
            
            $description = '' .
                $this->printSection('Description published', $row['description_published']) .
                $this->printSection('Location of type', $row['description_type_loc']) .
                $this->printSection('Description', $row['description']);
                if ($description != '') {
                    $stmt->execute([$id, 1, $description]);
                }
                
                $status = '' .
                    $this->printSection('Distribution; world', $row['distribution_world']) .
                    $this->printSection('Abundance; world', $row['abundance_world']) .
                    $this->printSection('Conservation status; world', $row['conservation_world']);
                    if ($status != '') {
                        $stmt->execute([$id, 8, $status]);
                    }
                    
                    $nesting = $this->printSection('', $row['nesting_trait']);
                    if ($nesting != '') {
                        $stmt->execute([$id, 2, $nesting]);
                    }
                    
                    $lectic = $this->printSection('', $row['lectic_status']);
                    if ($lectic != '') {
                        $stmt->execute([$id, 3, $lectic]);
                    }
                    
                    $habitat = $this->printSection('', $row['habitat']);
                    if ($habitat != '') {
                        $stmt->execute([$id, 4, $habitat]);
                    }
                    
                    $notes = $this->printSection('', $row['notes']);
                    if ($notes != '') {
                        $stmt->execute([$id, 5, $notes]);
                    }
                    
                    $numbers = '<p>' .
                        '<b>World Reference Number</b>: ' . (!empty($row['wrn']) ? $row['wrn'] : '—') . '<br>' .
                        '<b>ITIS #</b>: ' . (!empty($row['itis']) ? $row['itis'] : '—') . '<br>' .
                        '<b>BRC #</b>: ' . (!empty($row['brc']) ? $row['brc'] : '—') . '<br>' .
                        '<b>NBN Key</b>: ' . (!empty($row['nbn']) ? $row['nbn'] : '—') . '<br>' .
                        '<b>CH #</b>: ' . (!empty($row['ch']) ? $row['ch'] : '—') . '<br>' .
                        '<b>CZ #</b>: ' . (!empty($row['cz']) ? $row['cz'] : '—') . '<br>' .
                        '<b>PL #</b>: ' . (!empty($row['pl']) ? $row['pl'] : '—') . '<br>' .
                        '<b>NL #</b>: ' . (!empty($row['nl']) ? $row['nl'] : '—') .
                        '</p>';
                    $stmt->execute([$id, 7, $numbers]);
        }
    }
    
    public function createDistributionTraits ()
    {
        $groupTextId = $this->getTextId('Distribution');
        $stmt = $this->linPdo->prepare('
			INSERT INTO `traits_groups`
			(id, project_id, sysname, name_tid, show_show_all_link, show_in_search, created)
			VALUES (1, 1, ?, ?, 1, 1, NOW())');
        $stmt->execute(['Distribution', $groupTextId]);
        
        foreach (self::$distributionTraits as $continent => $areas) {
            // Add trait
            $traitTextId = $this->getTextId($continent);
            $labelTextId = $this->getTextId("Distribution — $continent");
            $q = '
				INSERT INTO `traits_traits`
				(project_id, trait_group_id, project_type_id, sysname, name_tid, code_tid, description_tid,
				can_include_comment, can_be_null, created)
				VALUES (?, 1, 1, ?, ?, ?, ?, 1, 1, NOW())';
            $stmt = $this->linPdo->prepare($q);
            $stmt->execute([$this->projectId, $continent, $traitTextId, $labelTextId, $labelTextId]);
            $traitId = $this->linPdo->lastInsertId();
            
            asort($areas);
            $sort = 0;
            // Add trait values
            foreach ($areas as $k => $area) {
                $sort++;
                $col = is_int($k) ? $area : $k;
                // Does source column exist?
                if (!$this->sourceColumnExists($col)) {
                    die("$area column does not exist in source database!");
                }
                $textId = $this->getTextId($area);
                $q = '
					INSERT INTO `traits_values`
					(project_id, trait_id, string_value, string_label_tid, show_order, created)
					VALUES (?, ?, ?, ?, ?, NOW())';
                $stmt = $this->linPdo->prepare($q);
                $stmt->execute([$this->projectId, $traitId, $area, $textId, $sort]);
            }
            
            $taxa = $this->getAllTaxa($areas);
            foreach ($taxa as $i => $row) {
                foreach ($areas as $area) {
                    if (!empty($row[$area])) {
                        $this->setTextTraitValue($area, $traitId, $row['id']);
                    }
                }
            }
        }
    }
    
    private function setTextTraitValue ($traitValue, $traitId, $taxonId)
    {
        $q = 'SELECT id FROM `traits_values` WHERE string_value = ? AND trait_id = ? AND project_id = ?';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$traitValue, $traitId, $this->projectId]);
        $row = $stmt->fetch();
        
        return $this->setTraitValue($taxonId, $row['id']);
    }
    
    private function setNumericalTraitValue ($traitValues, $traitId, $taxonId)
    {
        $min = floatval($traitValues[0]);
        if (count($traitValues) > 1) {
            $max = floatval($traitValues[1]);
        }
        $q = 'INSERT INTO `traits_taxon_freevalues`
			(project_id, taxon_id, trait_id, numerical_value, numerical_value_end, created)
			VALUES (?, ?, ?, ?, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$this->projectId, $taxonId, $traitId, $min, (isset($max) ? $max : null)]);
        return $this->linPdo->lastInsertId();
    }
    
    private function setTraitValue ($taxonId, $traitValueId)
    {
        $q = 'INSERT INTO `traits_taxon_values` (project_id, taxon_id, value_id, created)
			VALUES (?, ?, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$this->projectId, $taxonId, $traitValueId]);
        return $this->linPdo->lastInsertId();
    }
    
    private function getTextId ($string)
    {
        $q = 'SELECT text_id FROM `text_translations` WHERE translation = ? AND language_id = ? AND project_id = ?';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$string, $this->languageId, $this->projectId]);
        
        if ($stmt->rowCount() == 1) {
            $row = $stmt->fetch();
            return $row['text_id'];
        }
        
        $textId = $this->getNextTextId();
        $q = 'INSERT INTO `text_translations` (project_id, text_id, language_id, translation, created)
			VALUES (?, ?, ?, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$this->projectId, $textId, $this->languageId, $string]);
        
        return $textId;
    }
    
    private function getNextTextId ()
    {
        $q = 'SELECT text_id FROM `text_translations` ORDER BY text_id DESC LIMIT 1';
        $stmt = $this->linPdo->query($q);
        $row = $stmt->fetch();
        return (int)$row['text_id'] + 1;
    }
    
    public function createUsers ()
    {
        $q = '
			INSERT INTO `users` (`id`, `username`, `password`, `first_name`, `last_name`, `email_address`,
				`active`, `last_login`, `logins`, `last_password_change`, `created_by`, `last_change`, `created`)
			VALUES
				(?, ?, ?, ?, ?, ?, 1, NULL, 0, NULL, 1, NOW(), NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([1, "sysadmin", password_hash(SYSADMIN_PWD, PASSWORD_DEFAULT), "sys","admin","sys@admin.com"]);
        $stmt->execute([2, "stuart", password_hash(STUART_PWD, PASSWORD_DEFAULT), "Stuart", "Roberts", "spmr@msn.com"]);
    }
    
    public function createNames ()
    {
        $taxa = $this->getAllTaxa([
            'Species synonym' => 'species_synonym',
            'Genus synonym' => 'genus_synonym',
            'Taxonomic remarks' => 'remarks',
            'Authority' => 'author'
        ]);
        
        $this->linPdo->query('DELETE FROM names WHERE id != 1');
        $this->linPdo->query('DELETE FROM content_taxa WHERE page_id = 6');
        
        $q = 'INSERT INTO content_taxa (id, project_id, taxon_id, language_id, page_id, content, created)
			VALUES (null, ' . $this->projectId. ', ?, ' . $this->languageId . ', 6, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        
        foreach ($taxa as $i => $row) {
            $id = $row['id'];
            $names[$id]['valid']['genus'] = $row['genus'];
            $names[$id]['valid']['species'] = $row['species'];
            $names[$id]['valid']['authority'] = $row['authority'];
            $names[$id]['synonym']['species'] = explode($this->nl, $row['species_synonym']);
            $names[$id]['synonym']['genus'] = explode("@", str_replace([',', ';'], '@', $row['genus_synonym']));
            
            // Store as text
            $content = '' .
                $this->printSection('Genus synonyms', $row['genus_synonym']) .
                $this->printSection('Species synonyms', $row['species_synonym']) .
                $this->printSection('Taxonomic remarks', $row['remarks']);
                $stmt->execute([$id, $content]);
        }
        
        // Names: valid species
        $q = 'INSERT INTO names
			(project_id, taxon_id, language_id, type_id, name, uninomial, specific_epithet, authorship,
			name_author, authorship_year, created)
			VALUES
			(?, ?, 123, 1, ?, ?, ?, ?, ?, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        foreach ($names as $id => $d) {
            list($author, $year) = $this->setAuthorAndYear($d['valid']['authority']);
            $name = $d['valid']['genus'] . ' ' . $d['valid']['species'] . ' ' . $d['valid']['authority'];
            $stmt->execute([
                $this->projectId,
                $id,
                $name,
                $d['valid']['genus'],
                $d['valid']['species'],
                $d['valid']['authority'],
                $author,
                $year
            ]);
        }
        
        // Names: valid higher taxa
        $this->linPdo->query('
			INSERT INTO `names` (project_id, language_id, taxon_id, type_id, `name`, uninomial, created)
			SELECT project_id, 123, id, 1, taxon, taxon, NOW() FROM taxa WHERE id > 9999'
            );
        
        // Names: synonyms: not yet...
    }
    
    private function nl2br ($text)
    {
        return str_replace($this->nl, '<br>', $text);
    }
    
    private function printSection ($title, $text = '')
    {
        if ($text != '') {
            $text = '<p>' .
                ($title != '' ? '<b>' . $title .'</b><br>' : '') .
                $this->nl2br($text) . '</p>';
        }
        return $text;
    }
    
    public function createTaxa ()
    {
        $this->createTreeTop();
        $taxa = $this->getAllTaxa();
        foreach (array_unique(array_column($taxa, 'subfamilia')) as $subfamilia) {
            $this->saveTaxon($subfamilia, 'subfamilia');
        }
        foreach (array_unique(array_column($taxa, 'no_subgenus')) as $i => $genus) {
            $this->saveTaxon(
                $genus,
                'genus',
                $this->getTaxonId($taxa[$i]['subfamilia'], 'subfamilia')
                );
        }
        // Oops we have duplicates :(
        $savedSpecies = [];
        foreach (array_column($taxa, 'species') as $i => $species) {
            $hash = $taxa[$i]['no_subgenus'] . ' ' . $species;
            if (!in_array($hash, $savedSpecies)) {
                $this->saveTaxon(
                    [$taxa[$i]['genus'], $species],
                    'species',
                    $this->getTaxonId($taxa[$i]['no_subgenus'], 'genus'),
                    $taxa[$i]['authority'],
                    $taxa[$i]['id']
                    );
                $savedSpecies[] = $hash;
            }
        }
    }
    
    private function getAllTaxa ($additionalColumns = [])
    {
        $q = 'SELECT id, trim(`sub family`) as subfamilia,
			TRIM(genus) as genus, SUBSTRING_INDEX(genus, " ", 1) as no_subgenus,
			TRIM(species) as species, TRIM(authority) as authority';
        if (!empty($additionalColumns)) {
            if (!is_array($additionalColumns)) {
                $additionalColumns = [$additionalColumns];
            }
            foreach ($additionalColumns as $column => $alias) {
                $column = is_int($column) ? $alias : $column;
                $statements[] = "TRIM(`$column`) as `$alias`";
            }
            $q .= ', ' . implode(', ', $statements);
        }
        $q .= ' FROM `raw`';
        $stmt = $this->sourcePdo->query($q);
        return $stmt->fetchAll();
    }
    
    private function getTaxonId ($name, $rank)
    {
        $q = 'SELECT id FROM taxa WHERE taxon = ? AND rank_id = ? AND project_id = 1';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$name, self::$ranks[$rank]['projectId']]);
        $row = $stmt->fetch();
        return !empty($row['id']) ? $row['id'] : false;
    }
    
    private function createTreeTop ()
    {
        $this->linPdo->query('
			INSERT INTO `taxa` (`id`, `project_id`, `taxon`, `parent_id`, `rank_id`, `created`)
			VALUES (9999, 1, "Apidae", NULL, 2, NOW())');
        $this->linPdo->query('
			INSERT INTO names (project_id, taxon_id, language_id, type_id, name, uninomial, created)
			VALUES (1, 9999, 123, 1, "Apidae", "Apidae", NOW())');
    }
    
    private function saveTaxon ($nameParts, $rank, $parentId = 9999, $authorShip = null, $id = null)
    {
        if (!is_array($nameParts)) {
            $nameParts = [$nameParts];
        }
        
        $q = 'INSERT INTO taxa (id, project_id, taxon, author, rank_id, parent_id, created)
			VALUES (?, ?, ?, ?, ?, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([$id, $this->projectId, implode(' ' , $nameParts),  $authorShip,
            self::$ranks[$rank]['projectId'], $parentId]);
        
        $taxonId = is_null($id) ? $this->linPdo->lastInsertId() : $id;
        list($author, $year) = $this->setAuthorAndYear($authorShip);
        
        $q = 'INSERT INTO names (project_id, taxon_id, language_id, type_id, name, uninomial,
			specific_epithet, infra_specific_epithet, authorship, name_author, authorship_year, rank_id, created)
			VALUES (' . $this->projectId. ', ?, 123, 1, ?, ?, ?, ?, ?, ?, ?, ?, NOW())';
        $stmt = $this->linPdo->prepare($q);
        $stmt->execute([
            $taxonId,
            implode(' ' , $nameParts),
            strtok($nameParts[0], ' '),
            isset($nameParts[1]) ? $nameParts[1] : null,
            isset($nameParts[2]) ? $nameParts[2] : null,
            $authorShip,
            $author,
            $year,
            self::$ranks[$rank]['projectId']
        ]);
        
        return $taxonId;
    }
    
    private function sourceColumnExists ($col)
    {
        $stmt = $this->sourcePdo->query("SHOW COLUMNS FROM `{$this->sourceDbTable}` LIKE '$col'");
        return $stmt->rowCount() ? true : false;
    }
    
    private function setAuthorAndYear ($authorship)
    {
        $author = $year = null;
        $authorship = str_replace(['(', ')'], '', $authorship);
        if (strpos($authorship, ',') !== false) {
            $tmp = array_map('trim', explode(',', $authorship));
            $author = $tmp[0];
            $year = $tmp[1];
        } else {
            $tmp = array_map('trim', explode(' ', $authorship));
            if (count($tmp) == 1) {
                $author = $authorship;
            } else {
                $year = array_pop($tmp);
                $author = implode(' ', $tmp);
            }
        }
        return [$author, substr($year, 0, 16)];
    }
    
    public static $distributionTraits = [
        'Biogeography (Europe)' => [
            'Arctic region' => 'Arctic',
            'Boreal region' => 'Boreal',
            'Atlantic region' => 'Atlantic',
            'Continental',
            'Alpine',
            'Pannonian',
            'Mediterranean',
            'Macaronesian',
            'Steppic',
            'Pontic (Black Sea)' => 'Pontic',
            'Anatolian',
            'Desertic' => 'Saharan',
        ],
        'Europe' => [
            'Albania',
            'Andorra',
            'Austria',
            'Azores',
            'Balearic Islands',
            'Belarus',
            'Belgium',
            'Bosnia',
            'Britain' => 'Great-Britain',
            'Bulgaria',
            'Canary Is.' => 'Canary Islands',
            'Channel Is.' => 'Channel Islands',
            'Corsica',
            'Crete',
            'Croatia',
            'Cyclades Is.' => 'Cyclades Islands',
            'Cyprus',
            'Czech R.' => 'Czech Republic',
            'Denmark',
            'Dodecanese Is.' => 'Dodecanese Islands',
            'Estonia',
            'Faroe Is.' => 'Faroe Islands',
            'Finland',
            'France',
            'Germany',
            'Gibraltar',
            'Greece',
            'Hungary',
            'Iceland',
            'Ireland',
            'Italy',
            'Latvia',
            'Liechtenstein',
            'Lithuania',
            'Luxembourg',
            'Macedonia',
            'Madeira',
            'Malta',
            'Moldova',
            'Monaco',
            'Montenegro',
            'N. Aegean Is.' => 'North-Aegean Islands',
            'Netherlands',
            'Norway',
            'Poland',
            'Portugal',
            'Romania',
            'Russia_Eu' => 'Russia (European)',
            'San Marino',
            'Sardinia',
            'Serbia',
            'Sicily',
            'Slovakia',
            'Slovenia',
            'Spain',
            'Sweden',
            'Switzerland',
            'Turkey',
            'Ukraine',
            'Vatican City',
            'Crimea',
            'Yugoslavia',
        ],
        'Africa' => [
            'Algeria',
            'Angola',
            'Benin',
            'Botswana',
            'Burkina Faso',
            'Burundi',
            'Cameroon',
            'Cape Verde',
            'Aentral African Republic' => 'Central African Republic',
            'Chad',
            'Comoros',
            'Congo',
            'Congo (DR)' => 'DR Congo',
            'Djibouti',
            'Egypt',
            'Equatorial Guinea',
            'Eritrea',
            'Ethiopia',
            'Gabon',
            'Gambia',
            'Ghana',
            'Guinea',
            'G. Bissau' => 'Guinea-Bissau',
            'Ivory Coast',
            'Malawi',
            'Mali',
            'Mauritania',
            'Mauritius',
            'Kenya',
            'Lesotho',
            'Liberia',
            'Libya',
            'Madagascar',
            'Morocca' => 'Morocco',
            'Mozambique',
            'Namibia',
            'Niger',
            'Nigeria',
            'Rwanda',
            'Sao Tome',
            'Senegal',
            'Seychelles',
            'S. Leone' => 'Sierra Leone',
            'Socotra',
            'Somalia',
            'South Africa',
            'Sudan',
            'Swaziland',
            'Tanzania',
            'Togo',
            'Tunisia',
            'Uganda',
            'Zambia',
            'Zimbabwe',
        ],
        'Asia' => [
            'Afghanistan',
            'Armenia',
            'Azerbaijan',
            'Bahrain',
            'Bangladesh',
            'Bhutan',
            'Brunei',
            'Cambodia',
            'China',
            'Georgia',
            'India',
            'Indonesia',
            'Iran',
            'Iraq',
            'Israel',
            'Japan',
            'Jordan',
            'Kazakhstan',
            'Kuwait',
            'Kyrgyzstan',
            'Laos',
            'Lebanon',
            'Malaysia',
            'Maldives',
            'Mongolia',
            'Myanmar',
            'Nepal',
            'North Korea',
            'Oman',
            'Pakistan',
            'Philippines',
            'Qatar',
            'Russia',
            'Saudi Arabia',
            'Singapore',
            'South Korea',
            'Sri Lanka',
            'Syria',
            'Taiwan',
            'Tajikistan',
            'Thailand',
            'Timor Leste',
            'Turkey',
            'Turkmenistan',
            'Russia',
            'Turkey',
            'Turkmenistan',
            'UAE' => 'United Arab Emirates',
            'Uzbekistan',
            'Vietnam',
            'West Bank',
            'Yemen',
        ],
        'Oceania' => [
            'Australia',
            'Christmas Island',
            'Cocos',
            'Cook Islands',
            'Federated States of Micronesia',
            'Fiji',
            'French Polynesia',
            'Guam',
            'Kiribati',
            'Marshall Islands',
            'Nauru',
            'New Caledonia',
            'New Zealand',
            'Niue',
            'Norfolk Island',
            'N. Marianas Copy' => 'Northern Mariana Islands',
            'Palau',
            'PNG' => 'Papua New Guinea',
            'Pitcairn',
            'Samoa',
            'Solomon Islands',
            'Tokelau',
            'Tonga',
            'Tuvalu',
            'US Samoa',
            'Vanuatu',
            'Wallis & Futuna',
        ],
        'North America' => [
            'Anguilla',
            'Antigua',
            'Aruba',
            'Bahamas',
            'Barbados',
            'Belize',
            'Bermuda',
            'BVI' => 'British Virgin Islands',
            'Canada',
            'Cayman Is.' => 'Cayman Islands',
            'Costa Rica',
            'Cuba',
            'Dominica',
            'Dominican R.' => 'Dominican Republic',
            'El Salvador',
            'Greenland',
            'Grenada',
            'Guadeloupe',
            'Guatemala',
            'Haiti',
            'Honduras',
            'Jamaica',
            'Martinique',
            'Mexico',
            'Montserrat',
            'Navassa',
            'NL. Antilles' => 'Netherlands Antilles',
            'Nicaragua',
            'Panama',
            'Puerto Rico',
            'St. Barthelemy' => 'Saint Barthelemy',
            'St Kitts & Nevis' => 'Saint Kitts & Nevis',
            'St. Lucia' => 'Saint Lucia',
            'St Martin' => 'Saint Martin',
            'St Pierre' => 'Saint Pierre',
            'St Vincent' => 'Saint Vincent',
            'Trinidad & Tobago',
            'Turks & Caicos',
            'USA' => 'Unites States of America',
            'US Virgin Is.' => 'United States Virgin Islands',
        ],
        'South America' => [
            'Argentina',
            'Bolivia',
            'Brazil',
            'Chile',
            'Colombia',
            'Ecuador',
            'Falkland Is.' => 'Falkland Islands',
            'Fr. Guiana' => 'French Guiana',
            'Guyana',
            'Paraguay',
            'Peru',
            'S. Georgia' => 'South Georgia',
            'Surinam',
            'Uruguay',
            'Venezuela',
        ],
    ];
    
    public static $flowersVisited = [
        'PF_Acanthaceae' => 'Acanthaceae',
        'PF_Aceraceae' => 'Aceraceae',
        'PF_Adoxaceae' => 'Adoxaceae',
        'PF_Agavaceae' => 'Agavaceae',
        'PF_Aizoaceae' => 'Aizoaceae',
        'PF_Alismataceae' => 'Alismataceae',
        'PF_Alliaceae' => 'Alliaceae',
        'PF_Apiaceae' => 'Apiaceae',
        'PF_Aquifoliaceae' => 'Aquifoliaceae',
        'PF_Araceae' => 'Araceae',
        'PF_Araliaceae' => 'Araliaceae',
        'PF_Aristolochiaceae' => 'Aristolochiaceae',
        'PF_Asclepiadaceae' => 'Asclepiadaceae',
        'PF_Asteraceae' => 'Asteraceae',
        'PF_Balsaminaceae' => 'Balsaminaceae',
        'PF_Begoniaceae' => 'Begoniaceae',
        'PF_Berberidaceae' => 'Berberidaceae',
        'PF_Betulaceae' => 'Betulaceae',
        'PF_Boraginaceae' => 'Boraginaceae',
        'PF_Brassicaceae' => 'Brassicaceae',
        'PF_Buddlejaceae' => 'Buddlejaceae',
        'PF_Butomaceae' => 'Butomaceae',
        'PF_Buxaceae' => 'Buxaceae',
        'PF_Campanulaceae' => 'Campanulaceae',
        'PF_Cannabaceae' => 'Cannabaceae',
        'PF_Capparaceae' => 'Capparaceae',
        'PF_Caprifoliaceae' => 'Caprifoliaceae',
        'PF_Caryophyllaceae' => 'Caryophyllaceae',
        'PF_Ceratophyllaceae' => 'Ceratophyllaceae',
        'PF_Chenopodiaceae' => 'Chenopodiaceae',
        'PF_Cistaceae' => 'Cistaceae',
        'PF_Convolvulaceae' => 'Convolvulaceae',
        'PF_Cornaceae' => 'Cornaceae',
        'PF_Crassulaceae' => 'Crassulaceae',
        'PF_Cucurbitaceae' => 'Cucurbitaceae',
        'PF_Cuscutaceae' => 'Cuscutaceae',
        'PF_Diapensiaceae' => 'Diapensiaceae',
        'PF_Dioscoreaceae' => 'Dioscoreaceae',
        'PF_Dipsacaceae' => 'Dipsacaceae',
        'PF_Droseraceae' => 'Droseraceae',
        'PF_Elaeagnaceae' => 'Elaeagnaceae',
        'PF_Empetraceae' => 'Empetraceae',
        'PF_Ericaceae' => 'Ericaceae',
        'PF_Euphorbiaceae' => 'Euphorbiaceae',
        'PF_Fabaceae' => 'Fabaceae',
        'PF_Fagaceae' => 'Fagaceae',
        'PF_Frankeniaceae' => 'Frankeniaceae',
        'PF_Fumariaceae' => 'Fumariaceae',
        'PF_Gentianaceae' => 'Gentianaceae',
        'PF_Geraniaceae' => 'Geraniaceae',
        'PF_Globulariaceae' => 'Globulariaceae',
        'PF_Grossulariaceae' => 'Grossulariaceae',
        'PF_Hippocastanaceae' => 'Hippocastanaceae',
        'PF_Hyacinthaceae' => 'Hyacinthaceae',
        'PF_Hypericaceae' => 'Hypericaceae',
        'PF_Iridaceae' => 'Iridaceae',
        'PF_Juglandaceae' => 'Juglandaceae',
        'PF_Lamiaceae' => 'Lamiaceae',
        'PF_Lauraceae' => 'Lauraceae',
        'PF_Lentibulariaceae' => 'Lentibulariaceae',
        'PF_Liliaceae' => 'Liliaceae',
        'PF_Linaceae' => 'Linaceae',
        'PF_Lythraceae' => 'Lythraceae',
        'PF_Magnoliaceae' => 'Magnoliaceae',
        'PF_Malvaceae' => 'Malvaceae',
        'PF_Menyanthaceae' => 'Menyanthaceae',
        'PF_Monotropaceae' => 'Monotropaceae',
        'PF_Moraceae' => 'Moraceae',
        'PF_Myrtaceae' => 'Myrtaceae',
        'PF_Nymphaeaceae' => 'Nymphaeaceae',
        'PF_Oleaceae' => 'Oleaceae',
        'PF_Onagraceae' => 'Onagraceae',
        'PF_Orchidaceae' => 'Orchidaceae',
        'PF_Orobancaceae' => 'Orobancaceae',
        'PF_Oxalidaeceae' => 'Oxalidaeceae',
        'PF_Paeoniaceae' => 'Paeoniaceae',
        'PF_Papaveraceae' => 'Papaveraceae',
        'PF_Passifloraceae' => 'Passifloraceae',
        'PF_Piperaceae' => 'Piperaceae',
        'PF_Plantaginaceae' => 'Plantaginaceae',
        'PF_Platanaceae' => 'Platanaceae',
        'PF_Plumbaginaceae' => 'Plumbaginaceae',
        'PF_Polemoniaceae' => 'Polemoniaceae',
        'PF_Polygalaceae' => 'Polygalaceae',
        'PF_Polygonaceae' => 'Polygonaceae',
        'PF_Primulaceae' => 'Primulaceae',
        'PF_Punicaceae' => 'Punicaceae',
        'PF_Pyrolaceae' => 'Pyrolaceae',
        'PF_Ranunculaceae' => 'Ranunculaceae',
        'PF_Resedaceae' => 'Resedaceae',
        'PF_Rhamnaceae' => 'Rhamnaceae',
        'PF_Rosaceae' => 'Rosaceae',
        'PF_Rubiaceae' => 'Rubiaceae',
        'PF_Rutaceae' => 'Rutaceae',
        'PF_Salicaceae' => 'Salicaceae',
        'PF_Santalaceae' => 'Santalaceae',
        'PF_Saxifragaceae' => 'Saxifragaceae',
        'PF_Scrophulariaceae' => 'Scrophulariaceae',
        'PF_Solanaceae' => 'Solanaceae',
        'PF_Tamaricaceae' => 'Tamaricaceae',
        'PF_Thymelaeaceae' => 'Thymelaeaceae',
        'PF_Tiliaceae' => 'Tiliaceae',
        'PF_Tropaeolaceae' => 'Tropaeolaceae',
        'PF_Ulmaceae' => 'Ulmaceae',
        'PF_Urticaceae' => 'Urticaceae',
        'PF_Valerianaceae' => 'Valerianaceae',
        'PF_Verbenaceae' => 'Verbenaceae',
        'PF_Violaceae' => 'Violaceae',
        'PF_Viscaceae' => 'Viscaceae',
        'PF_Vitaceae' => 'Vitaceae',
        'PF_Zygophyllaceae' => 'Zygophyllaceae'
    ];
    
    public static $flightPeriod = [
        'Jan' => 'January',
        'Feb' => 'February',
        'Mar' => 'March',
        'Apr' => 'April',
        'May' => 'May',
        'Jun' => 'June',
        'Jul' => 'July',
        'Aug' => 'August',
        'Sep' => 'September',
        'Oct' => 'October',
        'Nov' => 'November',
        'Dec' => 'December',
    ];
    
    public static $habitatTypes = [
        'Coastal & Halophytic Habitats' => 'Coastal and halophytic habitats',
        'Coastal sand dunes & Continental dunes' => 'Coastal sand dunes and continental dunes',
        'Freshwater Habitats' => 'Freshwater habitats',
        'Temperate Heath & Scrub' => 'Temperate heath and scrub',
        'Sclerophyllous Scrub' => 'Sclerophyllous scrub',
        'Natural & semi-Natural Grasslands' => 'Natural and semi-natural grasslands',
        'Raised Bogs and Mires and Fens' => 'Raised bogs and mires and fens',
        'Rocky habitats and caves' => 'Rocky habitats and caves',
        'Forests' => 'Forests and woodlands',
        'Anthropogenic habitats' => 'Anthropogenic habitats',
    ];
    
    public static $cropResources = [
        'VEGETABLE CROPS' => [
            'Abelmoschus esculentus Okra, Gumbo',
            'Cajanus cajan Pigeon pea, Cajan pea, Congo bean',
            'Canavalia sp.',
            'Canavalia ensiformis Horse bean, Sword bean, (Pulses NES)',
            'Canavalia gladiata Sword bean',
            'Canavalia rosea (=C. maritima) Bay bean, Beach bean',
            'Canavalia cathartica (=C. microcarpa, C. virosa) Wild bean',
            'Capsicum sp.',
            'Capsicum annuum Chile pepper, Red pepper, Bell pepper, Green pepper',
            'Capsicum frutescens Cayenne, African birdseye',
            'Chenopodium quinoa Quinoa',
            'Cicer arietinum Bengal gram, Chickpea, Gram, Garbanzo bean',
            'Citrullus lanatus Watermelon',
            'Cucumis sp.',
            'Cucumis melo Cantaloupe, Melon',
            'Cucumis sativus Cucumber, Gherkin',
            'Cucurbita sp.',
            'Cucurbita maxima Pumpkin, Winter Squash',
            'Cucurbita mixta Pumpkin',
            'Cucurbita moschata Butternut squash, "dickinson" pumpkin',
            'Cucurbita pepo Pumpkin, Squash, Gourd, Marros, Zucchini, Acorn squash, Yellow summer squash',
            'Cyamopsis tetragonoloba Cluster bean, Guar bean, Goa bean',
            'Lablab purpureus (=Dolichos lablab) Hyacinth bean, Horse-gram, Black Bean, Haricot, Hyacinth Bean, Lablab',
            'Fagopyrum esculentum Buckwheat',
            'Lens culinaris (=Lens esculenta) Lentils',
            'Lycopersicon esculentum Tomato',
            'Mucuna pruriens (= Stizolobium spp.) Velvet bean, Buffalo Bean, Cow Itch, Hell Fire Bean, Itchy Bean',
            'Phaseolus sp.',
            'Phaseolus spp. (P. vulgaris, P. lunatus) Kidney bean, Haricot bean, String bean',
            'Phaseolus vulgaris Kidney bean, Haricot bean, String bean',
            'Phaseolus lunatus Lima bean',
            'Phaseolus aureus Kidney bean, Haricot bean',
            'Phaseolus coccineus Runner bean',
            'Phaseolus acutifolius Tepary bean',
            'Pisum sativum Garden pea, Field pea',
            'Pisum arvense Garden pea, Field pea',
            'Psophocarpus tetragonolobus Winged bean, Goa bean (Pulses NES)',
            'Solanum melongena Eggplant, Aubergine',
            'Vigna sp.',
            'Vigna aconitifolia (Phaseolus aconitifolius) Mat bean, Moth bean',
            'Vigna angularis (=Phaseolus angularis) Adzuki bean',
            'Vigna radiata (=Phaseolus aureus, P. mungo) Mung bean',
            'Vigna umbellata (=Phaseolus calcaratus) Rice bean',
            'Vigna unguiculata (=Dolichos biflorus) Cowpea, Blackeye pea, Blackeye bean, Crowder Pea,',
            'Vigna subterranea (=Voandzeia subterranea) Bambara bean, Bambara groundnuts, Earth pea',
        ],
        'FRUIT CROPS' => [
            'Actinidia deliciosa Kiwifruit',
            'Annona squamosa Atemoya, Cherimoya, Custard apple',
            'Arbutus unedo Tree-strawberry',
            'Artocarpus altilis (= A. incisus, A. incircus, A. communis) Breadfruit',
            'Artocarpus heterophyllus (=A integrifolius, A. integrifolia) Jackfruit',
            'Asimina triloba Pawpaw, Indiana banana',
            'Averrhoa carambola Carambola, Starfruit',
            'Carica papaya Papaya',
            'Citrus spp. Citrus',
            'Citrus aurantifolia Key lime, Lime',
            'Citrus aurantium (=C. myrtifolia) Seville Orange, Chinotto',
            'Citrus bergamia Bergamot',
            'Citrus limetta Sweet lemon',
            'Citrus limon Lemon',
            'Citrus maxima Pomelo',
            'Citrus medica (var. cedrata) Citron',
            'Citrus paradisi (=C. grandis) Grapefruit',
            'Citrus reticulata Mandarin, Tangerine, Clementine',
            'Citrus sinensis Orange',
            'Citrus unshiu Satsuma',
            'Fortunella japonica Kumquat',
            'Chrysophyllum cainito (=Achras caimito) Star apple, Cainito',
            'Crataegus azarolus (=C. ruscionensis) Azarole, Azzeruolo',
            'Dimocarpus longan (=Euphoria longan, E. longana, Nephelium longana) Longan, Lungan',
            'Diospyros sp.',
            'Diospyros kaki Persimmon',
            'Diospyros virginiana Persimmon',
            'Durio zibethinus Durian',
            'Eriobotrya japonica (=Mespilus japonicus) Loquat, japanese plum, Japanese medlar',
            'Feijoa sellowiana Feijoa',
            'Ficus carica Fig',
            'Fragaria ssp. Strawberry',
            'Litchi chinensis Litchi, Lychee',
            'Malus domestica Apple',
            'Mammea americana (=Mamea americana) Mammee',
            'Mangifera indica Mango',
            'Manikara zapotilla (=Manikara zapota, Achras sapota) Sapodilla',
            'Mespilus germanica Medlar',
            'Nephelium lappaceum Rambutan',
            'Opuntia ficus-indica Prickly pear',
            'Passiflora edulis Passion fruit, Maracuja',
            'Persea americana Avocado',
            'Pouteria sapota (Calocarpum sapota, C. mammosum, Pouteria mammosa) Sapote, Mamey colorado',
            'Prunus sp.',
            'Prunus domestica Plum, Greengage, Mirabelle',
            'Prunus spinosa Sloe',
            'Prunus persica, Peach,',
            'Persica laevis Nectarine',
            'Prunus avium Sweet cherry',
            'Prunus armeniaca Apricot',
            'Prunus cerasus Sour cherry',
            'Psidium guajava Guava, Guayaba',
            'Punica granatum Pomegranate',
            'Pyrus communis Pear',
            'Ribes nigrum Black currant',
            'Ribes rubrum Red currant',
            'Rosa spp. (R. canina agg.) Rose hips, Dogroses',
            'Rubus sp.',
            'Rubus idaeus, Raspberry,',
            'Rubus fruiticosus Blackberry',
            'Rubus chamaemorus Clouderry',
            'Rubus  flagellaris Northern Dewberry',
            'Rubus trivalis Southern Dewberry',
            'Sambucus nigra Elderberry',
            'Solanum quitoense Naranjillo',
            'Sorbus aucuparia Rowanberry',
            'Sorbus domestica Service-apple',
            'Spondias ssp., Hog plum, Mombin',
            'Spondias mombin Hog plum, Mombin',
            'Spondias tuberosa Hog plum, Mombin',
            'Tamarindus indica Tamarind',
            'Vaccinium sp.',
            'Vaccinium corymbosum Highbush blueberry',
            'Vaccinium angustifolium Lowbush blueberry',
            'Vaccinium virgatum (=V. ashei) Rabbiteye blueberry',
            'Vaccinium myrtillus Bilberry',
            'Vaccinium macrocarpon American cranberry',
            'Vaccinium oxycoccus European cranberry',
            'Vitis vinifera Table grape, Vine grape',
            'Zizyphus jujuba Jujube',
        ],
        'NUT CROPS' => [
            'Amygdalus communis Almond',
            'Anacardium occidentale Cashew nut, Cashewapple',
            'Arachis hypogea Peanut, Groundnut',
            'Bertholletia excelsa Brazil nut, Para nut, Cream nut',
            'Castanea sativa Chestnut',
            'Macadamia ternifolia Macadamia (Nuts NES)',
        ],
        'EDIBLE OIL & PROTEINACEOUS CROPS' => [
            'Brassica sp.',
            'Brassica alba Mustard seeds',
            'Brassica hirta Mustard seeds',
            'Brassica nigra Mustard seeds',
            'Brassica napus oleifera Rapeseed, Oilseed rape',
            'Brassica rapa (=B. campestris) Turnip rape, Canola',
            'Sinapis sp.',
            'Sinapis alba Mustard seeds',
            'Sinapis nigra Mustard seeds',
            'Carthamus tinctorius safflower',
            'Cocos nucifera Coconut',
            'Elaeis guineensis Oil palm',
            'Glycine sp.',
            'Glycine max Soybean',
            'Glycine soja Soybean',
            'Gossypium sp.',
            'Gossypium hirsutum Upland cotton',
            'Gossypium barbadense Pima cotton',
            'Gossypium arboreum Tree cotton',
            'Gossypium herbaceum Levant cotton',
            'Helianthus annuus Sunflower seeds',
            'Linum usitatissimum Linseed, Flax',
            'Olea europaea Olive',
            'Sesamum indicum Sesame',
            'Vicia faba Broad bean, Faba bean, Field bean, Horse bean',
            'Vitellaria paradoxa (= Butyrospermum paradoxum) Karite nuts, Sheanuts',
        ],
        'STIMULANT CROPS' => [
            'Coffea sp.',
            'Coffea arabica Coffee',
            'Coffea canephora Coffee',
            'Cola sp.',
            'Cola nitida Cola nut, Kola nut',
            'Cola vera Cola nut, Kola nut',
            'Cola acuminata Cola nut, Kola nut',
            'Theobroma cacao Cocoa',
        ],
        'SPICES & CONDIMENTS' => [
            'Afromomum melegueta Grains of paradise',
            'Anethum graveolens Dill',
            'Carum carvi Caraway',
            'Coriandrum sativum Coriander',
            'Cuminum cymimum Cumin',
            'Elettaria cardamomum Cardamom',
            'Illicium verum Star anise',
            'Foeniculum vulgare Fennel seed',
            'Myristica fragrans Nutmeg, Mace',
            'Pimenta dioica (=P. officinalis, P. dioica) Allspice, Pimento',
            'Piper nigrum Pepper',
            'Piper longum Pepper',
            'Pimpinella anisum Anise',
            'Vanilla sp.',
            'Vanilla planifolia Vanilla',
            'Vanilla pompona Vanilla',
        ],
        'FODDER CROPS' => [
            'Coronilla varia',
            'Lotus corniculatus',
            'Medicago sativa',
            'Onobrychis viciifolia',
            'Trifolium pratense',
            'Trifolium repens',
        ],
        'COSMETIC CROPS' => [
            'Borage (Borago officinalis)',
            'Marigold (Calendula sp)'
        ]
    ];
    
    public static $detritisResources = [
        'Vegetation-litter',
        'Dead-wood-sap-layer-off-tree',
        'Dead wood-hard-timber-off-tree',
        'Resin',
        'Aculeate nests',
        'Spider-webs',
        'Snail shells',
        'Bat-roosts',
        'Bird-nests/roosts',
        'Mammal-nests',
        'Dung',
        'Carrion',
        'Fine sand',
        'Wet mud',
    ];
    
    public static $feedingCategory = [
        'Herbivore',
        'Predator/parasite',
        'Detrivore',
        'Omnivore',
        'Specialist',
        'Widespread Resource Species',
    ];
    
    public static $habitatSpecialisation = [
        'Narrow (1 Habitat type)',
        'Intermediate (2 - 4 habitat types)',
        'Broad (5 or more habitat types)'
    ];
    
    public static $headlineResources = [
        'Aquatic Habitats',
        'Insolated Bare Ground',
        'Short Turf',
        'Dense Sward',
        'Scrub and Wood Edge',
        'Rich Flower Resource',
        'Rich Seed Resource',
        'Hollow Stems',
        'Fungi',
        'Wood Decay',
        'Vegetation Litter',
        'Dung',
        'Carrion',
        'Nests'
    ];
    
    public static $macroEnvironment = [
        'Terrestrial',
        'Aquatic',
        'Aquatic-larval only'
    ];
    
    public static $preyResources = [
        'Primary resource',
        'Prey/host resource',
        'Invertebrates',
        'Coleoptera',
        'Dictyoptera',
        'Diptera',
        'Ephemoptera',
        'Hemiptera-Heteroptera',
        'Hemiptera-Homoptera',
        'Hymenoptera-Aculeata',
        'Hymenoptera-Parasitica',
        'Hymenoptera-Symphyta',
        'Lepidoptera',
        'Orthoptera',
        'Psocoptera',
        'Thysanoptera',
        'Arachnoidea',
        'Annellida',
        'Isopoda','-',
        'Mollusca','-',
        'Amphibians',
        'Birds',
        'Mammals',
        'Reptiles'
    ];
    
    public static $structuralPhysicalResources = [
        'Primary resource',
        'Prey/host resource',
        'Herbaceous-vegetation',
        'Herb-vegetation-tall ( >60cms)',
        'Herb-vegetation-medium (15-60cms)',
        'Herb-vegetation-short (<15 cms)',
        'Woody-vegetation ',
        'Woody-vegetation-tree (>3m)',
        'Woody-vegetation-scrub (1-3m)',
        'Woody-vegetation-dwarf (<1m)',
        'Foliage',
        'Stems',
        'Flowers',
        'Seeds',
        'Roots',
        'Bulb',
        'Tussocks',
        'Epiphyte',
        'Gall',
        'Exposed pith',
        'Hard-timber',
        'Heart-rot',
        'Sap-layer',
        'Bark',
        'Rot-hole',
        'Woodland-open-canopy',
        'Woodland-closed-canopy',
        'Woodland-field-layer',
        'Wood-edge',
        'Scrub-edge',
        'Bare-and-revegetating-ground',
        'Peat',
        'Sand',
        'Clay',
        'Loam',
        'Loess',
        'Hard-rock/building',
        'Shade',
        'Sun',
        'Dry',
        'Seasonally-wet',
        'Wet',
        'Aquatic-emergent-vegetation',
        'Aquatic-submerged-vegetation',
        'Aquatic-still',
        'Aquatic-flowing',
        'Aquatic-seepage',
        'Water/land-interface',
        'Saline',
        'Brackish',
        'Fresh'
    ];
    
    public static $vegetationResources = [
        'Primary resource',
        'Prey/host resource',
        'Aceraceae',
        'Apiaceae',
        'Aquifoliaceae',
        'Araliaceae',
        'Asteraceae',
        'Betulaceae',
        'Boraginaceae',
        'Brassicaceae',
        'Campanulaceae',
        'Caprifoliaceae',
        'Caryophyllaceae',
        'Chenopodaceae',
        'Cistaceae',
        'Clusiaceae',
        'Convolvulaceae',
        'Cucurbitaceae',
        'Cuscutaceae',
        'Cyperaceae',
        'Dipsacaceae',
        'Ericaceae',
        'Fabaceae',
        'Fagaceae',
        'Geraniaceae',
        'Juncaceae',
        'Lamiaceae',
        'Liliaceae',
        'Linaceae',
        'Lythraceae',
        'Malvaceae',
        'Oleaceae',
        'Onagraceae',
        'Plantaginaceae',
        'Poaceae',
        'Polygalacaeae',
        'Polygonaceae',
        'Primulaceae',
        'Ranunculaceae',
        'Resedaceae',
        'Rhamnaceae',
        'Rosaceae',
        'Rubiaceae',
        'Salicaceae',
        'Scrophulariaceae',
        'Solanaceae',
        'Sparganacea',
        'Tamaricaceae',
        'Tilliaceae',
        'Typhaceae',
        'Ulmaceae',
        'Urticaceae',
        'Violaceae',
        'Pinopsida',
        'Cupressaceae',
        'Pinaceae',
        'Taxaceae',
        'Lycopodiopsida',
        'Equisetopsida',
        'Pteridopsida',
        'Mosses',
        'Lichens',
        'Algae',
        'Fungi-mycelium',
        'Fungi-fruiting-body-terrestrial',
        'Fungi-fruiting-body-arboreal',
    ];
    
    public static $nestStrategy = [
        'Pollen storer',
        'Pocket maker',
        'Pocket maker; pollen primer',
        'Brood parasite',
    ];
    
    public static $nestSite = [
        'Aerial nest',
        'Surface nest',
        'Subterranean nest',
        'Surface or subterranean nest',
        'Surface or aerial nest',
        'Surface, aerial or subterranean nest',
        'Brood parasite'
    ];
    
    public static $colonySize = [
        '0-10',
        '11-50',
        '50-150',
        '150 or more',
    ];
    
    public static $buzzPolination = [
        'Yes',
        'No'
    ];
    
    public static $biometrics = [
        /*'Body length' => [
         //'Body length N_%s' => 'Body length N',
         'min' => 'Body length Xmin_%s',
         'max' => 'Body length Xmax_%s',
         'mean' => 'Body length Xmean_%s',
         //'Body length N_%s' => 'Body length SD',
         ],
         'Length of metasoma' => [
         //'Metasoma length N_%s' => 'Metasoma length N',
         'min' => 'Metasoma length Xmin_%s',
         'max' => 'Metasoma length Xmax_%s',
         'mean' => 'Metasoma length mean_%s',
         //'Metasoma length N_%s' => 'Metasoma length SD',
         ],
         'Width of metasoma' => [
         //'Metasoma width N_%s' => 'Metasoma width N',
         'min' => 'Metasoma width Xmin_%s',
         'max' => 'Metasoma width Xmax_%s',
         'mean' => 'Metasoma width mean_%s',
         //'Metasoma width N_%s' => 'Metasoma width SD',
         ],
         'Length of head' => [
         //'Head length N_%s' => 'Head length N',
         'min' => 'Head length Xmin_%s',
         'max' => 'Head length Xmax_%s',
         'mean' => 'Head length mean_%s',
         //'Head length N_%s' => 'Head length SD',
         ],
         'Width of head' => [
         //'Head width N_%s' => 'Head width N',
         'min' => 'Head width Xmin_%s',
         'max' => 'Head width Xmax_%s',
         'mean' => 'Head width mean_%s',
         //'Head width N_%s' => 'Head width SD',
         ],*/
        'Inter-tegular distance' => [
            //'ITD N_%s' => 'Inter-tegular distance N',
            'min' => 'ITD Xmin_%s',
            'max' => 'ITD Xmax_%s',
            'mean' => 'ITD mean_%s',
            //'ITD N_%s' => 'Inter-tegular distance SD',
        ],/*
        'Forewing length' => [
        //'Forewing length N_%s' => 'Forewing length N',
        'min' => 'Forewing length Xmin_%s',
        'max' => 'Forewing length Xmax_%s',
        'mean' => 'Forewing length mean_%s',
        //'Forewing length N_%s' => 'Forewing length SD',
        ],*/
    ];
    
    public static $foragingRange = [
        'Foraging range (km)' => 'Female',
        'Foraging range mm' => 'Male',
        'Foraging range ww' => 'Worker'
    ];
    
    
}


class Import
{
    private $csv;
    private $csvMapping;
    private $nrColumns;
    
    private $pdo;
    private $dbTable = 'raw';
    
    public function setCsv ($csv)
    {
        if (!file_exists($csv)) {
            throw new Exception('Cannot find FMP csv file at ' . $this->csv);
        }
        $this->csv = $csv;
    }
    
    public function setDb ($db)
    {
        $dsn = 'mysql:host=' . $db['host'] . ';dbname=' . $db['db'] . ';';
        $options = [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false,
            PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8mb4' COLLATE 'utf8mb4_unicode_ci'"
        ];
        $this->pdo = new PDO($dsn, $db['user'], $db['pw'], $options);
    }
    
    public function importCsv ()
    {
        return $this->csvToDb();
    }
    
    public function createBeesDb ($sql)
    {
        if (!file_exists($sql)) {
            throw new Exception('Cannot find FMP dump at ' . $sql);
        }
        $this->pdo->exec(file_get_contents($sql));
    }
    
    private function csvToDb ()
    {
        ini_set("auto_detect_line_endings", true);
        $imported = -1;
        if (!($fh = fopen($this->csv, "r"))) {
            throw new Exception('Cannot read ' . $this->csv);
        }
        while ($row = fgetcsv($fh)) {
            if ($imported == -1) {
                $this->csvMapping = $row;
                $this->nrColumns = count($row);
                $imported++;
                continue;
            }
            $data = [];
            foreach ($row as $i => $value) {
                $data[$this->csvMapping[$i]] = $value;
            }
            $prepare = '
				INSERT INTO `raw`
				(`id`, `' . implode('`, `', array_keys($data)) .  '`)
				VALUES
				(null, ' . substr(str_repeat('?, ', $this->nrColumns), 0, -2) . ')';
            $stmt = $this->pdo->prepare($prepare);
            $stmt->execute(array_values($data));
            $imported++;
        }
        return $imported;
    }
}
