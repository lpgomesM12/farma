class Empresa < ActiveRecord::Base
  belongs_to :endereco, dependent: :destroy
  has_many :telefones, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true
  accepts_nested_attributes_for :telefones, allow_destroy: true
  
  validates :nome, presence: true

  TIPOTELEFONE = %w[FIXO CELULAR]


  def self.cria_funcao
    query = " CREATE OR REPLACE FUNCTION distancia_km(lat1 NUMERIC, lng1 NUMERIC, lat2 NUMERIC, lng2 NUMERIC) "
    query = query +  " RETURNS DOUBLE PRECISION AS "
    query = query +  " $BODY$ "
    query = query +  " SELECT 6371 * acos( "
    query = query +  " sin( radians($1) ) * sin( radians( $3 )) "
    query = query +  " + cos( radians($1) ) * cos( radians( $3 )) * cos(radians($4) - radians($2))  ) "
    query = query +  " as distance; "
    query = query +  " $BODY$ "
    query = query +  " LANGUAGE sql IMMUTABLE COST 100; "
    results = ActiveRecord::Base.connection.execute(query);
  end


  def self.busca_lat_long(lat,long)
    self.cria_funcao
    sql = " INNER JOIN enderecos en on endereco_id = en.id "
    sql = sql + " WHERE "
    sql = sql + " distancia_km(#{lat}, #{long}, CAST(en.latitude as NUMERIC), CAST(en.longitude AS NUMERIC)) <= 10 "
    sql = sql + " AND distancia_km(#{lat}, #{long}, CAST(en.latitude as NUMERIC), CAST(en.longitude AS NUMERIC)) >= 0"
    self.joins(sql)
  end


end
