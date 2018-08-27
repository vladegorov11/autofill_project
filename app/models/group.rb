class Group < ApplicationRecord
	require 'csv'
	belongs_to :project
  has_many :taggings, dependent: :destroy
	has_many :tags, through: :taggings

	def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(name)
    self.tags = name.split(',').map {|name| Tag.where(name: name.strip).first_or_create!}
  end

	
end
