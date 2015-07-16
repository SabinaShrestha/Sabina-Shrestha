class ContactController < ApplicationController

  def create
    c = ContactForm.new(contact_form_params)
    if c.deliver
      flash[:success] = "message sent successfully."     
    else
      flash[:error] = "sorry couldn't make it."
    end
    redirect_to contact_path
  end

  private
  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :phone, :message)
  end
end
