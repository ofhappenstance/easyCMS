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

  def create 
    # instantiate a new object using form parameter 
    @subject = Subject.new(subject_params)
    # save the object 
    if @subject.save
    # if save succeeds, redirect to the index action 
      redirect_to(:action => 'index')
    else
    # if save fails, redisplay the form so user can fix problems 
      render('new')
    end
  end

  def edit
  end

  def delete
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
