class RoundNotesController < ApplicationController
	def create

		@round_note = r.round_notes.build(round_id: params[:round_note][:round_id], 
								  note: params[:round_note][:note],
								  user_id: current_user)

		if @round_note.save
			flash[:success] = "Successfully started New Round Note!"
			redirect_to root_path
		else
			flash[:error] = @round_note.errors.full_messages
			render round_path(params[:round_note][:round_id])
		end
	end
end