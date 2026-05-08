@echo off

cd C:\apache-jmeter-5.5\bin

set BASEDIR=C:\temp\TestAssignment\Assurity-Test-Assignment

rmdir /s /q "%BASEDIR%\results\HTMLReport"

del /q "%BASEDIR%\results\results.jtl"

del /q "%BASEDIR%\results\jmeter.log"

jmeter -n ^
-t "%BASEDIR%\JayJavier_AssurityTestAssignment.jmx" ^
-l "%BASEDIR%\results\results.jtl" ^
-j "%BASEDIR%\results\jmeter.log" ^
-e -o "%BASEDIR%\results\HTMLReport" ^
-Jthreads=5 ^
-Jrampup=5 ^
-Jduration=65 ^
-Jthroughput=10

pause