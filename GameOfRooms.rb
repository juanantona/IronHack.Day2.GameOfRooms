require "pry"

#########################
#CLASS DECLARATION
#########################

class Room
  
  attr_accessor :id, :description, :options

  def initialize(id, description)
    @id = id
    @description = description
	@options = []
  end

  def add_option(direction, next_id)
  	@options.push([direction, next_id])
  end	

end

class Map
  
  attr_accessor :rooms

  def initialize
  	@rooms = []
  end

  def add_room(room)
    @rooms = room
  end	

end

class Game
  
  attr_accessor :current_position, :player_positions

  def initialize
  	@current_stage = "stage0"
  	@current_position = 0
  	@player_positions = [@current_position]
  end

  def execute_command(command)
  	@current_stage.rooms.each do |rooms|
  	  if rooms.id == @current_position
  	    rooms.options.each do |options| 
          if rooms.options[0] == command #Si el comando ejecutado corresponde con una de las opciones
            @current_position = rooms.options[1]
            @player_positions.push(rooms.options[1])
          end # if
        end #each options	
  	  end #if	
    end #each rooms
end 

end	

#########################
#INSTANCE STAGE 1
#########################

room0 = Room.new 0, "Puedes ir al sur"
room0.add_options ["S", 1]
room1 = Room.new 1, "text_room1"
room1.add_options ["S", 2]
room1.add_options ["W", 4]
room2 = Room.new 2, "text_room2"
room2.add_options ["W", 3]
room3 = Room.new 3, "text_room3"
room3.add_options ["N", 4]
room3.add_options ["S", 5]
room4 = Room.new 4, "text_room4"
room4.add_options ["E", 1]
room4.add_options ["S", 3]
room5 = Room.new 5, "text_room5"

stage0 = Map.new
sateg0.add_room(room0)
sateg0.add_room(room1)
sateg0.add_room(room2)
sateg0.add_room(room3)
sateg0.add_room(room4)
sateg0.add_room(room5)

#########################
#MAIN
#########################

juan = Game.new 

puts "You are in the room 0"
puts "Where do you go?"
command = gets.chomp

juan.execute_command(command)
puts juan.current_position