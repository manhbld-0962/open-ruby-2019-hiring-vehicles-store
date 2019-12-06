namespace :todos do
  task mailalert: :environment do
    AlertWorker.perform_async
  end
end
