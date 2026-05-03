$TTL 86400
@   IN  SOA ns1.openings.com. admin.openings.com. (
        1		    ; serial 
        3600        ; refresh
        1800        ; retry
        604800      ; expire
        86400       ; minimum
)

@   IN  NS ns1.openings.com.
ns1 IN  A   10.49.41.194

@   IN  NS  ns2.openings.com.
ns2 IN  A   10.49.42.195

@   IN A 10.49.41.211
www IN CNAME @