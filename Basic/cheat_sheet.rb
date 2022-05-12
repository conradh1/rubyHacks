#!/usr/bin/env ruby

# Finds a number between 1 and 99 in x tries and 
# returns the number of tries.
def findRandom(ran = 99)
    if !(ran > 0 and ran < 100)
        puts("The number #{ran} is out of range.")
        puts("Must be bewteen 0 and 99.")
        return -1
    end    
    low = 0
    mid = 50
    high = 100    
    tries = 1
    while mid != ran do
        if (ran < mid)
            tmp = mid
            mid = (high-mid)/2
            high = tmp            
        elsif (ran > mid)
            tmp = mid
            mid = (high+mid)/2
            low = tmp            
        end
        tries += 1
    end

    return tries
end

def capitals()
    
    # Hash examples
    capitals = { 'Canada'=> 'Ottawa', 'Ukraine'=> 'Kiev'}
    capitals['USA'] = 'Washington'

    countries = ['Canada', 'France', 'USA', 'Ukraine']
    emp =  { id: 1, name:"john" }

    #capitals.each do |key,value|
    countries.each do |country|            
        # For each country from the list check to see whether it is in the dictionary Capitals
        if capitals.has_key?(country)
            puts "The capital of #{country} is #{capitals[country]}."
        else
            puts "The capital of #{country} is unknown."
        end
    end

    # check if string is in array
    if (!countries.include?('Indo')) 
        puts "Why no Indo?"
    end

    # remove key and value and check if value exists.
    capitals.delete('USA')
    if ( !capitals.has_value?('Washington'))
        puts "Where's DC go?"
    end
end

def march2D()

    values = Array[[1, 2, 3], [4, 5, 6]]

    # Loop over each row array.
    values.each_index do |i|
        # Get subarray and loop over its indexes also.
        subarray = values[i]
        subarray.each_index do |x|
            # Display the cell.
            print "#{values[i][x]}"
        end
        puts
    end
end

if __FILE__ == $0
    ran = rand(1..99)
    puts("Found #{ran} in #{findRandom(ran)} tries.")
    #capitals()
    march2D()
end