module VV
  class ProductsController < ApplicationController
    def index
      render json: 'products vv', layout: false
    end
  end
end
