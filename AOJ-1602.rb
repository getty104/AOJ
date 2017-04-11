$data = []
ans = []

def culc ope, level
	case ope
	when '+'
		result = 0
		define_method :exe, -> (a,b) {a + b}
	when '*'
		result = 1
		define_method :exe, -> (a,b) {a * b}
	end
	loop{
		if $data.empty? || $data.first.length < level 
			return result
		else
			tmp = $data.first.split("").last.to_s
			if tmp == '*' || tmp == '+'
				ans = culc $data.shift.split("").last.to_s, level + 1
			else
				ans = $data.shift.split("").last.to_i
			end
		end
		result = exe result, ans
	}
end

loop{
	num = gets.to_i
	break if num == 0
	num.times do
		$data << gets.chomp 
	end
	if num == 1
		ans << $data.shift
	else
		ans << culc($data.shift, 2)
	end
}
ans.each do |a|
	puts a
end