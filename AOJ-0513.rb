

N = gets.to_i

c = Array.new(2*N)

(2*N).times do |i|
	c[i]=i+1
end

T = gets.to_i

T.times do
	n = gets.to_i

	if n == 0
		cc = c.dup
		(N).times do |i|
			c[2*i] = cc[i]
			c[2*i+1] =  cc[N+i]
		end
	else
		c1 = c.values_at(0..n-1)
		c2 = c.values_at(n..2*N-1)
		c = c2+c1
	end
end

c.each do |v|
	puts v
end
