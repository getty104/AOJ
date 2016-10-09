N,M = gets.split.map(&:to_i)

z = Array.new(N+1)

1.upto(N) do |i|
	z[i] = gets.to_i
end

1.upto(M) do |k|
	1.upto(N-1) do |i|
		if z[i]%k>z[i+1]%k
			tmp = z[i]
			z[i] = z[i+1]
			z[i+1] = tmp
		end
	end
end

1.upto(N) do |i|
	puts z[i]
end