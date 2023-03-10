class FavouritesController < ApplicationController

  def index
    @favourite_doctors = current_user.doctor_profiles
  end

  def create
    @favourite = current_user.favourites.build(doctor_profile_id: params[:doctor_profile_id])
    if @favourite.save
      flash[:success] = "Doctor added to favourites"
    else
      flash[:danger] = "Unable to add doctor to favourites"
    end
    redirect_to favourites_path
  end

  def destroy
    @favourite = current_user.favourites.find_by(doctor_profile_id: params[:id])
    if @favourite.destroy
      flash[:success] = "Doctor removed from favourites"
    else
      flash[:danger] = "Unable to remove doctor from favourites"
    end
    redirect_to favourites_path
  end
end
