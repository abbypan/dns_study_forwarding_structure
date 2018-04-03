#!/usr/bin/perl
my ($i) = @ARGV;
my $log = "client.$i.log";
open my $fh, '>', $log;
for my $j ( 1 .. 255 ){
        print $fh "$i,$j\n";
        system("perl mk_rand_ipf.pl $i $j");
}
print $fh "$i ok\n";
close $fh;
