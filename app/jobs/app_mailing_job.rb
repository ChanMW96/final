class AppMailingJob < ActiveJob::Base
  queue_as :default

  def perform(email,msg)
    ApplyMailer.apply_email(email,msg).deliver_now
  end
end
