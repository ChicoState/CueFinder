module StaticPagesHelper
  def view                #logged in? if not login
    if !logged_in?
      render 'sessions/new'
    else
      next_view           #if so, start survey
    end
  end

  def next_view
    if current_user.current_question == 0   #0 order render welcome
      render template: 'static_pages/welcome'
    else                    #>0 order render finder or mc_question
      @next = render_question
      if @next.class == Finder
        if render_items #render_question the same for pair of question/pictures
          set_render_items false
          render_pictures
        else
          set_render_items true
          render_finder
        end
      else
        render_followup
      end
    end
  end

  def render_finder
    @finder = @next
    set_cur_question(@finder.id)
    render 'static_pages/questions'
  end

  def render_pictures
    @images = cur_question.items
    #@images = @images[0..19].shuffle
    set_image_array @images #SessionHelper
    render 'static_pages/pictures'
  end

  def render_followup
    @question = @next
    @image = @question.item
    @choices = @question.mc_choices
    @response = McResponse.new
    render 'static_pages/followup'
  end
end
