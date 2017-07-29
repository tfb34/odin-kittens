class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.html 
			format.json {render :json => @kittens.to_json}
		end
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
		@kitten = Kitten.find_by(id: params[:id])

	end

	def show
		@kitten = Kitten.find_by(id: params[:id])
		respond_to do |format|
			format.html
			format.json {render :json => @kitten.to_json}
		end
	end

	def update
		@kitten = Kitten.find_by(id: params[:id])
        if @kitten.update_attributes(kitten_params)
        	flash[:success] = "Successfully updated kitten's profile."
       		redirect_to @kitten
        else
        	flash.now[:warning] = "An error has occurred."
        	render 'edit'
        end

	end

	def destroy
		Kitten.find_by(id: params[:id]).destroy
		flash[:success] = "Kitten profile deleted."
		redirect_to kittens_url
	end

	private 

	def kitten_params
		params.require(:kitten).permit(:name,:age)
	end
end
