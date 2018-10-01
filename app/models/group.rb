class Group < ApplicationRecord
  require 'csv'
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :project
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :requests, dependent: :destroy

  validates :name, presence: true, length: { in: 6..100 }
  validates  :description,  presence: true, length: { in: 20..500 }

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(name)
    self.tags = name.split(',').map {|name| Tag.where(name: name.strip).first_or_create!}
  end

  def counter
    request = self.requests.find_or_create_by(created_at: Date.today() )
    request.update(count: request.count.next)
    return self
  end

end
