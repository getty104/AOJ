
def solve(i, m, n, num)
	return true if m == 0
	return false if i >= n
	return solve(i + 1, m, n, num) || solve(i + 1, m - num[i], n, num)
end


n = gets.to_i
num = gets.split.map(&:to_i)
m = gets.to_i
qu = gets.split.map(&:to_i)

	m.times do |j|
	 if solve 0, qu[j], n, num
	 	puts "yes"
	 else
	 	puts "no"
	 end
	end