class Province < Place
  has_many :cities, foreign_key: 'region_id'
end
