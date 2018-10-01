class Project < ApplicationRecord
	include Filterable

	has_many :groups, dependent: :destroy
	belongs_to :user
  has_secure_token  :auth_token
  has_secure_token  :api_token
	enum project_type: { web: 0, desktop: 1, mobile: 2 }

	validates :title, :description, :project_type, presence: true
	validates :domain, presence: true, unless: ->(project){project.project_type != 'web'}

	scope :project_type, -> (project_type) { where project_type: project_type }
	scope :starts_with, -> (title) { where("title like ?", "#{title}%")}
	scope :unarchived, -> { where(archived: false) }
	scope :archived, -> { where(archived: true) }

end
