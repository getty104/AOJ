ans = Array.new

loop do
	a,b,c = gets.split.map(&:to_i)
	if a==0&&b==0&&c==0
		break
	end
	ok = Array.new
	ng = Array.new
	n = gets.to_i
	list = Array.new
	n.times do 
		n1,n2,n3,r=gets.split.map(&:to_i)
		if r==1
			ok.push(n1)
			ok.push(n2)
			ok.push(n3)
		else
			list.push([n1,n2,n3])
		end
	end
	ok.uniq!
	ok.sort!
	
	
	list.each do |v|
		if ok.include?(v[0])&&ok.include?(v[1])||ok.include?(v[0])&&ok.include?(v[2])||ok.include?(v[1])&&ok.include?(v[2])
			3.times do |i|
				if !ok.include?(v[i])
					ng.push(v[i])
				end
			end
			
		end

	end
	ng.uniq!
	ng.sort!
	
	(a+b+c).times do |num|
		if ok.include?(num+1)
			ans.push(1)
		elsif ng.include?(num+1)
			ans.push(0)
		else
			ans.push(2)
		end
	end

end

ans.each do |v|
	puts v
end