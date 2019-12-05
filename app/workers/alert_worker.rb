class AlertWorker
  include Sidekiq::Worker

  def perform
    AlertMailer.send_alert_mail.deliver_now
  end
end
