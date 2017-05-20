class ResquestTypesController < ApplicationController
  before_action :set_resquest_type, only: [:show, :edit, :update, :destroy]

  # GET /resquest_types
  # GET /resquest_types.json
  def index
    authorize :resquest_type, :index?
    @q = ResquestType.ransack(params[:q])
    @resquest_types = @q.result
  end

  # GET /resquest_types/1
  # GET /resquest_types/1.json
  def show
    authorize :resquest_type, :show?
  end

  # GET /resquest_types/new
  def new
    authorize :resquest_type, :new?
    @resquest_type = ResquestType.new
  end

  # GET /resquest_types/1/edit
  def edit
    authorize :resquest_type, :edit?
  end

  # POST /resquest_types
  # POST /resquest_types.json
  def create
    authorize :resquest_type, :create?
    @resquest_type = ResquestType.new(resquest_type_params)

    respond_to do |format|
      if @resquest_type.save
        format.html { redirect_to @resquest_type, notice: 'Resquest type was successfully created.' }
        format.json { render :show, status: :created, location: @resquest_type }
      else
        format.html { render :new }
        format.json { render json: @resquest_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resquest_types/1
  # PATCH/PUT /resquest_types/1.json
  def update
    authorize :resquest_type, :update?
    respond_to do |format|
      if @resquest_type.update(resquest_type_params)
        format.html { redirect_to @resquest_type, notice: 'Resquest type was successfully updated.' }
        format.json { render :show, status: :ok, location: @resquest_type }
      else
        format.html { render :edit }
        format.json { render json: @resquest_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resquest_types/1
  # DELETE /resquest_types/1.json
  def destroy
    authorize :resquest_type, :destroy?
    @resquest_type.destroy
    respond_to do |format|
      format.html { redirect_to resquest_types_url, notice: 'Resquest type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resquest_type
      @resquest_type = ResquestType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resquest_type_params
      params.require(:resquest_type).permit(:name, :description)
    end
end
