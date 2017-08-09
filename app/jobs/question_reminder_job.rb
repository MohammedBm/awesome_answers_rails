class QuestionReminderJob < ApplicationJob
  queue_as :default


  # When creating any rails job, make sure there's a method called `perform` this is the method that will be called by ActiveJob(DelayJob) when the times comes
  def perform(question)
    puts 'JOB RAN! ð'
  end
end
