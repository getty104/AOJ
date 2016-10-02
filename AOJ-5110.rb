
n1 = gets.split.map(&:to_i)
n2 = gets.split.map(&:to_i)

score1 = 0
score2 = 0
n1.each do |v|
	score1 += v
end

n2.each do |v|
	score2 += v
end

if score1>score2
	puts score1
else
	puts score2
end