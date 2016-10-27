
class Tree
	attr_accessor :parent, :root, :dep, :key, :left,:right, :sib
	def initialize(key)
		@parent = -1
		@left = -1
		@right = -1
		@dep = -1
		@key = key
		@sib = -1
	end

	def depth(ans,tree)
		if @left!=-1
			@left.depth(ans+1,tree)
		end
		
		if @right != -1
			@right.depth(ans+1,tree)
		end
		@dep = ans
	end

	def height(h)
		n1 = h
		n2 = h

		if @left!=-1
			n1 = left.height(h+1) 
		end

		if @right!=-1
			n2 = right.height(h+1)
		end

		return n1 > n2 ? n1:n2
	end

	def showparent
		if @parent==-1
			return -1
		else
			return @parent.key
		end
	end

	def showsib
		if @sib == -1
			return -1
		else
			return @sib.key
		end
	end

	def degree
		ans = 0
		if @left != -1
			ans+=1
		end
		if @right != -1
			ans+=1
		end
		ans
	end	
end




n = gets.to_i

tree = Hash.new
check = Array.new(n){true}
n.times do |i|
	tree[i] = Tree.new(i)
end

n.times do
	data = gets.split.map(&:to_i)
	num = data[0]
	tree[num].left = tree[data[1]]||-1
	tree[num].right = tree[data[2]]||-1
	if tree[data[1]]
		tree[data[1]].parent = tree[num]
		tree[data[1]].sib = tree[data[2]]||-1
		check[data[1]] = false
	end
	if tree[data[2]]
		tree[data[2]].parent = tree[num]
		tree[data[2]].sib = tree[data[1]]||-1
		check[data[2]] = false
	end
	
	
end
r = check.index(true)
tree[r].depth(0,tree)

n.times do |i|
	obj = tree[i]
	jd = nil
	if obj.parent == -1
		jd = "root"
	elsif obj.left == -1 && obj.right == -1
		jd = "leaf"
	else 
		jd = "internal node"
	end
	
	puts "node #{i}: parent = #{obj.showparent}, sibling = #{obj.showsib}, degree = #{obj.degree}, depth = #{obj.dep}, height = #{obj.height(0)}, #{jd}"
	
	
end

