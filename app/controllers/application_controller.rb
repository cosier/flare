class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def landing
    @records = Record.all
    @addresses = Address.order(created_at: :desc).limit(10)
    @current = Address.current
    @events = Event.order(created_at: :desc).limit(20)
    @keys = Key.all
  end
end
