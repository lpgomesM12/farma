json.array!(@dadosusers) do |dadosuser|
  json.extract! dadosuser, :id, :user_id, :endereco_id
  json.url dadosuser_url(dadosuser, format: :json)
end
