json.array!(@mensagemconversas) do |mensagemconversa|
  json.extract! mensagemconversa, :id, :mensgem, :flag_lida, :conversa_id, :user_id
  json.url mensagemconversa_url(mensagemconversa, format: :json)
end
