class WordsetsController < ApplicationController

  def index
    @wordsets = Wordset.all
  end

  def new
    @wordset = Wordset.new
  end

  def create
    @wordset = Wordset.new(params[:wordset])
    if @wordset.save
      flash[notice] = "Wordset got saved!"
      redirect_to @wordset
    else
      flash[:alert] = "Wordset wasn't got saved!"
      render :action => "new"
    end
  end

  private
  def find_wordset
    @wordset = Wordset.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
    #   flash[:alert] = "The wordset you were looking for could not be found."
    #   redirect_to wordsets_path
    # end
  end
end
