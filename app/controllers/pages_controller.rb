class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @cats = Cat.all
    @markers = @cats.geocoded.map do |cat|
      {
        lat: cat.latitude,
        lng: cat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {cat: cat}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
