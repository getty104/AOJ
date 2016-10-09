sci = []
hum = []

4.times do
	sci << gets.to_i
end

2.times do
	hum << gets.to_i
end

sci.sort!
hum.sort!

ans = 0

3.times do
	ans += sci.pop
end

ans += hum.pop

puts ans