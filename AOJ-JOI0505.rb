ans = Array.new
loop do
	student,sight = gets.split.map(&:to_i)
	if student == 0 && sight == 0
	break
	end

	mp = Array.new(sight){0}
	list = Array.new(sight){0}
	student.times do
		list = gets.split.map(&:to_i)
		sight.times do |i|
			mp[i]+=list[i]
		end
	end
	
	jun = sight
	a = Array.new(sight){0}
	loop do
		
		(sight-1).downto(0) do |i|
			if mp[i]==0
				a[i]=jun
				jun-=1
			end
		end
		
		if jun == 0
			break
		end

		sight.times do |i|
			mp[i]-=1
		end
	end
	ans.push(a)
end

ans.each do |n|
	puts n.join(" ")
end


