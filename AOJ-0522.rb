
ans1 = []
ans2 = []
while line = STDIN.gets
	str = line.chomp!.split(//).map(&:to_s)
	list = []
	count1 =0
	count2 =0
	str.length.times do |i|
		if i< 3
			list << str[i]
		if i==2
			t = list[0].to_s+list[1].to_s+list[2].to_s
			if t== "JOI"
				count1 +=1
			elsif t == "IOI"
				count2 +=1
			end
		end
	else
		list.shift
		list << str[i]
		t = list[0].to_s+list[1].to_s+list[2].to_s
			if t== "JOI"
				count1 +=1
			elsif t == "IOI"
				count2 +=1
			end
		end
	end
	ans1 << count1
	ans2 << count2
	
end

ans1.length.times do
	puts ans1.shift
	puts ans2.shift
end