json.extract! food, :id, :name, :desc, :usda_fdc_id, :created_at, :updated_at
json.url food_url(food, format: :json)
