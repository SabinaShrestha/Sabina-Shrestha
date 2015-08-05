class WelcomeController < AuthenticatedController
  def index
  end

  def contact
    @contact = ContactForm.new
  end


end
