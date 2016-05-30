json.array!(@socis) do |soci|
  json.extract! soci, :id, :nome, :cognome, :contatto, :cf, :numero_tessera, :da_rinnovare
  json.url soci_url(soci, format: :json)
end
