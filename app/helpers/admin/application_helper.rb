module Admin::ApplicationHelper
  def chart_data
    Hiring.monthly_statistic
  end
end
