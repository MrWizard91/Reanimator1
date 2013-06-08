Install Instructions for neo4j on Ubuntu 12.04
----------------------------------------------

.. [#] extract the neo4j tarball to /opt/neo4j extract the neo4j tarball to /opt/neo4j
.. [#] set the ulimit

       ulimit is a shell built-in, not an external command. It needs to be built in because it acts on the shell process itself, like cd: the limits, like the current directory, are a property of that particular process.



        You need to be able to open more files.

        Edit */etc/security/limits.conf* and add these two lines:

        | root soft nofile 40000
        | root hard nofile 40000

        Edit */etc/pam.d/su* and uncomment or add the following line:

        | session required pam_limits.so

        Finally check that limit was changed. You might need to reboot.

        | ulimit -n

        Returns 40000

        Next in order to be able to use the webadmin on Ubuntu. You need to change one of the properties files inside neo4j. It works without this change on a Mac, I know.

        Edit the neo4j-server.properties file:

        | cd [neo4j installation]/conf/
        | vim neo4-server.properties

        Change this line

        | org.neo4j.server.webserver.address=0.0.0.0

        The default is set to only listen for connections from localhost (that's why it works on a Mac). This way you can access the webadmin from anywhere. This can be a security problem though.

.. [#] install the official Java Runtime with the oab-java.sh install script
.. [#] 
