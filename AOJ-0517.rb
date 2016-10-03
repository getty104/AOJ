
ans = []

loop do
	n,k = gets.split.map(&:to_i)
	if n==0 && k==0
		break
	end
	list = []
	k.times do 
		list.push(gets.to_i)
	end
	list.sort!
	dammy =0
	if list[0]==0
		dammy =1
		list.delete(0)
	end
	
	max =0
	cost=1
	k.times do |i|
		if list[i] = list[i]-1
			cost+=1
		elsif list[i] 
		end
	end
	



end