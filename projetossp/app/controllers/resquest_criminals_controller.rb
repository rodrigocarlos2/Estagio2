class ResquestCriminalsController < ApplicationController
  before_action :set_resquest_criminal, only: [:show, :edit, :update, :destroy]

  # GET /resquest_criminals
  # GET /resquest_criminals.json
  def index
    authorize :resquest_criminal, :index?
    @q = ResquestCriminal.ransack(params[:q])
    @resquest_criminals = @q.result

    @resquest_criminals = @resquest_criminals.paginate(:page => params[:page], :per_page => 7)
  end

  # GET /resquest_criminals/1
  # GET /resquest_criminals/1.json
  def show
    authorize :resquest_criminal, :index?
    @questions = @resquest_criminal.questions
  end

  # GET /resquest_criminals/new
  def new
    authorize :resquest_criminal, :new?
    @resquest_criminal = ResquestCriminal.new
  end

  # GET /resquest_criminals/1/edit
  def edit
    authorize :resquest_criminal, :edit?
  end

  # POST /resquest_criminals
  # POST /resquest_criminals.json
  def create
    authorize :resquest_criminal, :create?
    @resquest_criminal = ResquestCriminal.new(resquest_criminal_params)
    
    # Nessa linha a requisição atual é setada com o ID do usuário atual
    
    @resquest_criminal.user_id = current_user.id
    @resquest_criminal.district_resquest = current_user.district
    respond_to do |format|
      if @resquest_criminal.save
        questions = Question.where(question_default: true, resquest_type_id: @resquest_criminal.resquest_type_id)
        @resquest_criminal.questions << questions
        format.html { redirect_to @resquest_criminal, notice: 'Resquest criminal was successfully created.' }
        format.json { render :show, status: :created, location: @resquest_criminal }
      else
        format.html { render :new }
        format.json { render json: @resquest_criminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resquest_criminals/1
  # PATCH/PUT /resquest_criminals/1.json
  def update
    authorize :resquest_criminal, :update?
    respond_to do |format|
      if @resquest_criminal.update(resquest_criminal_params)
        format.html { redirect_to @resquest_criminal, notice: 'Resquest criminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @resquest_criminal }
      else
        format.html { render :edit }
        format.json { render json: @resquest_criminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resquest_criminals/1
  # DELETE /resquest_criminals/1.json
  def destroy
    authorize :resquest_criminal, :destroy?
    @resquest_criminal.question_resquest_criminals.each do |resquest|
      resquest.destroy
    end
    @resquest_criminal.destroy
    respond_to do |format|
      format.html { redirect_to resquest_criminals_url, notice: 'Resquest criminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resquest_criminal
      @resquest_criminal = ResquestCriminal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resquest_criminal_params
      params.require(:resquest_criminal).permit(:district_resquest_id, :district_send_id, :user_id, :resquest_type_id, :person_id, :pdf)
    end
end
