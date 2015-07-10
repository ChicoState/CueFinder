class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
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
    (0..100).each do
      @username << @colors.shuffle.first << @animals.shuffle.first << (0..9).to_a.shuffle.first << (0..9).to_a.shuffle.first
      User.create(username: @username.join, password: "password")
      @username.clear
    end

  end
  
end
