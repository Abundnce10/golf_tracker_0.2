class RoundsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:show, :edit, :update]

  def index
    @rounds = Round.all

    @courses = Course.joins(:rounds).where(rounds: { user_id: current_user})


  end


  def show
    @round = Round.find(params[:id])
    @course = Course.joins(:rounds).where(rounds: { course_id: @round.course_id }).first
    @round_summary = RoundSummary.find_by_round_id(@round.id)

    @played_holes = PlayedHole.where(round_id: @round.id).order("hole_id ASC")

    @table_stats = []
    @played_holes.each do |ph|
      @table_stats.push([ph.hole.number, ph.hole.distance, ph.hole.par, ph.strokes, ph.putts, ph.score_change, ph.id, ph.fairway_id, ph.GIR])
    end
  end



  def edit
    @round = Round.find(params[:id])
    @course = Course.joins(:rounds).where(rounds: { course_id: @round.course_id }).first
    
    @holes = Hole.where({course_id: @round.course_id, tee_id: @round.tee_id}).order("number ASC")
    @played_holes = PlayedHole.where(round_id: @round.id)    
    
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

  end


  def create

    @dp = Date.parse(params[:round][:date_played]) # mm/dd/yyyy
    @time_of_day_id = params[:round][:time_of_day_id]
    
    # Creat DateTime object
    ## TimeOfDay - 1:morning, 2:afternoon, 3:evening
    if @time_of_day_id == 1
      @date_played = DateTime.new(@dp.year, @dp.month, @dp.day, 8, 0, 0)
    elsif @time_of_day_id == 2
      @date_played = DateTime.new(@dp.year, @dp.month, @dp.day, 12, 0, 0)
    else
      @date_played = DateTime.new(@dp.year, @dp.month, @dp.day, 16, 0, 0)
    end

    # Save Round object
    @round = current_user.rounds.build(
                course_id: params[:round][:course_id],
                user_handicap_id: params[:round][:user_handicap_id],
                tee_id: params[:round][:tee_id],
                time_of_day_id: @time_of_day_id,
                starting_hole: params[:round][:starting_hole],
                date_played: @date_played)

    # URL params
    @course_id = params[:round][:course_id]
    @tee_id = params[:round][:tee_id]
    @user_handicap_id = params[:round][:user_handicap_id]
    @hole_number = params[:round][:starting_hole]

    # Save Round
    if @round.save
      @round_summary = RoundSummary.new({
          round_id: @round.id,
          total_strokes: 0,
          score_to_par: 0,
          front_9_strokes: 0,
          back_9_strokes: 0,
          fairways_hit: 0,
          fairways_possible: 0,
          :GIRs_hit => 0,
          :GIRs_possible => 0,
          total_putts: 0,
          front_9_putts: 0,
          back_9_putts: 0,
          scrambles_possible: 0,
          scrambles_successful: 0,
          sand_shots: 0,
          :OBs => 0
        })

      # Create accompanying RoundSummary
      if @round_summary.save
        flash[:success] = "Successfully started New Round!"
        redirect_to new_played_hole_path(round_id: @round.id, hole_number: @hole_number, tee_id: @tee_id, course_id: @course_id)
      else
        flash[:error] = "Sorry.  Try again."
        redirect_to action: "new"
      end

    else
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

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = Round.find(params[:id]).user
      redirect_to(root_path) unless current_user?(@user)
    end

end
