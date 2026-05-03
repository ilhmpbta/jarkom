$TTL 86400
@   IN  SOA ns1.parkov.com. admin.parkov.com. (
        1		    ; serial 
        3600        ; refresh
        1800        ; retry
        604800      ; expire
        86400       ; minimum
)

@   IN  NS ns1.parkov.com.
ns1 IN  A   10.49.41.194

@   IN  NS  ns2.parkov.com.
ns2 IN  A   10.49.42.195

@   IN A 10.49.40.2
www IN CNAME @