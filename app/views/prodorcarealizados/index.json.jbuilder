json.array!(@prodorcarealizados) do |prodorcarealizado|
  json.extract! prodorcarealizado, :id, :valor, :valor_desconto, :valor_total, :porcentagemdesconto, :flag_produtoemfalta
  json.url prodorcarealizado_url(prodorcarealizado, format: :json)
end
