
class Func
	def initialize()
		@list = Hash.new
	end

def insert(str)
  @list[str] = true
end


def find(str)
	if @list.has_key?(str)
		return "yes"
	else
		return "no"
	end
end


end

n = gets.to_i
f = Func.new
ans = []
n.times do
	command,str = gets.split.map(&:to_s)
	if command == "insert"
		f.insert(str)
	else
		ans << f.find(str)
	end
end

ans.each do |s|
	puts s
end

