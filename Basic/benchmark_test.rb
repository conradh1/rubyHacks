require 'benchmark'

n = 3000000
Benchmark.bm(7) do |x|
  x.report("first_line:")   { for i in 10..n; a = "10"; end }
  x.report("second_line:") { n.times do   ; a = "10"; end }
  x.report("third_line:")  { 10.upto(n) do ; a = "10"; end }
end