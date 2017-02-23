

class PriorityQueue
	def initialize
		@node = []
		@n = 0
	end

	private

	def left_key key
		2*key+1
	end

	def right_key key
		2*key+2
	end

	def from_root_swap key, 
		right = right_key(key)
		left = left_key(key)
		if  key < 0 
			return nil
		end
		if !@node[left] && !@node[right]
			return nil
		elsif @node[left] && !@node[right]
			if @node[left].cost < @node[key].cost
				@node[key], @node[left] =  @node[left], @node[key]
				from_root_swap(left)
			end
		elsif @node[right] && !@node[left]
			if @node[right].cost < @node[key].cost
				@node[key], @node[right] =  @node[right], @node[key]
				from_root_swap(right)
			end
		elsif @node[key].cost >= @node[left].cost && @node[left].cost <= @node[right].cost
			@node[key], @node[left] =  @node[left], @node[key]
			from_root_swap(left)
		elsif @node[key].cost >= @node[right].cost && @node[right].cost <= @node[left].cost
			@node[key], @node[right] =  @node[right], @node[key]
			from_root_swap(right)
		end
	end

	def from_leaf_swap key
		if key == 0
			return nil
		end
		parent_key = (key-1)/2
		if @node[parent_key].cost > @node[key].cost
			@node[key], @node[parent_key] = @node[parent_key], @node[key]
			from_leaf_swap(parent_key)
		end
	end

	def extract!
		node = @node[0]
		if @node.size == 0
			railse "Queue is Empty"
		elsif @node.size == 1
			@n -= 1
			return @node.pop
		else
		@n -= 1
		node = @node[0]
		@node[0] = @node.pop
		from_root_swap(0)
		return node
		end
	end

	def insert! node
		@node << node
		@n += 1
		from_leaf_swap(@n - 1)
	end



	public

	def << node
		insert!(node)
	end

	def pop
		extract!
	end

	def empty?
		@node.empty?
	end

end



n = gets.to_i
m = Array.new(n){Array.new(n){Float::INFINITY}}
n.times do |i|
	s = gets.split.map(&:to_i)
	s[1].times do |j|
		m[s[0]][s[ 2 * j + 2]] = s[2 * j + 3]
	end
end

Vector = Struct.new(:sta, :end, :cost)
pq = PriorityQueue.new
BLACK = 0
WHITE = 1
color = Array.new(n){WHITE}
cost = Array.new(n){Float::INFINITY}
cost[0] = 0
color[0] = BLACK
u = 0
loop{

	n.times do |i|
		pq << Vector.new(u, i, cost[u] + m[u][i] ) if color[i] == WHITE
	end


	break if pq.empty?
	vector = pq.pop
	next if vector.cost == Float::INFINITY

	color[vector.end] = BLACK
	 cost[vector.end] = vector.cost if cost[vector.end] > vector.cost
	 u = vector.end
}

n.times do |i|
	puts "#{i} #{cost[i]}"
end







