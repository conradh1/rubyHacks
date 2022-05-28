#!/bin/ruby

#generate lotto
def getLotto()
    i = 0
    lotto = Array.new(6)
    while i < 6 do
        n = rand(1..25)
        if ( !lotto.include?(n) ) 
            lotto[i] = n
            i += 1
        end        
    end #while    
    return(lotto.sort)
end
# plays the lottery 649 and prints the tries and time
def benchmarkLotto(ticket)
    tries = 1    
    win = ticket.eql?(getLotto())
    while (!win) do
        lotto = getLotto()
        win = ticket.eql?(lotto)
        #puts("Lotto: #{lotto} Win: #{win}")
        tries +=1       
        #win = true
    end
    puts"Won! Only took #{tries} tries."
end

if __FILE__ == $0    
    require 'benchmark'
    lucky = [3,6,8,12,17,18]    
    puts"Testing numbers #{lucky}"
    # begin_time = Time.now
    # benchmarkLotto(lucky.sort)
    # end_time = Time.now
    # puts "Time taken is #{end_time - begin_time}."
    time = Benchmark.measure { benchmarkLotto(lucky.sort) }    
    puts("Time take: #{time.real}")
end