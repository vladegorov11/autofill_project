class Project < ApplicationRecord
	has_many :groups, dependent: :destroy
	belongs_to :user
  has_secure_token  :auth_token
  has_secure_token  :api_token
end
