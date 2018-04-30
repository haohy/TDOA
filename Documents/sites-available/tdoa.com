server {
        listen   80;
        server_name tdoa.haohongyan.cn;

        root /home/www/TDOA;
        #index index.py
	access_log /home/www/logs/nginx_access.log;
        error_log /home/www/logs/nginx_error.log;
	proxy_buffer_size 16k;
	proxy_buffers 4 16k;

        location / {
                proxy_set_header X-Forward-For $proxy_add_x_forwarded_for;
                proxy_set_header Host $http_host;
                proxy_redirect off;
                if (!-f $request_filename) {
                        proxy_pass http://127.0.0.1:8000;
                        break;
                }
        }
}
