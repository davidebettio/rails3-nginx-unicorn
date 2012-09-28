upstream unicorn {
  server unix:/tmp/unicorn.example.sock fail_timeout=0;
}

server {
  listen 80 default deferred;
  server_name example.dev;
  root /var/www/example;
  try_files $uri/index.html $uri @unicorn;
  location @unicorn {
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_redirect off;
    proxy_pass http://unicorn;
  }

  error_page 500 502 503 504 /500.html;
  client_max_body_size 4G;
  keepalive_timeout 10;
}