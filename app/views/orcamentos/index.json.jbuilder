json.array!(@orcamentos) do |orcamento|
  json.extract! orcamento, :id, :nome, :descricao, :user_id
  json.url orcamento_url(orcamento, format: :json)
end
