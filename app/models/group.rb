class Group < ApplicationRecord
	require 'csv'
	extend FriendlyId
  friendly_id :name, use: :slugged
	belongs_to :project
  has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	validates :name, presence: true, length: { in: 6..100 }
	validates  :description,  presence: true, length: { in: 20..500 }

	def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(name)
    self.tags = name.split(',').map {|name| Tag.where(name: name.strip).first_or_create!}
  end
end
