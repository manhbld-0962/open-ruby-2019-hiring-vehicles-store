set :output, error: "log/cron_error_log.log", standard: "log/cron_log.log"

every 20.minutes do
  rake "todos:mailalert"
end
