require 'sidekiq-scheduler'

class CloudflareWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    Address.current
    Record.all.map(&:process!)
  end
end
