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
    @round_id = params[:round_id]
    @tee_id = params[:tee_id]
    @course_id = params[:course_id]

    # Find Hole, Handicap
    @hole = Hole.where(course_id: params[:course_id], tee_id: params[:tee_id], number: params[:hole_number]).first
    @handicap = Handicap.where(course_id: params[:course_id], gender_id: current_user.gender_id, hole_number: params[:hole_number]).first

  end

  # GET /played_holes/1/edit
  def edit
    @played_hole = PlayedHole.find(params[:id])
  end


  def create
    @played_hole = PlayedHole.new(round_id: params[:played_hole][:round_id],
                                  hole_id: params[:played_hole][:hole_id],
                                  fairway_id: params[:played_hole][:fairway_id],
                                  :GIR => params[:played_hole][:GIR],
                                  putts: params[:played_hole][:putts],
                                  strokes: params[:played_hole][:strokes],
                                  scramble: nil,
                                  bunker: params[:played_hole][:bunker],
                                  :OB => params[:played_hole][:OB],
                                  score_change: params[:played_hole][:strokes].to_i - params[:played_hole][:hole_par].to_i)

    if @played_hole.save
      flash[:success] = "Successfully stored hole!"
      redirect_to new_played_hole_path(round_id: params[:played_hole][:round_id], 
                                       hole_number: params[:played_hole][:hole_number].to_i + 1, 
                                       tee_id: params[:played_hole][:tee_id], 
                                       course_id: params[:played_hole][:course_id])
    else
      flash[:error] = @played_hole.errors.full_messages
            redirect_to new_played_hole_path(round_id: params[:played_hole][:round_id], 
                                       hole_number: params[:played_hole][:hole_number], 
                                       tee_id: params[:played_hole][:tee_id], 
                                       course_id: params[:played_hole][:course_id])
    end

  end


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
