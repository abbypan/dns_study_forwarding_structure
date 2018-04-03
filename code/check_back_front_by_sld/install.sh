#!/bin/bash 
apt-get update
apt-get -y install build-essential vim rsync openssl
apt-get -y install ruby ruby-dev ruby-eventmachine
apt-get -y install dns-utils libdns-dev libdns0
apt-get -y install cpanminus
gem sources -a https://rubygems.org/
gem install em-udns
cpanm -n SimpleR::Reshape
cpanm -n Data::Validate::IP
perl check_backdns.pl test.dns.check
