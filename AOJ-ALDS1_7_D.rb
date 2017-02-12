

def max a, b
	 a > b ? a : b
end

def lcs c1, c2, dp
	m = c1.length
	n = c2.length

	1.upto m do |i|
		1.upto n do |j|
			if c1[i] == c2[j]
				dp[i][j] = dp[i - 1][j - 1] + 1
			else
				dp[i][j] = max dp[i - 1][j], ap[i][j - 1]
			end
		end
	end
end

n = gets.to_i
ans = []
n.times do
	c1 = gets.chomp!.split("").map(&:to_s)
	c2 = gets.chomp!.split("").map(&:to_s)
	dp = Array.new(c1.length){Array.new(c2.length){0}}
	lcs c1, c2, dp
	ans << dp[c1.length - 1][c2.length - 1]
end

ans.each do |v|
	puts v
end