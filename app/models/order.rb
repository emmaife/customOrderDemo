class Order < ActiveRecord::Base
  include MailForm::Delivery

	attributes :name, :validate => true
	attributes :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attributes :description, :validate => true

	 #validates :name, presence: true
	 #validates :email, presence: true
	 #validates :description, presence: true, length: { minimum: 20 }

	

	 def headers
    {
      :subject => "New Custom Order Request",
      :to => "emma.s.ife@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
                    
end
