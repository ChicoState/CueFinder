module UsersHelper
end

def create_all
  @animals = %w(camel 
               chimp 
               horse 
               llama
               moose 
               mouse
               puppy
               rhino
               zebra
               sloth
               sheep
               beaver
               coyote
               jaguar)

  @colors = %w(black
              white
              red
              blue
              yellow
              green
              purple
              pink
              brown
              orange)

  @username = Array.new
  @password = Array.new
  output = File.open("tmp/users.txt", "a")

  (0..100).each do
    
    @username << @colors.shuffle.first << @animals.shuffle.first << rand(9) << rand(9)
    @password << rand(100000..999999)

    output << @username.join << "\t" << @password.join << "\n"

    @password.clear
    @username.clear
  end
end

create_all
