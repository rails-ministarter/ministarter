# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    @users_count = User.count
  end
end
