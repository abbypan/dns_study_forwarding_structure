#!/usr/bin/perl
use Data::Validate::IP qw/is_public_ipv4/;
my ($a, $d) = @ARGV;

my $f = "data/ip_ad.$a.$d.log";
open my $fh, '>', $f;
for my $i ( 0 .. 255 ) {
	for my $j ( 0 .. 255 ) {
		my $ip = "$a.$i.$j.$d";
		next unless(is_public_ipv4($ip));
		print $fh $ip,"\n";

	}
}
close $fh;
system("sort -R $f > $f.random");
unlink($f);
system("perl mk_dom.pl $f.random");
unlink("$f.random");
system("perl check_backdns.pl $f.random.log");
unlink("$f.random.log");
