<VirtualHost *:80>
ProxyRequests on
<Proxy balancer://webcluster >
  
    BalancerMember http://{{ hostvars['web1'].ansible_host }}
    BalancerMember http://{{ hostvars['web2'].ansible_host }}

    ProxySet lbmethod=byrequests
</Proxy>

# Optional
<Location /balancer-manager>
  SetHandler balancer-manager
</Location>

ProxyPass /balancer-manager !
ProxyPass / balancer://webcluster/
</VirtualHost>