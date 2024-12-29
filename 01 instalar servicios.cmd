C:\sistema_x32_php73\recursos\nssm\win32\nssm.exe install PHP73x32_8183 "C:\sistema_x32_php73\php73\php.exe" "-S localhost:8183 -t C:\sistema_x32_php73\htdocs73\"
C:\sistema_x32_php73\recursos\nssm\win32\nssm.exe install MariaDBx32_1010 "C:\sistema_x32_php73\mariadb-10.2.37-win32\bin\mysqld.exe" " --defaults-file=C:\sistema_x32_php73\mariadb-10.2.37-win32\my.ini"
net start PHP73x32_8183 
net start MariaDBx32_1010

