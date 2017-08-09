class QuestionMailer < ApplicationMailer

  def send_reminder(question)
    @question = question
    @user = question.user
    if @user.presemt?
      mail(to: @user.eamil, subject:'Question Reminder')

  end
end
