
def binarySearch(list,key,n)
	left = 0
	right = n
	while left < right 
		mid = (left + right) / 2
		if list[mid] == key
			return mid
		elsif key < list[mid]
			right = mid
		else
			left = mid + 1
		end
	end
	return false

end

n1 = gets.to_i

list1 = gets.split.map(&:to_i)

n2 = gets.to_i
list2 = gets.split.map(&:to_i)
ans = 0
list2.each do |obj|
	tmp = binarySearch(list1,obj.to_i,n1)
	if tmp
		ans += 1
	end
end

puts ans