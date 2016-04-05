json.array!(@conversas) do |conversa|
  json.extract! conversa, :id, :orcamentoempresa_id, :user_id
  json.url conversa_url(conversa, format: :json)
end
