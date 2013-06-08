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



# ok i need to get some words in the database so i can see if what i'm doing with nested stuff is working.
# generate scaffold (find out what exactly scaffold does, I think makes MVC?) resource with name:string
# then rake db:migrate