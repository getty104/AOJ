

dammy = gets

list1 = gets.split.map(&:to_i)

dammy = gets
list2 = gets.split.map(&:to_i)
ans = 0
list2.each do |obj|
	ans += list1.include?(obj) ? 1 : 0
end

puts ans