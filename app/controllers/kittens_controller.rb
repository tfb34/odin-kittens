class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Kitten was successfully saved."
			redirect_to @kitten
		else
			flash.now[:warning] = @kitten.errors.full_messages
			render 'new'
		end
		
	end

	def new
		@kitten  = Kitten.new
	end

	def edit

	end

	def show
		@kitten = Kitten.find_by(id: params[:id])
	end

	def update

	end

	def destroy
		byebug
	end

	private 

	def kitten_params
		params.require(:kitten).permit(:name,:age)
	end
end
