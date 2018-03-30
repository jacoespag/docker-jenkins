@echo off

echo Starting the docker container and binding to localhost port 8080
for /F %%I in ('docker run -d -p 8080:8080 -t jenkins') do (
    echo %%I
)

echo[
echo Opening Jenkins on http://localhost:8080
echo On Windows 10 "localhost" can only be used on Build 17025 or greater, for more information go to:
echo https://blogs.technet.microsoft.com/networking/2017/11/06/available-to-windows-10-insiders-today-access-to-published-container-ports-via-localhost127-0-0-1/
start http://localhost:8080