class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /users
  # GET /users.json
  def index
    authorize :user, :index?
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize :user, :show?
  end

  # GET /users/new
  def new
    authorize :user, :new?
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    authorize :user, :edit?
  end

  # POST /users
  # POST /users.json
  def create
    authorize :user, :create?

    @user = User.new(user_params)

    #Pegando hora atual do registro
    @user.registration_date = Time.now

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t(".notice") }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize :user, :update?

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t(".notice") }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize :user, :destroy?
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: t(".notice") }
      format.json { head :no_content }
    end
  end

  # Método responsável por alterar o atributo approved do Usuário
  # O atributo approved é responsável por possibilitar o acesso ao sistema
  def change_approved
    authorize :user, :change_approved?
    @user = User.find(params[:id])
    @user.approved = !@user.approved
    @user.save
    respond_to do |format|
      if @user.approved == true
        format.html { redirect_to @user, notice: t(".notice_true") }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { redirect_to @user, notice: t(".notice_false") }
        format.json { render :index, status: :ok, location: @user }
      end
    end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      #params.fetch(:user, {})
      params.require(:user).permit(:id,:username, :email, :salt, :encrypted_password,:name, :district_id,:user_group_id, :registration)
    end
end
