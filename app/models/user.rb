class User < ApplicationRecord
    validates :email, presence: true,
    uniqueness: true

    before_create :check_for_login
    
    after_save :message
    before_save :create_payment

    has_one :payment, dependent: :destroy
    
    def create_payment
        Payment.create(user: self, name: "ritesh")  if payment.nil?
    end

    def check_for_login
        self.login =email if login.blank?
    end
    
    def message
        puts "Hello , i am created"
    end
end
