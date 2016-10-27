



def fibo(n1,n2)
	return n1+n2
end

list = []

list<< 1
list<< 1

n = gets.to_i

2.upto(n) do |i|
	list << fibo(list[i-2],list[i-1])
end

puts list[n]