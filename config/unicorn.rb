is_production = ENV['RAILS_ENV'] == 'production'
app_folder_name = 'road_runner'

worker_processes 2
user 'vinsol'
working_directory "/var/www/apps/road_runner/current"

# This loads the application in the master process before forking
# worker processes
# Read more about it here:
# http://unicorn.bogomips.org/Unicorn/Configurator.html
preload_app true

timeout 200

# This is where we specify the socket.
# We will point the upstream Nginx module to this socket later on
listen "unix:/var/www/apps/road_runner/shared/tmp/sockets/unicorn.sock", :backlog => 64
pid "/var/www/apps/road_runner/shared/tmp/pids/unicorn.pid"

# Set the path of the log files inside the log folder of the testapp
stderr_path "/var/www/apps/road_runner/shared/log/unicorn.stderr.log"
stdout_path "/var/www/apps/road_runner/shared/log/unicorn.stdout.log"

before_fork do |server, worker|
# This option works in together with preload_app true setting
# What is does is prevent the master process from holding
# the database connection
# https://gist.github.com/bradherman/7acbfbda1f065b20d4fc

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
# Here we are establishing the connection after forking worker
# processes
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
