
class Tree
	attr_accessor :parent, :root, :dep, :key, :left,:right
	def initialize(key)
		@parent = -1
		@left = nil
		@right = nil
		@dep = nil
		@key = key
	end

	def depth(ans,tree)
		if @left!=nil
			@left.depth(ans+1,tree)
		end
		
		if @right != nil
			@right.depth(ans+1,tree)
		end
		@dep = ans
	end

	
end




n = gets.to_i

tree = Hash.new
check = Array.new(n){true}
n.times do |i|
	tree[i] = Tree.new(i)
end

n.times do |i|
	data = gets.split.map(&:to_i)
	num = data.shift
	data.shift
	tree[num].left = data[0]
	tree[num].right = data[1]
	tree[data[0]].parent = tree[num]
	tree[data[0]].parent = tree[num]
	check[obj] = false
end
r = check.index(true)
tree[r].depth(0,tree)
num = 0
n.times do |i|
	obj = tree[i]
	jd = nil
	if obj.parent ==-1
		jd = "root"
	elsif obj.root.empty?
		jd = "leaf"
	else 
		jd = "internal node"
	end
	if obj.parent != -1
		puts "node #{num}: parent = #{obj.parent.key}, depth = #{obj.dep}, #{jd}, [#{obj.root.join(", ")}]"
	else
		puts "node #{num}: parent = #{-1}, depth = #{obj.dep}, #{jd}, [#{obj.root.join(", ")}]"
	end
	num+=1
end

