# Diet Support Program
# Copyright (C) 2023 David A. Taylor of Taylored Web Sites (tayloredwebsites.com)
# Licensed under AGPL-3.0-only.  See https://opensource.org/license/agpl-v3/

FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Food #{n}"}
    sequence(:desc) { |n| "Food Description #{n}"}
    sequence(:usda_fdc_id) { |n| n}
  end
end
