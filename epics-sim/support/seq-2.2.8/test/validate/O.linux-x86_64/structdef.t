$ENV{HARNESS_ACTIVE} = 1;
$ENV{TOP} = '/usr/local/epics/support/seq-2.2.8';
$ENV{PATH} = '/usr/local/epics/support/seq-2.2.8/bin/linux-x86_64:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/usr/local/epics/base/bin/linux-x86_64';
$ENV{EPICS_CA_SERVER_PORT} = 10000 + $$ % 30000;
#only for debugging:
#print STDERR "port=$ENV{EPICS_CA_SERVER_PORT}\n";
system "./structdef -S -t";
