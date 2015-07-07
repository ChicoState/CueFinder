class StaticPagesController < ApplicationController
  def question
  end

  def pictures
    @images = Dir.glob("app/assets/images/*.jpg")[0..19]
  end
end
