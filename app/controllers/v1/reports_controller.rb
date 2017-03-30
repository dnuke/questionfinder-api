class V1::ReportsController < ApplicationController
  before_action :set_v1_report, only: [:show, :update, :destroy]

  # GET /v1/reports
  def index
    @v1_reports = V1::Report.all

    render json: @v1_reports
  end

  # GET /v1/reports/1
  def show
    render json: @v1_report
  end

  # POST /v1/reports
  def create
    @v1_report = V1::Report.new(v1_report_params)

    if @v1_report.save
      render json: @v1_report, status: :created, location: @v1_report
    else
      render json: @v1_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/reports/1
  def update
    if @v1_report.update(v1_report_params)
      render json: @v1_report
    else
      render json: @v1_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/reports/1
  def destroy
    @v1_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_report
      @v1_report = V1::Report.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_report_params
      params.require(:v1_report).permit(:email, :debrief, :v1_form_id)
    end
end
