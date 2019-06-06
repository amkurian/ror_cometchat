class UsersController < ApplicationController
  def index
    @users = CometChatService.new.fetch_users
  end

  def show
    users = CometChatService.new.fetch_users
    @current_user = users.find { |user| user[:id] == params[:id] }
    @users = users.reject { |user| user[:id] == @current_user[:id] }
  end
end