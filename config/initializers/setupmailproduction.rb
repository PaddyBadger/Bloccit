if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['app17767690@heroku.com'],
    :password       => ENV['qqoljd8v'],
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end