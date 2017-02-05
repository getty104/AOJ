

def check c, n, k, list
	i = 0
	0.upto k-1 do
		s = 0
		while s + list[i] <= c
			s += list[i]
			i += 1
			return n if i == n
		end
	end
	return i
end

def solve n, k, list
	left = 0
	right = 100000 * 100000
	while right - left > 1
		mid = (left + right)/2
		v = check mid, n, k, list
	if v >= n 
		right = mid	
	else
		left = mid
	end
end
return right
end


n, k = gets.split.map(&:to_i)
list = []
n.times do
	list << gets.to_i
end
ans = solve n, k, list
puts ans