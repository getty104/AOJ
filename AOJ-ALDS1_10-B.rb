
n = gets.to_i
h = Array.new(n + 1)
m = Array.new(n + 1){Array.new(n + 1){0}}
1.upto n do |i|
	h[i - 1], h[i] = gets.split.map(&:to_i)
end

2.upto n do |l|
	1.upto n - l + 1 do |i|
		j = i + l - 1
		m[i][j] = Float::INFINITY
		i.upto j - 1 do |k|
			m[i][j] = [m[i][j], m[i][k] + m[j][k] + m[k + 1][j] + h[i - 1] * h[k] * h[j]].min
		end
	end
end

puts m[1][n]