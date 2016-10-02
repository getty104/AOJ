
l = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

w = gets.chomp.split("")

w.each do |v|
	print(l[(l.index(v).to_i-3)%26])
end
print("\n")