## Construct a docker for Windows image to host the Jenkins automation server

See https://jenkins.io for more info on Jenkins  
Use the dockerfile with Docker http://www.docker.io

This dockerfile makes use of cmdlet's that require PowerShell 5.0+

### How to use it?
Just run the `build.bat` file and wait for the build to complete, follow this with `run.bat` to start the container and open the Jenkins Web UI.

Or to do it manually; build the image using:

```
docker build -t jenkins  
```

Jenkins is hosted on port 8080 within the container, to access it from outside the container, bind the container port 8080 to whatever localhost port you have available [See '--publish' option on https://docs.docker.com/engine/reference/commandline/run/]

```
docker run -d -p [your port here]:8080 -t jenkins
```

Then navigate to ```http://localhost:[your port here]``` and complete the Jenkins configuration steps. Please note that on Windows 10 the use of "localhost" is limited to Windows 10 Build 17025 and up. If you are on an older build use ```http://[your ip address]:[your port here]``` instead. 

For more information see https://blogs.technet.microsoft.com/networking/2017/11/06/available-to-windows-10-insiders-today-access-to-published-container-ports-via-localhost127-0-0-1/

As part of the first run, you'll be prompted to unlock Jenkins using the temporary password stored in ```C:\Program Files (x86)\Jenkins\secrets\initialAdminPassword``` on the container's drive.
