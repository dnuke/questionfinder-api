class V1::QuestionsController < ApplicationController
  before_action :set_v1_question, only: [:show, :update, :destroy]

  # GET /v1/questions
  def index
    @v1_questions = V1::Question.all

    render json: @v1_questions
  end

  # GET /v1/questions/1
  def show
    render json: @v1_question
  end

  # POST /v1/questions
  def create
    @v1_question = V1::Question.new(v1_question_params)

    if @v1_question.save
      render json: @v1_question, status: :created, location: @v1_question
    else
      render json: @v1_question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/questions/1
  def update
    if @v1_question.update(v1_question_params)
      render json: @v1_question
    else
      render json: @v1_question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/questions/1
  def destroy
    @v1_question.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_question
      @v1_question = V1::Question.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_question_params
      params.require(:v1_question).permit(:questdata, :v1_form_id, :v1_type_id)
    end
end
