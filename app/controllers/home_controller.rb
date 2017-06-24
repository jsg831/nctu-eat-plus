class HomeController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def restaurant_list
    area = params[:area]
    max_results = params[:max_results].to_i
    page = params[:page].to_i
    @restaurants = Restaurant.where(area: area).offset((page-1)*max_results).limit(max_results).order(avg_rating: :desc)
    number_of_pages = (Restaurant.where(area: area).count.to_f / max_results).ceil
    render json: {
      number_of_pages: number_of_pages,
      restaurant_list: @restaurants.as_json(only: [:id, :name, :avg_rating])
    }
  end
end
