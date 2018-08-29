module Api
  class GroupsController < ApiController
    before_action :restrict_access

    def index
       @groups = @projects.groups
       render json: { groups: @groups }, status: :ok
    end

    def show

    end

    def create

    end

    private


  end
end
