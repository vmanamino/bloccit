if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp 
  ActionMailer::Base.smtp_settings = 
  { address: 'smtp.sendgrid.net', 
    port: '587', 
    authentication: :plain, 
    user_name: "app35275271@heroku.com", #ENV['SENDGRID_USERNAME'], 
    password: "hlbvxcbu", #ENV['SENDGRID_PASSWORD'], 
    domain: 'heroku.com', 
    enable_starttls_auto: true }

end

