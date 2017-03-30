class V1::TypesController < ApplicationController
  before_action :set_v1_type, only: [:show, :update, :destroy]

  # GET /v1/types
  def index
    @v1_types = V1::Type.all

    render json: @v1_types
  end

  # GET /v1/types/1
  def show
    render json: @v1_type
  end

  # POST /v1/types
  def create
    @v1_type = V1::Type.new(v1_type_params)

    if @v1_type.save
      render json: @v1_type, status: :created, location: @v1_type
    else
      render json: @v1_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/types/1
  def update
    if @v1_type.update(v1_type_params)
      render json: @v1_type
    else
      render json: @v1_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/types/1
  def destroy
    @v1_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_type
      @v1_type = V1::Type.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_type_params
      params.require(:v1_type).permit(:alias)
    end
end
