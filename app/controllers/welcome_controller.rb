class WelcomeController < ApplicationController
  def index
  end

  def contact
    @contact = ContactForm.new
  end
end
