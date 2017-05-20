class AuditorController < ApplicationController
  def index
    authorize :auditor, :index?
    @q = User.ransack(params[:q])
    @users = @q.result

    @users = @users.paginate(:page => params[:page], :per_page => 7)
  end
  
  def show 
    authorize :auditor, :show?
    @user = User.find(params[:id])
    @audited = Audited::Audit.where(user_id: @user.id)
    @impressions = Impression.where(user_id: @user.id)
  end
  
end
