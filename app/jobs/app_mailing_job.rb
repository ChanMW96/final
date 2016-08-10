class AppMailingJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    ApplyMailer.apply_email(user,msg).deliver_now
  end
end
