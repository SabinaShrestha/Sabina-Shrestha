class ContactController < ApplicationController

  # def index
  #   @users = User.all
  # end

  # def show
  #   @user = User.find_by(id: params[:id])
  # end

  # def create
  #   if file = params[:file]
  #     User.delay.create_by_csv(file)
  #     flash[:notice] = "Users are being uploaded!"
  #   else
  #     flash[:error] = "Please provide a users csv file."
  #   end
  #   redirect_to users_path
  # end

  # def index
  # end

  # def self.create_by_cvs(file)
  #   file = params[:file].tempfile
  #   CVS.parse(file.read(file), headers: true, header_converters: :symbol)

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
