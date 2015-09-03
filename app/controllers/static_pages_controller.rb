class StaticPagesController < ApplicationController
  include SelectionHelper
  def questions
    @finder = render_question
    set_question(@finder)
  end

  def pictures
    @images = Item.all
    @images = @images[0..19].shuffle
    set_image_array @images
  end

  def followup
    @question = render_question
    @image = @question.item
    @choices = @question.mc_choices
    @response = McResponse.new
  end

  def survey
    view
  end

  private
  def view                #logged in? if not login
    if !logged_in?
      render 'sessions/new'
    else
      next_view           #if so, start survey
    end
  end

  def next_view
    if current_user.current_question == 0   #0 order render welcome
      current_user.update_current_question
      render template: 'static_pages/welcome'
    else                    #>0 order render finder or mc_question
      if render_question.class == Finder
        @finder = render_question
        set_question(@finder)
        render template: 'static_pages/questions'
      else
        @question = render_question
        @image = @question.item
        @choices = @question.mc_choices
        @response = McResponse.new
        render 'static_pages#followup'
      end
    end
  end
end
