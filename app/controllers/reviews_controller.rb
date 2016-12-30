class ReviewsController < ApplicationController
   
   before_action :require_user, except: [:show]
   
   def new
     review = Review.where(["recipe_id = ? and chef_id = ?", params[:id], session[:chef_id]])
     if review.empty?
        @review = Review.new
     else
        flash[:danger] = "Sorry you can only review a recipe once." 
        redirect_to recipes_path + '/' + params[:id]
    end
   end
   
   def create
    @review = Review.new(body: review_params[:body], recipe_id: params[:id], chef_id: session[:chef_id])
    
    if @review.save
      flash[:success] = "review was created successfully"
        redirect_to recipes_path + "/" + params[:id]
    else
      render 'new'
    end
   end
   
   def show

   end
   
   private
   
   def review_params
       params.require(:review).permit(:body)
   end
   
   
      
end