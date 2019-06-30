# dns_study_forwarding_structure
forwarding resolver -> recursiver resolver

[Public Recusolver Response Accuracy Problem](public_resolver_response_accuracy.md)

# code/

## bind

SLD authoritative nameserver : bind zonefile

zone: sometest.com

random string sub zone: tt.sometest.com

## check_back_front_by_sld

map recur to subdomain, then dig A record: 

    { 'recur' => '203.80.96.10', subdomain: '3411042314.tt.sometest.com', rr => ["1.2.3.4"] }
    
sample: 

    $ perl check_backdns.pl data/test.dns.check

## refine_bind_log_of_sld

extract forwarding resolver -> recursiver resolver from bind.log

## check_back_front_by_google

use google's api

    $ dig o-o.myaddr.l.google.com -t txt +short

sample: 

    $ perl main.pl src/test.csv

# conf

## pub_recur.conf

public recursive resolver
