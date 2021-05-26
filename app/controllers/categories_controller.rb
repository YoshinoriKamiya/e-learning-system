class CategoriesController < ApplicationController
  before_action:admin_user, only: [:new, :create, :show]

  def index
   @categories = Category.all
  end

  def edit
    @category = Category.find(params[:id])
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
  @categories = Category.all
end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Saved succesfully!"
      redirect_to categories_path
    else
      flash[:danger] = "Invalid content. Try again"
      render 'edit'
    end
  end

  def destroy
      Category.find(params[id]).destroy
      flash[:success] = "Category deleted"
      redirect_to categories_path
  end


 private
  def  category_params
     params.require(:category).permit(:title, :description)
   end

end

