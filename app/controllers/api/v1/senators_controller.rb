module Api
  module V1
    class SenatorsController < ApplicationController
      def index
        congress = Congress.current.first
        render json: congress.senators, status: :ok
      end

      def show
        congress = Congress.current.first
        render json: congress.senators.find(params[:id]), status: :ok
      end
    end
  end
end
