class Api::UsersController < ApplicationController
 
 def index
 	render json: User.paginate(:page => params[:page])
 end	

 def create
 	@user = User.create(user_params)
 	render json: @user
 end 

 def update
    user = User.find_by_id(params[:id])
    user.update(user_params) if user
    render json: user 
 end

 def destroy
        user = User.delete(params[:id])
        render json: []
 end	

 def show
    user = User.find_by_id(params[:id])
    render json: user
 end	

 def typehead
   results = []
   input = params[:input] 
   User.matches(input).each do |user|
      results << user.firstName + ' ' + user.lastName  
   end
   all_matches = results.present? ? results.join(' and ') : ''
   render json: {matches: all_matches}
 end	


private

 def user_params
 	params.require(:user).permit(:firstName,:lastName,:email)
 end	




end
