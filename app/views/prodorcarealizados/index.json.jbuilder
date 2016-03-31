json.array!(@prodorcarealizados) do |prodorcarealizado|
  json.extract! prodorcarealizado, :id, :valor_produto, :valor_desconto, :valor_total, :porcentagemdesconto, :flag_produtoemfalta, :orcamentorealizado_id, :produto_id
  json.url prodorcarealizado_url(prodorcarealizado, format: :json)
end
