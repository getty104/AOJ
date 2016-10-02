
class C
	attr_reader :x,:y
	def initialize(x,y)
		@x, @y = x,y
	end
end

def func(x,y,goal,list,count)
	cost1 = 0
	cost2 = 0
	if x==goal.x&&y==goal.y
		return count
	else
		if x+1<=goal.x && list[x+1][y]==0 
		    cost1 = func(x+1,y,goal,list,1)
		end
		if y+1<=goal.y && list[x][y+1]==0 
			cost2 = func(x,y+1,goal,list,1)
		end
		return (cost1+cost2)
	end
end

ans = Array.new
loop do
	n = gets.split.map(&:to_i)
	if n[0]==0&&n[1]==0
		break
	end
	goal = C.new(n[0],n[1])
	list = Array.new(goal.x+1)
	(goal.x).times do |l|
		list[l+1] = Array.new(goal.y+1){0}
	end
	t = gets.to_i
	t.times do
		x,y = gets.split.map(&:to_i)
		list[x][y] = 1
	end
	ans.push(func(1,1,goal,list,0))
end

ans.each do |v|
	puts v
end
