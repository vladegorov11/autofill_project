module RequestCounter
  extend ActiveSupport::Concern
  module ClassMethods

    def counter
      request = self.requests.find_or_create_by(created_at: Date.today)
      request.update(count: request.count.next)
    end

  end
end
