class Api::V1::WebsitesController < ApplicationController
  def index
    websites = Website.all
    render json: websites.as_json(methods: [:image_url])
  end

  def show
    website = Website.find(params[:id])
    render json: website.as_json(methods: [:image_url])
  end

  def create
    website = Website.new(website_params.except(:image))
    website.image.attach(website_params[:image]) if website_params[:image].present?
    website.save!
    render json: website.as_json(methods: [:image_url])
  end

  def update
    website = Website.find(params[:id])
    website.update!(website_params.except(:image))
    website.image.attach(website_params[:image]) if website_params[:image].present?
    render json: website.as_json(methods: [:image_url])
  end

  def destroy
  end

  def website_params
    params.require(:website).permit(:user_id, :url, :description, :image)
  end
end
