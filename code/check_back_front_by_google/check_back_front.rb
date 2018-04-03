#!/usr/bin/ruby

require "rubygems"
require "em-udns"


recur_list = File.readlines(ARGV[0])
#name = ARGV[1]
times =recur_list.length

max_sec =  20*60;
main_sec = 0;

EM.set_max_timers 100000
#EM.epoll
EM.run do

  
  second = 0
  EM.add_periodic_timer(15) { 
	main_sec += 15;
	if main_sec>max_sec
		 exit;
	end
#      puts "[#{second += 1}] - active queries: #{resolver.active}"
  }

  time_start = Time.now
  sent = 0
  recv = 0

  timer = EM::PeriodicTimer.new(0) do
    if sent == times
      timer.cancel

    else
        recur = recur_list[sent].chomp
	name = 'o-o.myaddr.l.google.com'
	
        EM::Udns.nameservers = recur
        resolver = EM::Udns::Resolver.new
        EM::Udns.run resolver
        sent += 1
    
      query = resolver.submit_TXT name

      query.callback do |result|
        recv += 1
        puts "#{recur} : #{result.inspect}"
        if recv == times
          exit
        end
      end

      query.errback do |error|
        recv += 1
        ers = "#{error.inspect}"
        if ers != ":dns_error_tempfail"
          puts "#{ns} #{error.inspect}"
        end
        if recv == times
          exit
        end
      end

    end

  end
  
end

