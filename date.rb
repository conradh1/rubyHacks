require 'date'   
  
# parses a date
d = Date.parse('4th Mar 2017')   

# prints today
puts "Today: #{Date.today}"
                             
# extract the date
puts d.year                        
puts d.mon                         
puts d.mday                        
puts  d.wday                        
puts d += 1                        
puts d.strftime('%a %d %b %Y')    
