class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question, only: [:create]


  def create
    like = Like.new user: current_user, question: @question
    if cannot? :like, @question
      redirect_to @question, alert: 'You Can Like Your Own Question 💀 !!!! '
    elsif like.save
      redirect_to @question, notice: 'Thanks for liking!'
    else
        redirect_to @question, alert: like.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @like.destroy
      redirect_to @like.question, notice: '🙃'
    else
      redirect_to @like.question, alert: @like.errors.full_messages.join(', ')
    end
  end



  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_like
    @like = Like.find(params[:id])
  end


end
