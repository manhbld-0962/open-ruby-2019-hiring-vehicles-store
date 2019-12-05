class AlertMailer < ApplicationMailer
  def send_alert_mail
    Hiring.taking.each do |hiring|
      user = hiring.user
      mail(to: user.email, subject: t(".alert_bill")) do |format|
        format.html{render locals: alert_locals(hiring, user)}
      end
    end
  end

  private

  def alert_locals hiring, user
    {
      hiring_time: hiring.time,
      user_name: user.name,
      hiring_id: hiring.id,
      vehicle_name: hiring.vehicle_name,
      total: hiring.time * hiring.vehicle_price,
      branch_name: hiring.branch_name
    }
  end
end
