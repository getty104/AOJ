
class Tree
	attr_accessor :left,:right,:lenr,:lenl
	def initialize()
		@left=nil
		@right=nil
		
		@lenl = nil
		@lenr = nil
	end

	def addLeft(left)
		@left = left
	end

	def addRight(right)
		@right = right
	end

	
	def getCost(node)
		if node.left == nil 
			node.left = node.right.getCost(node.right)*node.lenr/node.lenl
			return node.left.getCost(node)
		elsif node.right == nil
			node.right = node.left.getCost(node.left)*node.lenl/node.lenr
			return node.right.getCost(node)
		else
			return node.left.getCost(node.left)+node.right.getCost(node.right)
		end
	end


end

class Iron
	def initialize(weight)
		@weight = weight
	end

	def getCost(node)
		@weight
	end
end


ans = []

loop{
	n=gets.to_i
	tree = Array.new(n){Tree.new}
	n.times do |i|
		lenl,lenr,left,right = gets.split.map(&:to_i)
		tree[i].lenl = lenl
		tree[i].lenr = lenr
		if left==0&&right==0
			tree[i].left = Iron.new((lenl.lcm(lenr)/lenl))
			tree[i].right = Iron.new((lenr.lcm(lenl)/lenr))
		else
			if left != 0
				tree[i].left = tree[left-1]
			end

			if right != 0
				tree[i].right = tree[right-1]
			end
		end
	end

	

}