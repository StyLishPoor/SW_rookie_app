class EntriesController < ApplicationController
  before_action :check_id, only: [:destroy]
  def new
    @entry = Entry.new
  end

  def create
    @entry = Room.new(params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully accepted.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index
    @entries = Entry.all
  end

  def confirm
  end

  private
    def check_id
      @entry = Entry.find([params[:id]])
    end
end
