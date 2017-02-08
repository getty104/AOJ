module CountingSort
	def counting_sort a, k
		n = a.size
		c = Array.new(k + 1){0}
		b = Array.new(k + 1){nil}
		n.times do |j|
			c[a[j]] += 1
		end

		1.upto k do |i|
			c[i] = c[i] + c[i - 1]
		end

		(n-1).downto 0 do |j|
			b[c[a[j]]] = a[j]
			c[a[j]] -= 1
		end
		return b.compact
	end
module_function :counting_sort
end

include CountingSort

n = gets.to_i
num = gets.split.map(&:to_i)
puts counting_sort(num, 2_000_000).join(" ")

