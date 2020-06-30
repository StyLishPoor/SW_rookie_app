class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    rener :new if @entry.invalid?
  end

  def destroy
    
  end

  def index
    @entries = Entry.all
  end

  def confirm
  end
end
