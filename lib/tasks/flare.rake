namespace :flare do

  desc "Initialize flare data"
  task init: :environment do
    cfkey = ENV['CLOUDFLARE_API_KEY']
    cfemail = ENV['CLOUDFLARE_EMAIL']
    cfname = ENV['CLOUDFLARE_KEY_NAME'] || 'cloudflare'

    raise "CLOUDFLARE_API_KEY not found in ENV" unless cfkey.present?
    raise "CLOUDFLARE_EMAIL not found in ENV" unless cfemail.present?

    ex_key = Key.where(name: "cloudflare").first
    if ex_key.present?
      puts "cloudflare already detected"
    else
      puts "cloudflare installing.."
      Key.create!(
        key_type: :cloudflare,
        email_address: cfemail,
        name: cfname,
        value: cfkey
      )
    end
  end

  desc "Initialize domains"
  task domains: :environment do
    key = Key.where(name: "cloudflare-cosier").first
    return puts "Unable to proceed without a cloudflare key" unless key.present?

    if ENV['DOMAIN'].present? && ENV['ZONE'].present?
      r = Record.install(ENV['DOMAIN'], ENV['ZONE'], key)
      if r.present?
        puts "Records installed: #{r.label}"
      else
        puts "Records already installed... "
      end
    else
      puts "Records not installed: missing DOMAIN and ZONE config... :("
    end
  end

end
