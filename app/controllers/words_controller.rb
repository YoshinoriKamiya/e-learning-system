class WordsController < ApplicationController
  
  def index
    @words = Word.where(:category_id = params[:category_id])
  end

  def new
    @word = Word.new
    @categories_name = Category.find(params[:category_id])
    3.times {@word.choices.build}
  end

  def edit
    @word = Word.find(params[:word_id])
  end

  def update
    @word = Word.find(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Saved succesfully!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid content. Try again"
      render 'edit'
    end
  end

  def show
    @word = Word.find(params[:id])
    @categories_name = Category.find(params[:category_id])
  end 

  def create
     @words = Word.new(word_params)
     if @words.save
      flash[:success] = "Saved successfully"
     redirect_to root_path
    else
      flash[:danger] = "Invaild content. Try again"
      redirect_back(fallback_location: root_path)
     end
  end

def destroy
      Word.find(params[id]).destroy
      flash[:success] = "word deleted"
      redirect_to root_path
end

 private
  def word_params
    params.require(:word).permit(:category_id, :word, choices_attributes: [:word_id, :choice,:correct_ans])
  end
end
