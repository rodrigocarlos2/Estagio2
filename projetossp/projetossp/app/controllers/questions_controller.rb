class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_resquest_criminal
  # GET /questions
  # GET /questions.json
  def index
    authorize :question, :index?
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    authorize :question, :show?
  end

  # GET /questions/new
  def new
    authorize :question, :new?
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    authorize :question, :edit?
  end

  # POST /questions
  # POST /questions.json
  def create
    authorize :question, :create?
    @question = Question.new(question_params)
    @question.resquest_criminals << @resquest_criminal
    respond_to do |format|
      if @question.save
        format.html { redirect_to [@resquest_criminal,@question], notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    authorize :question, :update?
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to [@resquest_criminal,@question], notice: 'Question was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    authorize :question, :destroy?
    unless @question.question_default
      @question.destroy
    else
      @question.resquest_criminals.delete(@resquest_criminal)
    end
    respond_to do |format|
        format.html { redirect_to resquest_criminal_path(@resquest_criminal), notice: 'Question was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
  
    def set_resquest_criminal
      @resquest_criminal = ResquestCriminal.find(params[:resquest_criminal_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:resquest_type_id, :description, :question_default, :resquest_criminal_id)
    end
end
