#-------------------------------------------------------------------------------------------------
# Build a docker image for Jenkins                                                               -														
#                                                                                                -
# This build will download the latest Jenkins MSI installer as part of the image build process   -
# so make sure that you have access to the internet when building the docker image               -
#-------------------------------------------------------------------------------------------------

# Specify the container image
FROM microsoft/windowsservercore

# Install our web server to host Jenkins' web components
RUN Powershell -Command "Install-WindowsFeature Web-Server"

# Next, we will download and extract jenkins from its official mirror...

# Start by creating a folder to store the Jenkins setup files (suppress the output)
RUN Powershell -Command "New-Item C:\\Setup -ItemType directory | Out-Null"

# Download the Jenkins setup files
RUN Powershell -Command "Invoke-WebRequest -OutFile C:\\Setup\\Jenkins.zip http://mirrors.jenkins-ci.org/windows-stable/latest"

# Unzip the downloaded zip file - it'll contain an MSI installer
RUN Powershell -Command "Expand-Archive C:\\Setup\\Jenkins.zip -DestinationPath C:\\Setup"

# Install Jenkins
RUN "Msiexec /i C:\\Setup\\Jenkins.msi /qn"

# Remove the setup files
RUN Powershell -Command Remove-Item C:\Setup -recurse

# Ensure the Jenkins port is available outside the container
EXPOSE 8080