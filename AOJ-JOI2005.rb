
class Dice
	def initialize()
		@cent = 1
		@west = 4
		@south = 2
		@east = 3
		@north = 5
		@bottom = 6
		@sum = 1
	end

	def change(name)
		case name
		when "North" 
			tmp = @cent
			@cent = @south
			@south = @bottom
			@bottom = @north
			@north = tmp

		when "East"
			tmp = @cent
			@cent = @west
			@west = @bottom
			@bottom = @east
			@east = tmp

		when "West"
			tmp = @cent
			@cent = @east
			@east = @bottom
			@bottom = @west
			@west = tmp

		when "South"
			tmp = @cent
			@cent = @north
			@north = @bottom
			@bottom = @south
			@south = tmp

		when "Right"
			tmp = @north
			@north = @west
			@west = @south
			@south = @east
			@east = tmp

		when "Left"
			tmp = @north
			@north = @east
			@east = @south
			@south = @west
			@west = tmp
		end

		@sum += @cent
	end

	def getSum
		@sum
	end
end



ans = Array.new

loop do
	num = gets.to_i
	if num==0
		break
	end
	dice = Dice.new
	num.times do 
		name = gets.to_s.chomp
		name.strip!
		dice.change(name)
	end
	ans.push(dice.getSum)

end

ans.each do |n|
	puts n
end