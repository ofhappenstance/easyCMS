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
    @subject = Subject.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
      # If update succeeds, redirect to the index action 
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy 
    @subject = Subject.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end


  private

    def subject_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end

end
