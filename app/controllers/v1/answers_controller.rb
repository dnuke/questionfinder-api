class V1::AnswersController < ApplicationController
  before_action :set_v1_answer, only: [:show, :update, :destroy]

  # GET /v1/answers
  def index
    @v1_answers = V1::Answer.all

    render json: @v1_answers
  end

  # GET /v1/answers/1
  def show
    render json: @v1_answer
  end

  # POST /v1/answers
  def create
    @v1_answer = V1::Answer.new(v1_answer_params)

    if @v1_answer.save
      render json: @v1_answer, status: :created, location: @v1_answer
    else
      render json: @v1_answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/answers/1
  def update
    if @v1_answer.update(v1_answer_params)
      render json: @v1_answer
    else
      render json: @v1_answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/answers/1
  def destroy
    @v1_answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_answer
      @v1_answer = V1::Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_answer_params
      params.require(:v1_answer).permit(:ansdata, :ref, :v1_question_id)
    end
end
