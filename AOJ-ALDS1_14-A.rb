
str = gets.to_s
dd = gets.to_s
ans = []
ind = 0
loop{
data = str.index(dd,ind)
if !data
	break
end
ind = data+1
ans << data+1
}

ans.each do |obj|
	puts obj
end