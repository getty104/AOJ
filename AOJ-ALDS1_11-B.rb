
def traverse  now
	if $list[now] == 1
		return nil
	else
		$list[now] = 1
		$time += 1
		$data[now].sta = $time
		$n.times do |i|
		 traverse i if $m[now][i] == 1
		end
		$time += 1
		$data[now].end = $time
	end
end

D = Struct.new(:sta, :end)
$n = gets.to_i
$time = 0
$m = Array.new($n){Array.new($n){0}}
$data = Array.new($n){D.new}
$list = Array.new($n){0}
$n.times do
	s = gets.split.map(&:to_i)
	i = s[0] - 1
	s[1].times do |l|
		j = s[l + 2] - 1
		$m[i][j] = 1 
	end
end

$n.times do |i|
	traverse i if $list[i] == 0
end


$n.times do |i|
	puts "#{ i + 1 } #{$data[i].sta} #{$data[i].end}"
end



