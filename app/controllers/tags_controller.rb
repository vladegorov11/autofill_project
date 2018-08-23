class tagsController < ApplicationController
  layout 'dashboard'
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def edit
  end

  def update
    respond_to do |format|
      if @tag.update(params_tag)
        format.html { redirect_to @tag, notice: 'tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import

  end

  def export

  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def params_tag
    params.require(:tag).permit(:name)
  end

end
