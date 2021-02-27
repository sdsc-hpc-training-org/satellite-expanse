use strict;
use Cwd;
use File::Basename qw(dirname); 

my $basename = dirname(Cwd::abs_path($0));

package satconfig;
# pid file for httpd. super important since we use the pid in here to 
# control httpd.
our $pidfile = '/var/run/httpd/httpd.pid';

# location of the database file
our $dbfile = $basename . '/../var/state.sqlite';

# allowed subnet for reverse-proxy targets
# format: subnet/mask
our $tgtipmask = '10.21.0.0/16';
#our $tgtipmask = '132.249.121.0/27';

# allowed host/subnet for jobstate updates
# format: subnet/mask (use /32 for host)
# mgr1.expanse, mgr2.expanse, and extras we don't care about
# a /29 is the smallest subnet that encompasses .11 and .12
our $jobstateipmask = '198.202.100.8/29';

# number of secs an entry can remain in 'pending' or 'mapped' state
# 'modified' field is updated when moving from pending to mapped.
# comet has a max runtime of 48h
# set max to 49h in case job sat in queue a little long.
our $ttl_secs = 176400;

# the externally-facing port requests come in to
# usually the same as listenport unless DNAT is in play.
our $extport = 443;

# the name users put in their clients
our $extbasename = 'expanse-user-content.sdsc.edu';

# the port apache binds to
our $listenport = 443;

# the stub file for the apache config
# it's dynamically updated by bin/cron script
our $httpdstubfile = $basename . '/../dynconf/proxyconf.conf';

# nice(r) message pages go here
our $htmldir = $basename . '/../html';

1;
