class Api::V1::PhonesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :allot_by_number]

  def index
    phone_numbers = Phone.all.pluck(:number)
    render json: {phones: phone_numbers}.as_json, status: :ok
  end

  def create
    phone = Phone.new
    if phone.allot_and_save
      render json: {phone: phone.number}.as_json, status: :ok
    else
      render json: {error: phone.errors.full_messages.to_sentence}.as_json, status: :unprocessable_entity
    end
  end

  def allot_by_number
    phone = Phone.new(number: params[:phone_number])
    if phone.allot_and_save
      render json: {phone: phone.number}.as_json, status: :ok
    else
      render json: {error: phone.errors.full_messages.to_sentence}.as_json, status: :unprocessable_entity
    end
  end

end
