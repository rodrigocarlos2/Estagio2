class ImageReportsController < ApplicationController
  before_action :set_image_report, only: [:show, :edit, :update, :destroy]

  # GET /image_reports
  # GET /image_reports.json
  def index
    authorize :image_report, :index?
    @image_reports = ImageReport.all
  end

  # GET /image_reports/1
  # GET /image_reports/1.json
  def show
    authorize :image_report, :show?
  end

  # GET /image_reports/new
  def new
    authorize :image_report, :new?
    @image_report = ImageReport.new
  end

  # GET /image_reports/1/edit
  def edit
    authorize :image_report, :edit?
  end

  # POST /image_reports
  # POST /image_reports.json
  def create
    authorize :image_report, :create?
    @image_report = ImageReport.new(image_report_params)

    respond_to do |format|
      if @image_report.save
        format.html { redirect_to @image_report, notice: 'Image report was successfully created.' }
        format.json { render :show, status: :created, location: @image_report }
      else
        format.html { render :new }
        format.json { render json: @image_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_reports/1
  # PATCH/PUT /image_reports/1.json
  def update
    authorize :image_report, :update?
    respond_to do |format|
      if @image_report.update(image_report_params)
        format.html { redirect_to @image_report, notice: 'Image report was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_report }
      else
        format.html { render :edit }
        format.json { render json: @image_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_reports/1
  # DELETE /image_reports/1.json
  def destroy
    authorize :image_report, :destroy?
    @image_report.destroy
    respond_to do |format|
      format.html { redirect_to image_reports_url, notice: 'Image report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_report
      @image_report = ImageReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_report_params
      params.require(:image_report).permit(:description,:avatar)
    end
end
