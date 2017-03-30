class V1::FormsController < ApplicationController
  before_action :set_v1_form, only: [:show, :update, :destroy, :getdata, :search]

  # GET /v1/forms
  def index
    @v1_forms = V1::Form.all

    render json: @v1_forms
  end

  # GET /v1/forms/1
  def show
    render json: @v1_form
  end

  # POST /v1/forms
  def create
    @v1_form = V1::Form.new(v1_form_params)

    if @v1_form.save
      render json: @v1_form, status: :created, location: @v1_form
    else
      render json: @v1_form.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/forms/1
  def update
    if @v1_form.update(v1_form_params)
      render json: @v1_form
    else
      render json: @v1_form.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/forms/1
  def destroy
    @v1_form.destroy
  end

  # GET /v1/forms/1/getdata
  def getdata
  	@qs=@v1_form.questions
	@ans=[]
	for qu in @qs
		@ans.append(qu.answer)
	end
    render json: ["questions":@qs,"answers":@ans]
  end
  
  #GET /v1/forms/search/:term
  #def search
	#@wildcard="%#{params[:term]}%"
	#@res=V1::Form.where("title ILIKE :s OR details ILIKE :s",s: @wildcard)
	#render json: @res
  #end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_form
      @v1_form = V1::Form.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_form_params
      params.require(:v1_form).permit(:title, :details, :banksize, :questions_count, :visits_count, :reports_count, :v1_category_id, :term)
    end
end
