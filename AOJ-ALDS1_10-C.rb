def lcs c1, c2, l, m
	dp = Array.new(m + 1){0}
	l.times do |i|
		tmp = dp.dup
		m.times do |j|
			jj = j + 1
			if c1[i] == c2[j]
				dp[jj] = tmp[jj - 1] + 1
			elsif  dp[jj] < dp[jj - 1] 
				dp[jj] = dp[jj - 1]
			end
		end
	end
	return dp[-1]
end

n = gets.to_i
n.times do
	c1 = gets.chomp.split("")
	c2 = gets.chomp.split("")
	puts lcs(c1, c2, c1.size, c2.size)
end


