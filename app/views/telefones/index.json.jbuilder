json.array!(@telefones) do |telefone|
  json.extract! telefone, :id, :tipo, :numero, :empresa_id
  json.url telefone_url(telefone, format: :json)
end
