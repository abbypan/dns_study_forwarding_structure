$TTL    600 ; 
$ORIGIN tt.sometest.com.
@  1D  IN  SOA dns.sometest.com. mail.sometest.com. (
                  2015012345 ; serial
                  3H ; refresh
                  15 ; retry
                  1w ; expire
                  3h ; minimum
                 )
       IN  NS     dns.sometest.com. ; in the domain

*    IN  A       1.2.3.4  ;name server definition     
