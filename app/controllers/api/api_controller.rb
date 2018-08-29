module Api
  class ApiController < ActionController::API

    def restrict_access
        @projects = Project.find_by_api_token(params[:api_token])
        head :unauthorized unless @projects
    end

  end
end
