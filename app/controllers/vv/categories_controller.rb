module VV
  class CategoriesController < ApplicationController
    def index
      render json: 'vv', layout: false
    end
  end
end
