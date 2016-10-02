
list = Array.new

30.times do |i|
	list.push(i+1)
end

28.times do
	n = gets.to_i
	list.delete(n)
end

list.each do |v|
	puts v
end

