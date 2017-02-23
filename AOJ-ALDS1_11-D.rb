
class DisjointSet 

public
	def initialize(size = nil)
		@rank = Array.new(size){0}
		@p = Array.new(size){0}
		if size 
			size.times do |i|
				@p[i] = i
			end
		end
	end

	def same(x, y)
		return findSet(x) == findSet(y)
	end

	def unite(x, y)
		link(findSet(x), findSet(y))
	end

private
	def link(x, y)
		if @rank[x] > @rank[y]
			@p[y] = x
		else
			@p[x] = y
			@rank[y] += 1 if @rank[x] == @rank[y]
		end
	end

	def findSet(x)
		@p[x] = findSet(@p[x]) unless x == @p[x] 
		return @p[x]
	end

end

 
n = gets.split.map(&:to_i)
tree = DisjointSet.new(n[0])
n[1].times do
	a = gets.split.map(&:to_i)
	tree.unite(a[0], a[1])
end

n = gets.to_i

n.times do
	a = gets.split.map(&:to_i)
	if tree.same(a[0], a[1])
		puts "yes"
	else
		puts "no"
	end
end