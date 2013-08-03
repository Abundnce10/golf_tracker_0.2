class PlayedHolesController < ApplicationController

  def index
    @played_holes = PlayedHole.all
  end


  def show
    @played_hole = PlayedHole.find(params[:id])
  end


  def new
    @played_hole = PlayedHole.new

    @course = Course.find(params[:course_id])

    # Find Hole, Handicap, and Par
    @hole = Hole.where(course_id: params[:course_id], tee_id: params[:tee_id], number: params[:starting_hole]).first
    @handicap = Handicap.where(course_id: params[:course_id], gender_id: current_user.gender_id, hole_number: params[:starting_hole]).first
    @par = Par.where(course_id: params[:course_id], gender_id: current_user.gender_id, hole_number: params[:starting_hole]).first



  end

  # GET /played_holes/1/edit
  def edit
    @played_hole = PlayedHole.find(params[:id])
  end

  # POST /played_holes
  # POST /played_holes.json
  def create
    @played_hole = PlayedHole.new(params[:played_hole])

    respond_to do |format|
      if @played_hole.save
        format.html { redirect_to @played_hole, notice: 'Played hole was successfully created.' }
        format.json { render json: @played_hole, status: :created, location: @played_hole }
      else
        format.html { render action: "new" }
        format.json { render json: @played_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /played_holes/1
  # PUT /played_holes/1.json
  def update
    @played_hole = PlayedHole.find(params[:id])

    respond_to do |format|
      if @played_hole.update_attributes(params[:played_hole])
        format.html { redirect_to @played_hole, notice: 'Played hole was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @played_hole.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /played_holes/1
  # DELETE /played_holes/1.json
  def destroy
    @played_hole = PlayedHole.find(params[:id])
    @played_hole.destroy

    respond_to do |format|
      format.html { redirect_to played_holes_url }
      format.json { head :no_content }
    end
  end
end
