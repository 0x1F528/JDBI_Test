# JDBI_Test
JDBI Test to exercise JDBI createCall to SQL Server stored procedure  

## Deploy:
Run scripts.cmd (as Administrator) to generate the test database in SQL Server 19

## Run:
Run the java code (main)

## Output:
[ ... ]
com.noodletest.ServerMain
--> 1 - Hopladee
--> 2 - Troubadoo
--> 3 - Fainticar
--> 4 - Slurpuree
==> 1 = Hopladee
==> 2 = Troubadoo
==> 3 = Fainticar
==> 4 = Slurpuree
Exception in thread "main" java.lang.NullPointerException
	at java.base/java.util.Objects.requireNonNull(Objects.java:209)
	at org.jdbi.v3.core.statement.OutParameters.lambda$getRowSet$1(OutParameters.java:274)
	at org.jdbi.v3.core.result.internal.ResultSetResultIterable.iterator(ResultSetResultIterable.java:51)
	at org.jdbi.v3.core.result.ResultIterable.findFirst(ResultIterable.java:241)
	at com.noodletest.ServerMain.lambda$test_jdbi_sproc$1(ServerMain.java:77)
	at org.jdbi.v3.core.Jdbi.withHandle(Jdbi.java:409)
	at com.noodletest.ServerMain.test_jdbi_sproc(ServerMain.java:69)
	at com.noodletest.ServerMain.main(ServerMain.java:27)

Process finished with exit code 1



