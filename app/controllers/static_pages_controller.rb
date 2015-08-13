class StaticPagesController < ApplicationController
  include SelectionHelper
  def questions
    @finder = Finder.find_by(id: 4)
    set_question @finder
  end

  def pictures
    @images = Item.all
    @images = @images[0..19].shuffle
    set_image_array @images
  end
end
