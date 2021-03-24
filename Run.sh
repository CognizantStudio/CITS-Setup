# pre-requisites:  Need to have Java 11 JDK installed and in /usr/bin/java (otherwise adjust the path below)
# this file needs to be in the same folder as the cognizant-intelligent-test-scripter-ide-1.4.jar file and the Run.command file.
# Also note, the Docker service needs to be running.

export JAVA_HOME=`/usr/bin/java`

if ( nc -z 0.0.0.0 4444 2>&1 >/dev/null ); then
    echo 'Docker container appears to be running.  Lets try using it'
else
    echo 'Docker container appears to not exist.  Starting'
    docker run -d -p 4444:4444 -v /dev/shm:/dev/shm selenium/standalone-chrome
fi

./Run.command