class EntriesController < ApplicationController
  before_action :check_id, only: [:destroy]
  def new
    @entry = Entry.new(room_id: params[:room_id])
  end

  def create
    # @entry = Room.new(entry_params)

    # respond_to do |format|
    #   if @entry.save
    #     format.html { redirect_to @entry, notice: 'Entry was successfully accepted.' }
    #     format.json { render :show, status: :created, location: @entry }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @entry.errors, status: :unprocessable_entity }
    #   end
    # end
    @entry = Entry.new(entry_params) 
    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry.room, notice: '予約完了' }
      else
        format.html { render :new }
      end 
    end
  end

  def destroy
    # @entry.destroy
    # respond_to do |format|
    #   format.html { redirect_to rooms_url, notice: 'Entry was successfully destroyed.' }
    #   format.json { head :no_content }
    @entry.destroy 
    respond_to do |format|
      format.html { redirect_to @entry.room, notice: '予約解除完了' } 
    end
  end

  def index
    @entries = Entry.all
  end

  def confirm
  end

  private
    def check_id
      @entry = Entry.find(params[:id])
    end
    
    def entry_params
      params.require(:entry).permit(:user_name, :user_email, :reserved_date, :usage_time, :room_id, :people)
    end
end
