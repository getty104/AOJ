$MAX = 100
$WHITE = 0
$GRAY = 1
$BLACK = 2
$m = nil
$n = nil
def prim
	d = Array.new($n){Float::INFINITY}
	pp = Array.new($n){-1}
	color = Array.new($n){$WHITE}
	d[0] = 0

	loop{
		minv = Float::INFINITY
		u = -1
		$n.times do |i|
			if minv > d[i] && color[i] != $BLACK 
				u = i
				minv = d[i]
			end
		end

		break if u == -1
		color[u] = $BLACK
		$n.times do |v|
			if color[v] != $BLACK && $m[u][v] != Float::INFINITY
				if d[v] > $m[u][v] 
					d[v] = $m[u][v]
					pp[v] = u
					color[v] = $GRAY
				end
			end
		end
	}

	sum = 0
	$n.times do |i|
		sum += $m[i][pp[i]] unless pp[i]  == -1
	end
	return sum
end

$n = gets.to_i
$m = []
$n.times do |i|
	mm = gets.split.map(&:to_i)
	mm.map! { |mmm|
		mmm = mmm == -1 ? Float::INFINITY : mmm
	}
	$m << mm
	end

	puts prim





