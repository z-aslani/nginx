
server {
    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers         HIGH:!aNULL:!MD5;
    ssl_certificate     /etc/nginx/certificates-api-smartyoffers/fullchain.pem;
    ssl_certificate_key     /etc/nginx/certificates-api-smartyoffers/privkey.pem;

    listen 80 proxy_protocol;
    listen 443 ssl proxy_protocol;
    index index.html;
    server_name api.smartyoffers.ir api.smartyoffers.com;
    real_ip_header proxy_protocol;

    proxy_next_upstream_tries 10 ;

    location /nginx_status {
      stub_status on;
      access_log   off;
    }

    location ~* (hystrix|myprometheus) {
        return 404;
    }

    location / {
        proxy_set_header X-Real-IP       $proxy_protocol_addr;
        proxy_set_header X-Forwarded-For $proxy_protocol_addr;
        proxy_http_version 1.1;
        proxy_set_header Connection "";
        proxy_hide_header 'x-frame-options';


        proxy_pass http://affiliateservers/;
    }
}
