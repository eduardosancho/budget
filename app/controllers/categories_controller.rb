class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: :new_splash

  def new_splash
    render 'devise/sessions/splash', layout: 'splash'
  end
end
