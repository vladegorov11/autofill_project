module Api
  class ProjectsController < ApiController
    before_action :restrict_access
    
    def index
       render json: { projects: @projects }, status: :ok
    end

  end
end
