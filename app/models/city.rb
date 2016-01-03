class City < Place
  belongs_to :province, foreign_key: 'region_id'
end
