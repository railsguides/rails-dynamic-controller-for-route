module V1
  class CategoriesController < ::VV::CategoriesController
    def index
      render json: 'v1', layout: false
    end
  end
end
