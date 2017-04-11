class PriorityQueue

	Vector = Struct.new(:data, :value)
	def initialize a = 1, b = 0
		@heap = 0
		@node = []
		@option = a - b
	end

	private

	def maxHeapfy key
		left = 2 * key
		right = 2 * key + 1

		if left <= @heap && @node[left].value > @node[key].value
			largest = left
		else
			largest = key
		end

		largest = right	if right <= @heap && @node[right].value > @node[largest].value

		unless largest == key
			@node[key], @node[largest] = @node[largest], @node[key]
			maxHeapfy largest
		end
	end

	def max_extract!
		raise "Stack is empty!" if @heap < 1
		maxv = @node[1]
		@node[1] = @node[@heap]
		@heap -= 1
		maxHeapfy 1
		return maxv
	end

	def max_increaseKey i, vector
		return if vector.value < @node[i].value
		@node[i] = vector
		while i > 1 && @node[i / 2].value < @node[i].value
			@node[i], @node[i / 2] = @node[i / 2], @node[i]
			i = i / 2
		end
	end

	def max_insert! data, value
		@heap += 1
		@node[@heap] = Vector.new(nil,-Float::INFINITY)
		vector = Vector.new(data, value)
		max_increaseKey @heap, vector
	end


	def minHeapfy key
		left = 2 * key
		right = 2 * key + 1

		if left <= @heap && @node[left].value < @node[key].value
			minimum = left
		else
			minimum = key
		end

		minimum = right	if right <= @heap && @node[right].value < @node[minimum].value

		unless minimum == key
			@node[key], @node[minimum] = @node[minimum], @node[key]
			minHeapfy minimum
		end
	end

	def min_extract!
		raise "Stack is empty!" if @heap < 1
		minv = @node[1]
		@node[1] = @node[@heap]
		@heap -= 1
		minHeapfy 1
		return minv
	end

	def min_increaseKey i, vector
		return  if vector.value > @node[i].value
		@node[i] = vector
		while i > 1 && @node[i / 2].value > @node[i].value
			@node[i], @node[i / 2] = @node[i / 2], @node[i]
			i = i / 2
		end
	end

	def min_insert! data, value
		@heap += 1
		@node[@heap] = Vector.new(nil,Float::INFINITY)
		vector = Vector.new(data, value)
		min_increaseKey @heap, vector
	end

	public

	def push data, value
		if @option <= 0
			min_insert! data, value
		else
			max_insert! data, value
		end
	end

	def pop
		if @option <= 0
			min_extract!.data
		else
			max_extract!.data
		end
	end

	def empty?
		@heap < 1
	end

end

MAX = 10000
INFTY = Float::INFINITY
WHITE = 0
GRAY = 1
BLACK = 2
Datav = Struct.new(:first, :second)
$n = nil
$adj = Array.new(MAX){[]}

def dijkstra
	pq = PriorityQueue.new
	color = Array.new(MAX){WHITE}
	d = Array.new(MAX){INFTY}
	d[0] = 0
	pq.push Datav.new(0,0), 0
	color[0] = GRAY

	until pq.empty?

		f = pq.pop
		u = f.second
		color[u] = BLACK

		next	if d[u] < f.first * (-1)

		$adj[u].size.times do |j|
			v = $adj[u][j].first
			next if color[v] == BLACK
			if d[v] > d[u] + $adj[u][j].second
				d[v] = d[u] + $adj[u][j].second
				pq.push(Datav.new(d[v]*(-1), v), d[v]*(-1))
				color[v] = GRAY
			end
		end
	end

	$n.times do |i|
		puts "#{i} #{d[i] == INFTY ? -1 : d[i]}"
	end
end


$n = gets.to_i

$n.times do |i|
	s = gets.split.map(&:to_i)
	2.step(s[1]*2, 2) do |j| 
		$adj[s[0]] << Datav.new(s[j], s[j + 1])
	end
end

dijkstra()















