class RoundsController < ApplicationController
  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rounds }
    end
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    @round = Round.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @round }
    end
  end

  # GET /rounds/new
  # GET /rounds/new.json
  def new
    @round = Round.new
    @course = Course.find(params[:course_id])
    @user_handicap = UserHandicap.where("user_id = ?", current_user)
    if @user_handicap.empty?
      @user_handicap_id = 1
    else
      @user_handicap_id = @user_handicap.last.id
    end

    @tees = []
    Tee.all().each do |t|
      @tees.push([t.tee_type, t.id])
    end

    @times_of_day = []
    TimeOfDay.all().each do |t|
      @times_of_day.push([t.time_of_day, t.id])
    end

    @date_played = Time.new

  end


  def create
    @round = current_user.rounds.build(params[:round])
    
    @course_id = params[:round][:course_id]
    @tee_id = params[:round][:tee_id]
    @time_of_day_id = params[:round][:time_of_day_id]
    @user_handicap_id = params[:round][:user_handicap_id]
    @date_played = params[:round][:date_played]
    @starting_hole = params[:round][:starting_hole]


    if @round.save

      flash[:success] = "Successfully started New Round!"
      redirect_to @round

    else

      #flash[:alert] = "Oops, there was an error."
      flash[:error] = @round.errors.full_messages
      
      @round = Round.new
      @course = Course.find(@course_id)

      @user_handicap = UserHandicap.where("user_id = ?", current_user)
      if @user_handicap.empty?
        @user_handicap_id = 1
      else
        @user_handicap_id = @user_handicap.last.id
      end

      @tees = []
      Tee.all().each do |t|
        @tees.push([t.tee_type, t.id])
      end

      @times_of_day = []
      TimeOfDay.all().each do |t|
        @times_of_day.push([t.time_of_day, t.id])
      end

      render action: 'new'

    end

  end







  # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
  end


  # PUT /rounds/1
  # PUT /rounds/1.json
  def update
    @round = Round.find(params[:id])

    respond_to do |format|
      if @round.update_attributes(params[:round])
        format.html { redirect_to @round, notice: 'Round was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round = Round.find(params[:id])
    @round.destroy

    respond_to do |format|
      format.html { redirect_to rounds_url }
      format.json { head :no_content }
    end
  end
end
