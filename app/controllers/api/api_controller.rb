module Api
  class ApiController < ActionController::API


    def verification_api_token 
        @project = Project.find_by_api_token(params[:api_token])
        head :unauthorized unless @project
    end

    def verification_auth_token 
        @project = Project.find_by_auth_token(params[:auth_token])
        head :unauthorized unless @project
    end

  end
end
