class CategoriesController < ApplicationController
  before_action:admin_user, only: [:new, :create]

  def index
   @categories = Category.all
  end

  def edit
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
    flash[:success] = "Saved successfully"
    redirect_to categories_path
    else 
      flash[:danger] = "Invaild content. Try again"
      render 'new'
  end
end

def show
end

  def update
  end

  def destroy
  end


 private
  def  category_params
     params.require(:category).permit(:title, :description)
   end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end

