json.array!(@enderecos) do |endereco|
  json.extract! endereco, :id, :endereco_id, :numero, :cep, :complemento, :bairro_id, :cidade_id, :latitude, :longitude
  json.url endereco_url(endereco, format: :json)
end
