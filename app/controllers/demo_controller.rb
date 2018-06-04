class DemoController < ApplicationController

	layout 'application'

	def index
		render('index')
	end
	
	def hello
		@subjects = Subject.all
		render('hello')
	end
	
	def hello_params
		@subject = Subject.find(params[:id])
		@page = @subject.pages.find(params[:page])
		@id = params[:id]
		render('hello_params')
	end
	
	def redir
		redirect_to("demo/index")
	end
end
