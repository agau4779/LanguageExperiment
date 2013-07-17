class UserEntryController < ApplicationController
  # GET /user_entries
  # GET /user_entries.json
  def index
    @user_entries = UserEntry.all
  end

  # GET /user_entries/1
  # GET /user_entries/1.json
  def show
    @user_entry = UserEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_entry }
    end
  end
end
