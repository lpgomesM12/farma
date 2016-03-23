json.array!(@situacaoorcamentos) do |situacaoorcamento|
  json.extract! situacaoorcamento, :id, :nome
  json.url situacaoorcamento_url(situacaoorcamento, format: :json)
end
