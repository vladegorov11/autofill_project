require 'elasticsearch/model'

class Tag < ApplicationRecord
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	has_many :taggings, dependent: :destroy
	has_many :groups, through: :taggings
	validates :name, uniqueness: true
	validates :name, presence: true

	def self.import_csv(group, file)
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

	settings index: { number_of_shards: 1 } do
	  mapping dynamic: "false" do
	    indexes :name, analyzer: 'english'
	  end
	end

	def self.search(query)
   __elasticsearch__.search(
   {
     query: {
        multi_match: {
          query: query,
          fields: ['name^10']
        }
      }
   })
 end

end
