class Project < ApplicationRecord
	has_many :groups, dependent: :destroy
	belongs_to :user
  has_secure_token  :auth_token
  has_secure_token  :api_token
	enum project_type: { web: 0, desktop: 1, mobile: 2 }

	validates :title, :description, :project_type, presence: true
	validates :domain, presence: true, unless: ->(project){project.project_type != 'web'}
end
