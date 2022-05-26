class CategoriesController < ApplicationController
  load_and_authorize_resource

  skip_before_action :authenticate_user!, only: :new_splash
  before_action :set_category, only: :show

  def new_splash
    render 'devise/sessions/splash', layout: 'splash'
  end

  def index
    @page_title = 'Categories'
    @categories = current_user.categories
  end

  def show
    @page_title = 'Transactions'
    render layout: 'categories_show'
  end

  def new
    @page_title = 'Categories'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save
        flash[:success] = 'Category has been created successfully'
        format.html { redirect_to categories_url }
      else
        flash[:danger] = 'Error: Category could not be created'
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
