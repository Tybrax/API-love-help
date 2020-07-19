module Api
  module V1
    class RequestsController < ApplicationController

      # GET /requests
      def index
        @requests = Request.all

        render json: @requests
      end

      # GET /requests/1
      def show
        @request = Request.find(params[:id])
        render json: @request
      end

      # POST /requests
      def create
        @request = Request.new(request_params)

        if @request.save
          render json: @request, status: :created
        else
          render json: @request.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /requests/1
      def update
        @request = Request.find(params[:id])
        if @request.update(request_params)
          render json: @request
        else
          render json: @request.errors, status: :unprocessable_entity
        end
      end

      # DELETE /requests/1
      def destroy
        @request = Request.find(params[:id])
        @request.destroy
        render json: {status: 'SUCCESSFULLY DELETE', message: "DELETED ARTICLE"}
      end

      private
        # Only allow a trusted parameter "white list" through.
        def request_params
          params.permit(:title, :request_type, :description, :location, :fulfilled, :request)
        end
    end
  end
end
