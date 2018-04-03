#!/usr/bin/perl

my @data = sort map { -M $_ } glob("data/*.res");
my $s = $data[0];
my $m = $s*24*60;
if($m>10){
my $pid = `ps aux|grep '.res' |grep check|grep rb|grep -v grep|awk '{print \$2}'`;
print "kill $pid\n";
system(qq[kill $pid]);
}
