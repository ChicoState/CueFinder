class StaticPagesController < ApplicationController
  include SelectionHelper
  include StaticPagesHelper
  def questions
    @finder = render_question
    set_cur_question(@finder.id) #SessionHelper
  end

  def pictures
    @images = Item.all
    @images = @images[0..19].shuffle
    set_image_array @images #SessionHelper
  end

  def followup
    @question = render_question
    @image = @question.item
    @choices = @question.mc_choices
    @response = McResponse.new
  end

  def survey
    view  #StaticPagesHelper
  end

  def next_question
    if !render_items #render_question the same for pair of question/pictures
      current_user.update_current_question
    end
    render :js => "window.location = '#{root_path}'"
  end
end
