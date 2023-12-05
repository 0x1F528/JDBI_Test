sqlcmd -i "SQL Server Scripts\NoodleBase.sql" > output.txt
sqlcmd -i "SQL Server Scripts\Noodle.sql" >> output.txt
sqlcmd -i "SQL Server Scripts\Noodle_Get.sql">> output.txt
sqlcmd -i "SQL Server Scripts\Noodles.sql" >> output.txt

type output.txt
