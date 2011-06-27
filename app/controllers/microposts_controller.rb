class MicropostsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => [:destroy]

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = 'Micropost created!'
      redirect_to(root_path)
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_back_or root_path
  end

  def show
    @micropost = Micropost.find(params[:id], :include => :images)
    @user = User.find(@micropost.user_id)
  end
  
  def vote_up
    begin
      current_user.vote_for(@micropost = Micropost.find(params[:id]))
      render :nothing => true, :status => 200
    rescue ActiveRecord::RecordInvalid
      render :nothing => true, :status => 404
    end
  end

  private
  def authorized_user
    @micropost = Micropost.find(params[:id])
    redirect_to(root_path) unless current_user?(@micropost.user)
  end
end
