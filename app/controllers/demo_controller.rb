class DemoController < ApplicationController

	def index
		render('index')
	end
	
	def hello
		@subjects = Subject.all
		@id = params[:id]
		@page = params[:page]
		render('hello')
	end
	
	def redir
		redirect_to(:controller => 'demo', :action => 'index')
	end
end
