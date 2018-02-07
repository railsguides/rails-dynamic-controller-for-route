module VV
  class UsersController < ApplicationController
    def index
      render json: 'users vv', layout: false
    end
  end
end
