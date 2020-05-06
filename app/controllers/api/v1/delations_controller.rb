# frozen_string_literal: true

class Api::V1::DelationsController < ApplicationController
  before_action :set_delation, only: %i[show update]

  def index
    @delations = Delation.all 
    render json: @delations
  end

  def show 
    render json: @delation
  end

  def create
    @delation = Delation.new(delation_params)
    @delation.user = current_user

    if @delation.save
      render json: @delation, status: :created
    else
      render json: @delation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @delation.update(delation_params)
      render json: @delation
    else
      render json: @delation.errors
    end
  end

  private

  def delation_params
    params.require(:delation).permit(:description, :status, :latitude, :longitude)
  end

  def set_delation
    @delation = Delation.find(params[:id])
  end
end
