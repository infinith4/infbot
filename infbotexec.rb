#!/usr/bin/ruby
require 'systemu'

has_timed_out = false
timeout_sec = 30

status, stdout, stderr = systemu './bin/hubot -a chatwork'


# status, stdout, stderr = systemu './bin/hubot -a chatwork' do |pid|
#   sleep timeout_sec
#   has_timed_out = true
#   Process.kill 9, pid
# end

# プロセスが通常に終了した場合はfalse
# タイムアウトで終了した場合はtrue
p has_timed_out
p [status, stdout, stderr]

# date = %q( ruby -e"  t = Time.now; STDOUT.puts t; STDERR.puts t  " )
# status, stdout, stderr = systemu date
# p [ status, stdout, stderr ]

# begin
#   exec("./bin/hubot -a chatwork")
# rescue
#   puts "error"
# end
