class McQuestionsController < ApplicationController
  def new
    @items = Item.all
    @question = McQuestion.new
  end

  def create
    @question = McQuestion.new(question_params)
    if @question.save
      flash[:sucess] = "Added MC Question"
      redirect_to(:back)
    else
      flash[:error] = "error"
      redirect_to(:back)
    end
  end
  
  def edit
    @question = McQuestion.find(params[:id])
    @choices = McChoice.all
  end

  def update
    @question = McQuestion.find(params[:id])
    if @question.update(question_params)
      flash[:sucess] = "Added MC Choice"
      redirect_to(:back)
    else
      flash[:error] = "error"
      redirect_to(:back)
    end
  end

  def destroy
  end

  private
    def question_params
      params.require(:mc_question).permit(:prompt, :item_id, {:mc_choices => []})
      #if params.has_key?(:mc_choices)
      #  attributes[:mc_choices] = params[:mc_choices]
      #end
    end
end
