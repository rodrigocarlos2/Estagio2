class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :edit, :update, :destroy]

  # GET /districts
  # GET /districts.json
  def index
    authorize :district, :index?
    @q = District.ransack(params[:q])
    @districts = @q.result

    @districts = @districts.paginate(:page => params[:page], :per_page => 7)
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    authorize :district, :show?
  end

  # GET /districts/new
  def new
    authorize :district, :new?
    @district = District.new
  end

  # GET /districts/1/edit
  def edit
    authorize :district, :edit?
  end

  # POST /districts
  # POST /districts.json
  def create
    authorize :district, :create?
    @district = District.new(district_params)

    respond_to do |format|
      if @district.save
        format.html { redirect_to @district, notice: 'District was successfully created.' }
        format.json { render :show, status: :created, location: @district }
      else
        format.html { render :new }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    authorize :district, :update?
    respond_to do |format|
      if @district.update(district_params)
        format.html { redirect_to @district, notice: 'District was successfully updated.' }
        format.json { render :show, status: :ok, location: @district }
      else
        format.html { render :edit }
        format.json { render json: @district.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    authorize :district, :destroy?
    @district.destroy
    respond_to do |format|
      format.html { redirect_to districts_url, notice: 'District was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_params
      params.require(:district).permit(:district_id, :name, :public_place, :city, :state, :cep, :phone, :email, :neighborhood, :second_phone)
    end
end
