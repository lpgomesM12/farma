json.array!(@tipoprodutos) do |tipoproduto|
  json.extract! tipoproduto, :id, :nome
  json.url tipoproduto_url(tipoproduto, format: :json)
end
