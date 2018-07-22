rails_root = "/var/www/comilog/current" #自分app_nameに変更
shared_path = "/var/www/comilog/shared" #自分app_nameに変更

worker_processes 4
working_directory rails_root

#listen "#{rails_root}/tmp/unicorn.sock"
#pid "#{rails_root}/tmp/unicorn.pid"
listen File.expand_path('tmp/sockets/unicorn.sock', shared_path)
pid File.expand_path('tmp/pids/unicorn.pid', shared_path)

stderr_path "#{rails_root}/log/unicorn_error.log"
stdout_path "#{rails_root}/log/unicorn.log"

preload_app true

before_fork do |server, worker|
 ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', rails_root)
 old_pid = "#{server.config[:pid]}.oldbin"
 if File.exists?(old_pid) && server.pid != old_pid
   begin
     sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
     Process.kill(sig, File.read(old_pid).to_i)
   rescue Errno::ENOENT, Errno::ESRCH
     # someone else did our job for us
   end
 end
end

after_fork do |server, worker|
 defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end