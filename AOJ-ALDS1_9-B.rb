class HeapTree
	def initialize
		@node = []
	end

	private

	def swap(key)
		if  key < 0 
			return nil
		end
		if !left(key) && !right(key)
			return nil
		elsif left(key) && !right(key)
			if left(key) > @node[key]
				@node[key], @node[left_key(key)] =  @node[left_key(key)], @node[key]
				swap(left_key(key))
			end
		elsif right(key) && !left(key)
			if right(key) > @node[key]
				@node[key], @node[right_key(key)] =  @node[right_key(key)], @node[key]
					swap(right_key(key))
			end
		elsif @node[key] < left(key) && left(key) > right(key)
			@node[key], @node[left_key(key)] =  @node[left_key(key)], @node[key]
				swap(left_key(key))
		elsif @node[key] < right(key) && right(key) > left(key)
			@node[key], @node[right_key(key)] =  @node[right_key(key)], @node[key]
				swap(right_key(key))
		end
	end

	def extract!
		num = @node[0]
		@node[0] = @node.pop
		swap(@node[@node.length-1])
		return num
	end

	def insert!(num)
		@node << num
		swap(@node.length.to_i - 1)
	end

	def left(key)
		@node[2*key+1]
	end

	def right(key)
		@node[2*key+2]
	end

	def left_key(key)
		2*key+1
	end

	def right_key(key)
		2*key+2
	end

	# 先行順探索
	def precedingOrderSearch(key, &func)
		if @node[key]
			func.call(key, @node[key])
			precedingOrderSearch(left(key), &func)
			precedingOrderSearch(right(key), &func)
		end
	end
	# 後行順探索
	def afterLineOrderSearch(key, &func)
		if @node[key]
			afterLineOrderSearch(left(key), &func)
			afterLineOrderSearch(right(key), &func)
			func.call(key, @node[key])
		end
	end
	#中央順探索
	def centerOrderSearch(node, &func)
		if @node[key]
			centerOrderSearch(left(key), &func)
			func.call(key, @node[key])
			centerOrderSearch(right(key), &func)
		end
	end

	public

	def insert(num)
		insert!(num)
	end

	def preceding_crawl(&func) #　hoge.precedingCrawl do |key, value| のように使う
		precedingOrderSearch(0, &func)
	end

 # 後行巡回
 def after_line_crawl(&func)
 	afterLineOrderSearch(0, &func)
 end

# 中央巡回
def center_crawl(&func)
	centerOrderSearch(0, &func)
end

def extract
	extract!
end

def priority_create
	i = 0
loop{
	key = (@node.size.to_i-1)/2-i
	break if key < 0
	swap(key)
	i += 1
}
end

def list
	return @node
end
end


head = HeapTree.new
n = gets.to_i
 gets.split.map(&:to_i).each do |v|
 	head.insert v
 end
head.priority_create
head.list.each do |v|
	print " #{v}"
end
print "\n"
