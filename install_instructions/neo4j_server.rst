Install Instructions for neo4j on Ubuntu 12.04
----------------------------------------------

.. [#] extract the neo4j tarball to /opt/neo4j extract the neo4j tarball to /opt/neo4j
.. [#] set the ulimit
       ulimit is a shell built-in, not an external command. It needs to be built in because it acts on the shell process itself, like cd: the limits, like the current directory, are a property of that particular process.
       sudo bash -c 'ulimit -n 4096' would work, but it would change the limit for the bash process invoked by sudo only, which would not help you.
       There are two values for each limit: the hard limit and the soft limit. Only root can raise the hard limit; anyone can lower the hard limit, and the soft limit can be modified in either direction with the only constraint that it cannot be higher than the hard limit. The soft limit is the actual value that matters.
       Therefore you need to arrange that all your processes have a hard limit for open files of at least 4096. You can keep the soft limit at 1024. Before launching that process that requires a lot of files, raise the soft limit. In /etc/security/limits.conf, add the lines

       paislee hard nofile 4096
       paislee soft nofile 1024
       where paislee is the name of the user you want to run your process as. In the shell that launches the process for which you want a higher limit, run

       ulimit -Sn unlimited
       to raise the soft limit to the hard limit.

.. [#] install the official Java Runtime with the oab-java.sh install script
.. [#] 
