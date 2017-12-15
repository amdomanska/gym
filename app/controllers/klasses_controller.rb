class KlassesController < ApplicationController
	def new
    	@klass = Klass.new
	end
	
	def create
		@klass = Klass.new(contact_params)
		if @klass.save
			flash[:success] = "Class added"
		else
			flash[:error] = @klass.errors.full_messages.join(", ")
		end
		redirect_to new_klass_path
	end
	
	private
	def contact_params
		params.require(:klass).permit(:name, :teacher, :day, :start, :duration)
	end
end