json.extract! nutrient, :id, :name, :usda_ndb_num, :desc, :created_at, :updated_at
json.url nutrient_path(nutrient, format: :json)
