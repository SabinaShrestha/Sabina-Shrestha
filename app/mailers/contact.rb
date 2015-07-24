class Contact < ApplicationMailer
  include SendGrid
  # plain text email
  def send_contact_info
    mail :to => "sabina.pari@yahoo.com", 
         :subject => "Welcome #{user.name} :-)",
         :body => 'this is a email body'
  end
  # html email
  def send_contact_onfo_html
    mail :to => "sabina.pari@yahoo.com",
         :subject => "test html email subject"
  end
   # html email with args
  def email_with_args(to_email, from_email, subject)
    mail :to => to_email,
         :from => from_email,
         :subject => subject
  end

  def email_with_args_and_instance_vars(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    mail :to => "sabina.pari@yahoo.com",
    :subject => "test subject"
  end
end
