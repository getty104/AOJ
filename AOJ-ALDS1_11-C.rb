
def traverse
	
		a = []
		len = 1
		now = 0
		$list[now] = 1
		loop{
		$n.times do |i|
			if $m[now][i] == 1 && $list[i] == 0
				a << [i, len + 1]
				$data[i].len = len
				$list[i] = 1
			end
		end
	 return nil	if a.empty?
		nex = a.shift
		now = nex[0]
		len = nex[1]
	}
end

D = Struct.new(:len)
$n = gets.to_i
$time = 0
$m = Array.new($n){Array.new($n){0}}
$data = Array.new($n){D.new(-1)}
$list = Array.new($n){0}
$n.times do
	s = gets.split.map(&:to_i)
	i = s[0] - 1
	s[1].times do |l|
		j = s[l + 2] - 1
		$m[i][j] = 1 
	end
end
$data[0].len = 0
traverse



$n.times do |i|
	puts "#{ i + 1 } #{$data[i].len}"
end



