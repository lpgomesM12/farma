json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :nome, :razaosocial, :cnpj, :informacao, :endereco
  json.url empresa_url(empresa, format: :json)
end
