module Api
  module V1
    class ReportsController < ApplicationController
      before_action :set_report, only: [:show, :update, :destroy]
      skip_before_action :authenticate_request, only: %i[index show]

      # GET /api/v1/reports
      def index
        @reports = Report.all

        render json: @reports
      end

      # GET /api/v1/reports/1
      def show
        render json: @report
      end

      # POST /api/v1/reports
      def create
        @report = @current_user.reports.new(report_params)

        if @report.save
          render json: @report, status: :created
        else
          render json: @report.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/reports/1
      def update
        if @report.update(report_params)
          render json: @report
        else
          render json: @report.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/reports/1
      def destroy
        @report.update_attribute(:archived_at, Time.now)
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @report = Report.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def report_params
        params.permit(:title, :details, :last_location, :photo,
                      :missing_since, :contact_no, :is_found, :archived_at)
      end
    end
  end
end