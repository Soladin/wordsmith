class WordsController < ApplicationController
  before_filter :find_wordset
  before_filter :find_word, :only => [:show, :edit, :update, :destroy]

  def new
    @word = @wordset.words.build
  end
  
  def create
    @word = @wordset.words.build(params[:word])
    if @word.save
      flash[:notice] = "Word has been created."
      redirect_to [@wordset, @word]
    else
      flash[:alert] = "Word has not been created."
      render :action => "new"
    end
  end

  def show
  end

  private
  def find_wordset
    @wordset = Wordset.find(params[:wordset_id])
  end

  def find_word
    @word = @wordset.words.find(params[:id])
  end
end