class FindersController < ApplicationController
  def index
    @finders = Finder.all
  end

  def new
    @finder = Finder.new
    @finder.noneEnabled = true
    @finder.multipleChoice = true
    @finder.timed = true
  end

  def create
    @finder = Finder.new(finder_params)

    if @finder.save
    else
    end
  end

  def show(id)
    @finder = Finder.find_by(id: 4)
  end

  private

    def finder_params
      params.require(:finder).permit(:question, :noneEnabled, :multipleChoice, :timed)
    end
end

