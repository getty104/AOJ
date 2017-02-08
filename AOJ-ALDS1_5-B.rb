module Merge
	def merge!(a,left,mid,right)
		n1 = mid - left 
		n2 = right - mid
		count = 0
		l = []
		r = []
		n1.times do |i|
			l << a[left + i]
		end
		l << Float::INFINITY
		n2.times do |i|
			r << a[mid + i]
		end 
		r << Float::INFINITY
		i = 0
		j = 0

		left.upto(right - 1) do |k|
			if l[i] <= r[j]
				a[k] = l[i]
				i += 1
				count += 1
			else
				a[k] = r[j]
				j += 1
				count += 1
			end
		end
		return count
	end

	def merge_sort!(a, left, right, count)
		ans = 0
		if left + 1 < right
			mid = (left + right)/2
		ans +=	merge_sort!(a, left, mid, count)
		ans +=	merge_sort!(a, mid, right, count)
		ans +=	merge!(a, left, mid, right) 
		end
		return ans
	end

	module_function :merge!, :merge_sort!
end

include Merge
n = gets.to_i 
m = gets.split.map(&:to_i)

ans = merge_sort!(m, 0, n, 0)

puts m.join(" ")
puts ans