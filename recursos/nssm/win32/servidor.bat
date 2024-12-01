cd "SQLAnywhere8\win32"
start dbsrv8.exe -x tcpip{port=2638} -nserver_interna C:\miconsultac\dataci\dataci.db
pause

C:\miconsultac\SQLAnywhere8\win32\dbsrv8.exe
C:\miconsultac\SQLAnywhere8\win32\
-x tcpip{port=2638} -nserver_interna C:\miconsultac\dataci\dataci.db


net start miservicio
net stop miservicio