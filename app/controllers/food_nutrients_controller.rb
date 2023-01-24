class FoodNutrientsController < ApplicationController
  before_action :set_food_nutrient, only: %i[ show edit update destroy ]

  # GET /food_nutrients or /food_nutrients.json
  def index
    @food_nutrients = FoodNutrient.all
  end

  # GET /food_nutrients/1 or /food_nutrients/1.json
  def show
  end

  # GET /food_nutrients/new
  def new
    @food_nutrient = FoodNutrient.new
  end

  # GET /food_nutrients/1/edit
  def edit
  end

  # POST /food_nutrients or /food_nutrients.json
  def create
    @food_nutrient = FoodNutrient.new(food_nutrient_params)

    respond_to do |format|
      if @food_nutrient.save
        format.html { redirect_to food_nutrient_url(@food_nutrient), notice: "Food nutrient was successfully created." }
        format.json { render :show, status: :created, location: @food_nutrient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_nutrients/1 or /food_nutrients/1.json
  def update
    respond_to do |format|
      if @food_nutrient.update(food_nutrient_params)
        format.html { redirect_to food_nutrient_url(@food_nutrient), notice: "Food nutrient was successfully updated." }
        format.json { render :show, status: :ok, location: @food_nutrient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_nutrient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_nutrients/1 or /food_nutrients/1.json
  def destroy
    @food_nutrient.destroy

    respond_to do |format|
      format.html { redirect_to food_nutrients_url, notice: "Food nutrient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_nutrient
      @food_nutrient = FoodNutrient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def food_nutrient_params
      params.require(:food_nutrient).permit(:id, :nutrient_id, :food_id, :study, :study_weight, :avg_rec_id, :portion, :portion_unit, :amount, :amount_unit, :desc)
    end
end