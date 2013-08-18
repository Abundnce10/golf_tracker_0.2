class RoundsController < ApplicationController

  def index
    @rounds = Round.all

    @courses = Course.joins(:rounds).where(rounds: { user_id: current_user})


  end


  def show
    @round = Round.find(params[:id])
    @course = Course.joins(:rounds).where(rounds: { course_id: @round.course_id }).first
  
    @played_holes = PlayedHole.where(round_id: @round.id)

    @table_stats = []
    @played_holes.each do |ph|
      @table_stats.push([ph.hole.number, ph.hole.distance, ph.hole.par, ph.strokes, ph.putts, ph.score_change])
    end
  end


  def new
    @round = Round.new
    @course = Course.find(params[:course_id])
    @user_handicap = UserHandicap.where("user_id = ?", current_user)
    if @user_handicap.empty?
      @user_handicap_id = 1
    else
      @user_handicap_id = @user_handicap.last.id
    end

    # SELECT DISTINCT(tee_id) FROM Tees as t INNER JOIN Holes as h WHERE h.course_id = 14934;
    @tees = []
    Tee.joins(:holes).where(holes: { course_id: params[:course_id] }).uniq.each do |t|
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
    @hole_number = params[:round][:starting_hole]



    if @round.save

      flash[:success] = "Successfully started New Round!"
      redirect_to new_played_hole_path(round_id: @round.id, hole_number: @hole_number, tee_id: @tee_id, course_id: @course_id)
      #redirect_to round_path()  

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
