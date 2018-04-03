#!/usr/bin/perl
use Socket qw/inet_ntoa/;

my ($f, $df) = @ARGV;
if(!$df) {
    $df=$f;
    $df=~s/bind_log/bind_log_tidy/;
}
print "$f -> $df\n";

open my $fh, '<', $f;
open my $fhw, '>', "$df.tmp";
while(<$fh>){
next unless(/\Q.tt.sometest.com/);
my ($back, $front) = m{client (.+?)\#\d+: query '(\d+).tt.sometest.com/A/IN};
if(! $front){
    ($back, $front) = m{client (.+?)\#\d+\s+.+?: query '(\d+).tt.sometest.com/A/IN};
}
$front = inet_ntoa(pack('N', $front));
next unless($back and $front);
print $fhw "$back,$front\n";
}
close $fh;
close $fhw;

system(qq[cat $df.tmp | sort | uniq  > $df]);
unlink("$df.tmp");
unlink("$f");
