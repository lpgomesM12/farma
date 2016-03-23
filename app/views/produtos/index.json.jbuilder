json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :principioativo, :laboratorio, :concentracao, :formafarmaceutica, :tipoproduto_id
  json.url produto_url(produto, format: :json)
end
