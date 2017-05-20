class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :set_resquest_criminal, except: [:general, :index]
  
  def general
    authorize :report, :general?
    @resquest_criminals = ResquestCriminal.where(district_send: current_user.district, status: 0)
    @reports = Report.where(user: current_user)

    @general_reports = Report.where.not(user: current_user)

    @general_reports = @general_reports.paginate(:page => params[:page], :per_page => 7)
  end
  # GET /reports
  # GET /reports.json
  def index

    # Essa página é exclusiva de agente

    authorize :report, :index?

    @q = Report.ransack(params[:q])
    @reports = @q.result

    @reports = @reports.paginate(:page => params[:page], :per_page => 10)
    
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    authorize :report, :show?
  end

  # GET /reports/new
  def new
    authorize :report, :new?
    @report = Report.new
    @report.resquest_criminal = @resquest_criminal
    # Construído answer dentro do report
    @resquest_criminal.questions.each do |question|
      @report.answers.build question_id: question.id
    end
  end

  # GET /reports/1/edit
  def edit
    authorize :report, :edit?
  end

  # POST /reports
  # POST /reports.json
  def create
    authorize :report, :create?
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.resquest_criminal = @resquest_criminal
    @report.resquest_criminal.status = 1
    @report.resquest_criminal.save
    respond_to do |format|
      if @report.save
        format.html { redirect_to [@resquest_criminal,@report], notice: 'Report was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    authorize :report, :update?
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to [@resquest_criminal,@report], notice: 'Report was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    authorize :report, :destroy?
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end
    
    def set_resquest_criminal
      @resquest_criminal = ResquestCriminal.find(params[:resquest_criminal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:resquest_criminal_id, :user_id, 
                    :image_reports_attributes => [:id, :avatar, :description, :_destroy], 
                    answers_attributes: [:id, :report_id, :question_id, :description])
    end
end
