class FavoritesController < ApplicationController
    def create
        favorite = current_user.favorites.create(comment_id: params[:comment_id]) 
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        favorite = favorite.find_by(comment_id: params[:comment_id], user_id: current_user.id)
        favorite.destroy
        redirect_back(fallback_location: root_path)
    end
    
end
