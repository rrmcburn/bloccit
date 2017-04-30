class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :result))
    if @question.save
      flash[:notice] = "question was submitted."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update_attributes(params.require(:question).permit(:title, :body, :result))
      flash[:notice] = "question was updated."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving the question. Please try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "\"#{@question.title}\" successfully deleted"
      redirect_to questions_path
    else
      flash[:alert] = "Could not delete question. Please try again."
      render :show
    end
  end
end
