json.array!(@results) do |result|
json.id result.id
json.value result.nome + result.apresentacao
end