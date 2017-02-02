require "../Ruby_Library/binarytree"
n = gets.to_i
head = Tree.new

n.times do
	num = gets.to_s.chomp!
	if num == "print"
		center = []
		head.center_crawl do |key, value|
			center << key
		end
		preceding = []
		head.preceding_crawl do |key, value|
			preceding << key
		end

		puts " #{center.join(" ")}"
		puts " #{preceding.join(" ")}"
	else
		num = num.split
		if num[0].to_s == "insert"
			head.insert(num[1].to_i,"dummy")
		elsif num[0].to_s == "delete"
			head.delete_key num[1].to_i 
		else
			puts head.find(num[1].to_i) ?  "yes" : "no"
		end

	end

end