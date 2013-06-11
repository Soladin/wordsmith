class WordsetsController < ApplicationController
  # @word = @wordset.words.build

  def index
    @wordsets = Wordset.all
    @wordset = Wordset.new
  end

  # DON'T NEED NEW ACTION because ... and this was also messing up the edit action
  # def new
  #   @wordset = Wordset.new
  # end

  def create
    puts params[:wordset]
    @wordset = Wordset.new(params[:wordset])
    if @wordset.save
      flash[:notice] = "Wordset got saved!"
      redirect_to @wordset
    else
      flash[:alert] = "Wordset wasn't got saved!"
      redirect_to wordsets_path
      # render :action => "new"
    end
  end

  def show
    @wordset = Wordset.find(params[:id])
    @words = @wordset.words
  end

  def edit
    @wordset = Wordset.find(params[:id])
  end

  def update
    @wordset = Wordset.find(params[:id])
    @wordset.update_attributes(params[:wordset])
    flash[:notice] = "Wordset has been updated."
    redirect_to @wordset
  end

  def destroy
    @wordset = Wordset.find(params[:id])
    @wordset.destroy
    flash[:notice] = "Project got deleted, man."
    redirect_to wordsets_path
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
