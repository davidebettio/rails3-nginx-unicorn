working_directory "/var/www/example"
pid "/var/www/example/tmp/pids/unicorn.pid"
stderr_path "/var/www/example/log/unicorn.log"
stdout_path "/var/www/example/log/unicorn.log"

listen "/tmp/unicorn.example.sock"
worker_processes 2
timeout 30