json.array!(@orcamentorealizados) do |orcamentorealizado|
  json.extract! orcamentorealizado, :id, :valor_orcamento, :valor_desconto, :porcentagemdesconto, :valor_total, :situacaoorcamento_id, :orcamentoempresa_id, :mensagem
  json.url orcamentorealizado_url(orcamentorealizado, format: :json)
end
