class PagesController < ApplicationController
  def home
    @books = Book.where(user: current_user)
  end
end
