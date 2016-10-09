A = gets.to_i
B = gets.to_i
C = gets.to_i
D = gets.to_i
P = gets.to_i

cost1 = P * A
cost2 = B
if C < P
	cost2 += (P-C)*D
end

puts cost1 < cost2 ? cost1 : cost2

