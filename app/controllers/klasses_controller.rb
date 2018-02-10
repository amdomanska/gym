class KlassesController < ApplicationController
	before_action :fix_params, only: [:create, :update]
	
	def index
	  @klasses_mon = Klass.order(:start).where(day: 'MON').find_each
	  @klasses_tue = Klass.order(:start).where(day: 'TUE').find_each
	  @klasses_wed = Klass.order(:start).where(day: 'WED').find_each
	  @klasses_thu = Klass.order(:start).where(day: 'THU').find_each
	  @klasses_fri = Klass.order(:start).where(day: 'FRI').find_each
	  @klasses_sat = Klass.order(:start).where(day: 'SAT').find_each
	  @klasses_sun = Klass.order(:start).where(day: 'SUN').find_each
	  
	end
	
	def new
    	@klass = Klass.new
	end
	
	def create
		@klass = Klass.new(klass_params)
	    if @klass.save
	        flash[:success] = "Class added"
	    else
	        flash[:error] = @klass.errors.full_messages.join(", ")
	    end
	    redirect_to new_klass_path
	end
	
	private

    def klass_params
      params.require(:klass).permit(:name, :teacher, :day, :start, :duration)
    end

    def fix_params
      if params[:klass].blank?
        # parent not provided
        return
      end
      start_hour = params[:klass].delete(:start_hour)
      start_mins = params[:klass].delete(:start_mins)

      if start_hour.blank? || start_mins.blank?
        # consider handling this case
      else
        params[:klass][:start] = start_hour.to_i * 60 + start_mins.to_i
      end
    end

end