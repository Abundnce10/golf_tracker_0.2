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



  def create

    # Calculate scramble
    @scramble = nil
    if params[:played_hole][:GIR].to_i == 0
      @scramble = 0
      if params[:played_hole][:strokes].to_i <= params[:played_hole][:hole_par].to_i
        @scramble = 1
      end
    end

    @played_hole = PlayedHole.new(round_id: params[:played_hole][:round_id],
                                  hole_id: params[:played_hole][:hole_id],
                                  fairway_id: params[:played_hole][:fairway_id],
                                  :GIR => params[:played_hole][:GIR],
                                  putts: params[:played_hole][:putts],
                                  strokes: params[:played_hole][:strokes],
                                  scramble: @scramble,
                                  bunker: params[:played_hole][:bunker],
                                  :OB => params[:played_hole][:OB],
                                  score_change: params[:played_hole][:strokes].to_i - params[:played_hole][:hole_par].to_i)

    if @played_hole.save

      # Update RoundSummary
      @round_summary = RoundSummary.find_by_round_id(params[:played_hole][:round_id])
      
      # Front 9?
      if params[:played_hole][:hole_number].to_i < 10
        @round_summary.total_strokes += params[:played_hole][:strokes].to_i
        @round_summary.front_9_strokes += params[:played_hole][:strokes].to_i
        @round_summary.total_putts += params[:played_hole][:putts].to_i
        @round_summary.front_9_putts += params[:played_hole][:putts].to_i
        @round_summary.GIRs_possible += 1
        @round_summary.GIRs_hit += params[:played_hole][:GIR].to_i
        @round_summary.sand_shots += params[:played_hole][:bunker].to_i
        @round_summary.OBs += params[:played_hole][:OB].to_i
        if params[:played_hole][:hole_par].to_i > 3
          @round_summary.fairways_hit += 1
          if params[:played_hole][:fairway_id].to_i == 1
            @round_summary.fairways_hit += 1
          end
        end
        if !@scramble.nil?
          @round_summary.scrambles_possible += 1
          if @scramble == 1
            @round_summary.scrambles_successful += 1
          end
        end
        @round_summary.save

      # Back 9
      else
        @round_summary.total_strokes += params[:played_hole][:strokes].to_i
        @round_summary.back_9_strokes += params[:played_hole][:strokes].to_i
        @round_summary.total_putts += params[:played_hole][:putts].to_i
        @round_summary.back_9_putts += params[:played_hole][:putts].to_i
        @round_summary.GIRs_possible += 1
        @round_summary.GIRs_hit += params[:played_hole][:GIR].to_i
        @round_summary.sand_shots += params[:played_hole][:bunker].to_i
        @round_summary.OBs += params[:played_hole][:OB].to_i
        if params[:played_hole][:hole_par].to_i > 3
          @round_summary.fairways_hit += 1
          if params[:played_hole][:fairway_id].to_i == 1
            @round_summary.fairways_hit += 1
          end
        end
        if !@scramble.nil?
          @round_summary.scrambles_possible += 1
          if @scramble == 1
            @round_summary.scrambles_successful += 1
          end
        end
        @round_summary.save
      end

      # Last Hole to Input?
      if params[:played_hole][:hole_number].to_i == 9 or params[:played_hole][:hole_number].to_i == 18

        @round = Round.find(params[:played_hole][:round_id])
        @course_holes = Hole.where({course_id: @round.course_id, tee_id: @round.tee_id})
        @played_holes = @round.played_holes
        
        # If so, send to Round#show
        if @played_holes.length == @course_holes.length
          flash[:success] = "Successfully stored hole!"
          redirect_to round_path(params[:played_hole][:round_id])
        # Else Sned to Hole #1
        else
          flash[:success] = "Successfully stored hole!"
          redirect_to new_played_hole_path(round_id: params[:played_hole][:round_id], 
                                           hole_number: 1, 
                                           tee_id: params[:played_hole][:tee_id], 
                                           course_id: params[:played_hole][:course_id])
        end
      # More Holes to Input
      else
        flash[:success] = "Successfully stored hole!"
        redirect_to new_played_hole_path(round_id: params[:played_hole][:round_id], 
                                         hole_number: params[:played_hole][:hole_number].to_i + 1, 
                                         tee_id: params[:played_hole][:tee_id], 
                                         course_id: params[:played_hole][:course_id])
      end

    else

      flash[:error] = "You've already created ths hole."
      #flash[:error] = @played_hole.errors.full_messages
            redirect_to new_played_hole_path(round_id: params[:played_hole][:round_id], 
                                       hole_number: params[:played_hole][:hole_number], 
                                       tee_id: params[:played_hole][:tee_id], 
                                       course_id: params[:played_hole][:course_id])
    end
  end




  def edit
    @played_hole = PlayedHole.find(params[:id])
    @hole = Hole.find(@played_hole.hole_id)
  end



  def update
    @played_hole = PlayedHole.find(params[:played_hole][:played_hole_id])

    if @played_hole.update_attributes({fairway_id: params[:played_hole][:fairway_id],
                                       :GIR => params[:played_hole][:GIR],
                                       putts: params[:played_hole][:putts],
                                       strokes: params[:played_hole][:strokes],
                                       bunker: params[:played_hole][:bunker],
                                       :OB => params[:played_hole][:OB],
                                       score_change: params[:played_hole][:strokes].to_i - params[:played_hole][:hole_par].to_i})

      flash[:success] = "Successfully updated hole!"
      redirect_to round_path(params[:played_hole][:round_id])
    else
      flash[:error] = @played_hole.errors.full_messages
      redirect_to edit_played_hole_path(params[:played_hole][:round_id])
    end
  end


  def destroy
    @played_hole = PlayedHole.find(params[:id])
    @played_hole.destroy
  end
end
