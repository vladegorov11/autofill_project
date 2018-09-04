module Api
  class GroupsController < ApiController
    before_action :verification_auth_token, only: [:create]
    before_action :verification_api_token, only: [:index, :show]
    before_action :set_group, only: [:show]

    def index
      @groups = @project.groups
      render json: { groups: @groups.pluck(:name) }, status: :ok
    end

    def show
      @project.groups.include?(@group) if
        render json: { group: [ @group.slice( :name), tags: @group.tags.pluck(:name)]}, status: :ok
      else
        head :bad_request
    end

    private

    def set_group
      @group = Group.friendly.find(params[:id])
    end
  end
end
