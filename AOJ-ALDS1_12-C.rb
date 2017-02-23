class PriorityQueue

	def initialize size = nil
		@heap = 0
		@node = Array.new(size)
	end



private
	def maxHeapfy key
		left = 2 * key
		right = 2 * key + 1

		if left <= @heap && @node[left].cost < @node[key].cost
			largest = left
		else
			largest = key
		end

		largest = right	if right <= @heap && @node[right].cost < @node[largest].cost

		unless largest == key
			@node[key], @node[largest] = @node[largest], @node[key]
			maxHeapfy largest
		end
	end

	def extract!
		return Vector.new nil, nil, Float::INFINITY if @heap < 1
		maxv = @node[1]
		@node[1] = @node[@heap]
		@heap -= 1
		maxHeapfy 1
		return maxv
	end

	def increaseKey i, key
		return nil if key.cost > @node[i].cost
		@node[i] = key
		while i > 1 && @node[i / 2].cost > @node[i].cost
			@node[i], @node[i / 2] = @node[i / 2], @node[i]
			i = i / 2
		end
	end

	def insert! key
		@heap += 1
		@node[@heap] = Vector.new nil, nil, Float::INFINITY
		increaseKey @heap, key
	end

	public

	def << key
		insert! key
	end

	def pop
		extract!
	end

	def empty?
		@node.empty?
	end
end

n = gets.to_i
m = Array.new(n){Hash.new}
n.times do |i|
	s = gets.split.map(&:to_i)
	s[1].times do |j|
		m[s[0]][s[ 2 * j + 2 ]] = s[2 * j + 3]
	end
end

Vector = Struct.new(:sta, :end, :cost)
pq = PriorityQueue.new(500_001)
BLACK = 0
WHITE = 1
color = Array.new(n){WHITE}
cost = Array.new(n){Float::INFINITY}
cost[0] = 0
color[0] = BLACK
u = 0
loop{
	m[u].each_key do |key|
		pq << Vector.new(u, key, cost[u] + m[u][key] ) if color[key] == WHITE
	end
	break if pq.empty? 
	vector = pq.pop
	break if vector.cost == Float::INFINITY
	color[vector.end] = BLACK
	 cost[vector.end] = vector.cost if cost[vector.end] > vector.cost
	 u = vector.end
}
n.times do |i|
	puts "#{i} #{cost[i]}"
end







