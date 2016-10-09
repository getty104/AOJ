
ans = []

loop do
	n,k = gets.split.map(&:to_i)
	if n==0 && k==0
		break
	end

	list = Array.new
	max = 0
	sum =0
	
	(n).times do |i|
		num = gets.to_i
		if i<k
			sum+= num
			list.push(num)
		else
			list.push(num)
			sum += num
			sum -= list.shift
			
			if max< sum
				max = sum
			end

		end
	end
	ans.push(max)
end

ans.each do |num|
	puts num
end

