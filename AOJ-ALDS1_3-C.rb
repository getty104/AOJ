

n = gets.to_i
list = []

n.times do
	command = gets.chomp!.to_s
	
	if command == "deleteFirst"
		list.shift
	elsif command == "deleteLast"
		list.pop
		
	else
		command , key = command.split
		if command.to_s == "insert"
			list.unshift key.to_i
		elsif command.to_s == "delete"
			num = list.find_index{ |v| v == key.to_i}
			if num
				list.delete_at(num)
			end
		end
	end
end


puts list.join(" ")