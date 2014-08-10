class User < ActiveRecord::Base
	has_one :group

	attr_accessor :unique_email

	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
end
