class GroupPermissionsController < ApplicationController
  before_action :set_group_permission, only: [:show, :edit, :update, :destroy]

  # GET /group_permissions
  # GET /group_permissions.json
  def index
    authorize :group_permission, :index?
    @q = GroupPermission.ransack(params[:q])
    @group_permissions = @q.result

    @group_permissions = @group_permissions.paginate(:page => params[:page], :per_page => 7)
  end

  # GET /group_permissions/1
  # GET /group_permissions/1.json
  def show
    authorize :group_permission, :show?
  end

  # GET /group_permissions/new
  def new
    authorize :group_permission, :new?
    @group_permission = GroupPermission.new
  end

  # GET /group_permissions/1/edit
  def edit
    authorize :group_permission, :edit?
  end

  # POST /group_permissions
  # POST /group_permissions.json
  def create
    authorize :group_permission, :create?
    @group_permission = GroupPermission.new(group_permission_params)

    respond_to do |format|
      if @group_permission.save
        format.html { redirect_to @group_permission, notice: 'Group permission was successfully created.' }
        format.json { render :show, status: :created, location: @group_permission }
      else
        format.html { render :new }
        format.json { render json: @group_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_permissions/1
  # PATCH/PUT /group_permissions/1.json
  def update
    authorize :group_permission, :update?
    respond_to do |format|
      if @group_permission.update(group_permission_params)
        format.html { redirect_to @group_permission, notice: 'Group permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_permission }
      else
        format.html { render :edit }
        format.json { render json: @group_permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_permissions/1
  # DELETE /group_permissions/1.json
  def destroy
    authorize :group_permission, :destroy?
    @group_permission.destroy
    respond_to do |format|
      format.html { redirect_to group_permissions_url, notice: 'Group permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_permission
      @group_permission = GroupPermission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_permission_params
      params.require(:group_permission).permit(:user_group_id, :segment_id, :permission_id)
    end
end
