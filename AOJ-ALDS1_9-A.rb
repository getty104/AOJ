n = gets.to_i
m = gets.split.map(&:to_i)

n.times do |i|
	str = ""
	str += "node #{i+1}: key = #{m[i]}, "
	str += "parent key = #{m[(i+1)/2 - 1 ]}, " if i != 0
	str += "left key = #{m[2*i+1]}, " if  m[2*i + 1]
	str += "right key = #{m[2*i + 2]}, " if  m[2*i + 2]
	puts str
end



1