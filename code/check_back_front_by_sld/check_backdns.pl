#!/usr/bin/perl
use SimpleR::Reshape;
use POSIX;
my ($f) = @ARGV;
split_file($f, line_cnt => 300);

my @temp_files = glob("$f.*");
for my $temp_f  (@temp_files){
        next unless($temp_f=~/\.\d+$/);
        print "check $temp_f\n";
        system(qq[./check_recur_dns.rb $temp_f >> $f.res]);
        unlink($temp_f);
}

my $now = strftime("%Y%m%d%H%M%S",localtime);
my $new_f = "$f.res";
$new_f=~s/([^\/\\]+)$/$now.$1/;
system(qq[mv $f.res $new_f]);
