
n = gets.to_i
m = Array.new(n){Array.new(n){0}}

n.times do
	s = gets.split.map(&:to_i)
	i = s[0] - 1
	s[1].times do |l|
		j = s[l + 2] - 1
		m[i][j] = 1 
	end
end

n.times do |i|
		puts m[i].join(" ")
end


