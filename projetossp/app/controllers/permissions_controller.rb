class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]

  # GET /permissions
  # GET /permissions.json
  def index
    authorize :permission, :index?
    @q = Permission.ransack(params[:q])
    @permissions = @q.result

    @permissions = @permissions.paginate(:page => params[:page], :per_page => 7)
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    authorize :permission, :show?
  end

  # GET /permissions/new
  def new
    authorize :permission, :new?
    @permission = Permission.new
  end

  # GET /permissions/1/edit
  def edit
    authorize :permission, :edit?
  end

  # POST /permissions
  # POST /permissions.json
  def create
    authorize :permission, :create?
    @permission = Permission.new(permission_params)

    respond_to do |format|
      if @permission.save
        format.html { redirect_to @permission, notice: 'Permission was successfully created.' }
        format.json { render :show, status: :created, location: @permission }
      else
        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    authorize :permission, :update?
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to @permission, notice: 'Permission was successfully updated.' }
        format.json { render :show, status: :ok, location: @permission }
      else
        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    authorize :permission, :destroy?
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url, notice: 'Permission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def permission_params
      params.require(:permission).permit(:name, :description)
    end
end
