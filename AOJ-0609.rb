
N = gets.to_i
M = gets.to_i
point = Array.new(N){0}
target = gets.split.map(&:to_i)
lose = 0
M.times do |n|
	ans = gets.split.map(&:to_i)
	N.times do |i|
		if target[n] == ans[i]
			point[i]+=1
		else
			lose += 1
		end
	end
	point[target[n]-1] += lose
	lose = 0
end

point.each do |v|
	puts v
end
