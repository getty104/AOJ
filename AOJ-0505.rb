ans = []

loop{
	n,m = gets.split.map(&:to_i)
	if n==0 && m==0
		break
	end
	s = Array.new(m){0}
	n.times do
		num = gets.split.map(&:to_i)
		m.times do |i|
			s[i] += num[i]
		end
	end
		
		lank = Array.new(m){0}
		num =1
		n.downto(0) { |i|  
			m.times do |j|
				if s[j] == i
					lank[j] = num
					num+=1
				end
			end
		}
		
		str =""
		m.times do |i|
			str += lank[i].to_s
			if i<m-1
				str += " "
			end

		end
		ans << str
}

ans.each do |v|
	puts v
end