require 'sidekiq-scheduler'

class CloudflareWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    puts "cloudflare-worker doing something"
    Record.all.map(&:process!)
  end
end
