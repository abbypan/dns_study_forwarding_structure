#!/usr/bin/perl
use POSIX qw/strftime/;

my $file = `/bin/ls -lt bind.log.*|tail -1`;
chomp($file);
$file=~s/^.*\s//;
exit unless(-f $file and $file=~/bind.log.\d+/);
my $s = strftime("%Y%m%d%H%M%S", localtime);
my $rand = int(rand(99999999));
system(qq[/bin/mv "$file" "bind_log/bind.log.$s.$rand"]);
