class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:show, :edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy 

  def show
    @user = User.find(params[:id])
    @rounds = @user.rounds.order("date_played DESC")

    @played_rounds = []
    @round_summaries = []
    @played_holes = []

    @rounds.each do |r|
      @played_rounds.push([r, r.course, r.round_summary])
      @round_summaries.push(r.round_summary)
      @phs = r.played_holes
      @phs.each do |ph|
        @played_holes.push([ph, ph.hole])
      end
    end
  end



  def new
    @user = User.new
  end



  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the CaddieHack app"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "user destroyed"
    redirect_to users_url
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(user_path(current_user)) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

end