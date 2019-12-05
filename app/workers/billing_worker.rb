class BillingWorker
  include Sidekiq::Worker

  def perform hiring_id, user_id
    hiring = Hiring.find_by id: hiring_id
    user = User.find_by id: user_id
    BillingMailer.send_mail_billing(hiring, user).deliver_now
  end
end
