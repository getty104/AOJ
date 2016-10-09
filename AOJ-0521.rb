ans = []

loop{
	m = gets.to_i
	if m==0
		break
	end
	money = 1000 - m
	num = 0
	list = [500,100,50,10,5,1]
	list.each do |coin|
		num += money/coin
		money %= coin
	end

	ans << num
}

ans.each do |a|
	puts a
end