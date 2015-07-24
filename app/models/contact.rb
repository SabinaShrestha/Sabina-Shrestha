class Contact < ActiveRecord::Base
  validates_presence_of :name

  def about
    "#{self.name} is all about #{self.about}"
  end

  def self.create_by_csv(file)
    file = params[:file].tempfile
    CSV.parse(File.read(file), headers: true, header_converters: :symbol).each do |row|
      next if Contact.find_by(email: row[:email].strip)
      user = Contact.new
      # strip takes out all the leading and trailing whitespace
      user.email = row[:email].strip
      user.about = row[:about].strip
      user.gender = row[:gender].strip
      if contact.save
        Contact.send_contact_info_html.deliver
      else
        Contact.email_with_args_and_instance_vars('Jake', 'Sorce').deliver
      end
    end
  end
end
