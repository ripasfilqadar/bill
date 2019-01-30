thread_count = 100
count_ping = 1000
threads = []
finish = []

thread_count.times do |iteration|
  threads << Thread.new(iteration) do |i, s, r|
    print "Thread[#{i}]\n"
    begin
      system("ping 192.168.88.3")
    rescue StandardError => e
    end
    count_ping -= 1
  end
end

threads.each(&:join)