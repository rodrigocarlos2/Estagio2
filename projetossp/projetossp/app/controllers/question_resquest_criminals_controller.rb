class QuestionResquestCriminalsController < ApplicationController
  before_action :set_question_resquest_criminal, only: [:show, :edit, :update, :destroy]

  # GET /question_resquest_criminals
  # GET /question_resquest_criminals.json
  def index
    authorize :question_resquest_criminal, :index?
    @question_resquest_criminals = QuestionResquestCriminal.all
  end

  # GET /question_resquest_criminals/1
  # GET /question_resquest_criminals/1.json
  def show
    authorize :question_resquest_criminal, :show?
  end

  # GET /question_resquest_criminals/new
  def new
    authorize :question_resquest_criminal, :new?
    @question_resquest_criminal = QuestionResquestCriminal.new
  end

  # GET /question_resquest_criminals/1/edit
  def edit
    authorize :question_resquest_criminal, :edit?
  end

  # POST /question_resquest_criminals
  # POST /question_resquest_criminals.json
  def create
    authorize :question_resquest_criminal, :create?
    @question_resquest_criminal = QuestionResquestCriminal.new(question_resquest_criminal_params)

    respond_to do |format|
      if @question_resquest_criminal.save
        format.html { redirect_to @question_resquest_criminal, notice: 'Question resquest criminal was successfully created.' }
        format.json { render :show, status: :created, location: @question_resquest_criminal }
      else
        format.html { render :new }
        format.json { render json: @question_resquest_criminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_resquest_criminals/1
  # PATCH/PUT /question_resquest_criminals/1.json
  def update
    authorize :question_resquest_criminal, :update?
    respond_to do |format|
      if @question_resquest_criminal.update(question_resquest_criminal_params)
        format.html { redirect_to @question_resquest_criminal, notice: 'Question resquest criminal was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_resquest_criminal }
      else
        format.html { render :edit }
        format.json { render json: @question_resquest_criminal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_resquest_criminals/1
  # DELETE /question_resquest_criminals/1.json
  def destroy
    authorize :question_resquest_criminal, :destroy?
    @question_resquest_criminal.destroy
    respond_to do |format|
      format.html { redirect_to question_resquest_criminals_url, notice: 'Question resquest criminal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_resquest_criminal
      @question_resquest_criminal = QuestionResquestCriminal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_resquest_criminal_params
      params.require(:question_resquest_criminal).permit(:question_id, :resquest_criminal_id)
    end
end
