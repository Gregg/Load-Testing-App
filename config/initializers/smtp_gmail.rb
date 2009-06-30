ActionMailer::Base.smtp_settings = {
  :tls => true,
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "stupidss.com",
  :authentication => :plain,
  :user_name => "Gregg@RailsEnvy.com",
  :password => "asdfasdf"
}
