class Order < ActiveRecord::Base

	 validates :name, presence: true
	 validates :email, presence: true
	 validates :description, presence: true, length: { minimum: 20 }
                    
end
