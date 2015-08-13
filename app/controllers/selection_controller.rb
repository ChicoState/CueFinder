class SelectionController < ApplicationController
  include SelectionHelper
  def new
    
  end

  def create
    @selection = Selection.new(selection_param)
    session_data(@selection)  
    if @selection.save
      render :nothing => true
    else
      flash[:notice_section_failed] = true
    end
  end

  private
  def selection_param
      params.permit(:item_id, :row, :column)
  end
end
