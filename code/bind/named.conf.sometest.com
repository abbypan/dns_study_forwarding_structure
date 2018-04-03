zone "tt.sometest.com" {
    type master;
    file "/etc/bind/zones.tt.sometest.com";
};

