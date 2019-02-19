READ ME

How to export the data from FMP:

1. Records > Show all records 
2. File > Export Records...
3. Choose type "Merge"
4. Ignore warnings about missing databases
5. In export screen, choose Current table "Species"
6. Move all fields to export, character set UTF-8
7. Rename file to bees.csv and move to csv directory

How to run the script:

1. Copy config.php.tpl and rename to config.php
2. Add the appropriate settings to config.php
3. Create two MySQL databases, one for Linnaeus, the other for the FMP export
4. Run 'php path/to/import.php'

The import is a two-step process. First the FMP data is copied to the
database (Import class). Next the data is converted and copied to the
Linnaeus database (Convert class).