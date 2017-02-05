
s1 = []
s2 = []
sum = 0

ch = gets.chomp!.split('').map(&:to_s)


ch.length.times do |i|
	if ch[i] == "\\"
		s1 << i

	elsif ch[i] == "/" && s1.size > 0
		j = s1.pop
		sum += i - j
		a = i - j
		while s2.size > 0 && s2.last[0] > j 
			a += s2.last[1]
			s2.pop
		end
		s2 << [j,a]
	end
end


ans = []

while s2.size >0 
	ans << s2.pop[1]
end

puts sum
ans.reverse!
print ans.size
if ans.size > 0
	puts " #{ans.join(" ")}"
else
	print "\n"
end
