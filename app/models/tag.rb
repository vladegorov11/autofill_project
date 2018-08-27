class Tag < ApplicationRecord
	has_many :taggings, dependent: :destroy
	has_many :groups, through: :taggings
	validates :name, uniqueness: true
	validates :name, presence: true

	def self.import(group, file)
		CSV.foreach(file.path , headers: true) do |row|
			tag  = self.find_or_create_by row.to_hash
			group.tags.include?(tag) ? next : group.tags << tag
		end
	end

	def self.to_csv
    attributes = %w{name}
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |tag|
        csv << attributes.map{ |attr| tag.send(attr) }
      end
    end
  end

end
