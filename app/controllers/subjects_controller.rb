class SubjectsController < ApplicationController

  layout false

  def index
    #@subjects = Subject.all
    # .sorted is a scope defined in subjects model
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "First Name Last Name"})
  end

  def edit
  end

  def delete
  end
end
