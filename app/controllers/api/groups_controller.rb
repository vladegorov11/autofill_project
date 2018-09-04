module Api
  class GroupsController < ApiController
    before_action :verification_auth_token, only: [:create]
    before_action :verification_api_token, only: [:index, :show]
    before_action :set_group 

    def index
      @groups = @project.groups
      render json: { groups: @groups }, status: :ok
    end

    def show
      render json: { group: [ @group, tags: @group.tags.pluck(:name)]}, status: :ok
    end

    def create
      
      render json: 
    end

    private

    def set_group
      @group = Group.find(params[:id])
    end
  end
end
