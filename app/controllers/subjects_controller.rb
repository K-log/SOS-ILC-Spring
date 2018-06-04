class SubjectsController < ApplicationController
	
	layout 'user'
	
  def index
		@subjects = Subject.sorted
  end

  def show
		@subject = Subject.find(params[:id])
  end

  def new
		@subject = Subject.new(:name => "Default", :visible => false)
		@subject_count = Subject.count + 1
  end
	
	def create
		# Instantiate a new object using form parameters
		@subject = Subject.new(subject_params)
		# Save the object
		if @subject.save
			# If save succeeds, redirect to the index actions
			flash[:notice] = "Created '#{@subject.name}' successfully."
			redirect_to(subjects_path)
		else
			# If save fails, redisplay the form so user can fix the problems
			flash[:error] = "Create unsuccessful! Please try again."
			@subject_count = Subject.count + 1
			render('new')
		end
	end

  def edit
		@subject = Subject.find(params[:id])
		@subject_count = Subject.count
  end

	def update
		# Find a subject using form parameters
		@subject = Subject.find(params[:id])
		# Update the object
		if @subject.update_attributes(subject_params)
			# If save succeeds, redirect to the show actions
			flash[:notice] = "Updated '#{@subject.name}' successfully."
			redirect_to(subjects_path(@subject))
		else
			# If save fails, redisplay the form so user can fix the problems
			flash[:error] = "Update unsuccessful! Please try again."
			@subject_count = Subject.count + 1
			render('edit')
		end
	end
	
  def delete
		@subject = Subject.find(params[:id])	
  end
	
	def destroy
		@subject = Subject.find(params[:id])
		@subject.destroy
		flash[:notice] = "Destroyed '#{@subject.name}' successfully."
		redirect_to(subjects_path)
	end
	
	def subject_params
		params.require(:subject).permit(:name, :position, :visible)
	end
end
