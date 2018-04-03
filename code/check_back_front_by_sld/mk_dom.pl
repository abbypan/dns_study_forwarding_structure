#!/usr/bin/perl
use Socket qw/inet_aton/;
my ($f) = @ARGV;

open my $fh, '<', $f;
open my $fhw, '>', "$f.log";
while(<$fh>){
    chomp;
    my $n = unpack('N', inet_aton($_));
    my $s = "$n.tt.sometest.com";
    print $fhw "$_ $s\n";
}
close $fhw;
close $fh;
