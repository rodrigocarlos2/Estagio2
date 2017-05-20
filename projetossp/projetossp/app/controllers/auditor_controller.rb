class AuditorController < ApplicationController
  def index
    authorize :auditor, :index?
    @users = User.all
  end
  
  def show 
    authorize :auditor, :show?
    @user = User.find(params[:id])
    @audited = Audited::Audit.where(user_id: @user.id)
    @impressions = Impression.where(user_id: @user.id)
  end
  
end
