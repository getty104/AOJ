ans = Array.new
loop do
	num = gets.to_i
	if num == 0
		break
	end
	a1 = Array.new(num)
	a2 = Array.new(num)
	num.times do |i|
		d1,d2 = gets.split
		a1[i] ,a2[i] = d1.to_s.chomp,d2.to_s.chomp
		a1[i].strip!
		a2[i].strip!
	end
	
	n = gets.to_i
	str = ""
	n.times do 
		data = gets.to_s.chomp
		data.strip!
		num.times do |i|
			if data ==a1[i]
				data = a2[i]
				break
			end
		end
		str += data

	end
	
	ans.push(str)
end

ans.each do |n|
	puts n
end