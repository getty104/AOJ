
class Tree
	def initialize(key)
		@key = key
		@left = nil
		@right = nil
	end

	def insert(k)
		if @key > k
			if !@left
				@left = Tree.new(k)
			else
				@left.insert(k)
			end

		else
			if !@right
				@right = Tree.new(k)
			else
				@right.insert(k)
			end
		end
	end

	def inorder(list)
		if @left
			list = @left.inorder(list)
		end
		list << @key
		if @right
			list = @right.inorder(list)
		end
		list
	end

	def preorder(list)
		list << @key
		if @left
			list = @left.preorder(list)
		end
		if @right
			list = @right.preorder(list)
		end
		list
	end
end

n = gets.to_i
head = nil

n.times do
	num = gets.to_s.chomp!
	if num == "print"
		puts " #{head.inorder([]).join(" ")}"
		puts " #{head.preorder([]).join(" ")}"
	else
		num = num.split
		if head
			head.insert(num[1].to_i)
		else
			head = Tree.new(num[1].to_i)
		end


	end

end