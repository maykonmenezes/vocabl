class WordsController < ApplicationController
  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(words_params)
    if @word.save
      redirect_to(words_path)
    else
      render :new
    end
  end

  def word_params
    params.require(:word).permit(:value, :language)
  end
end
