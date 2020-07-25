def gerar_numero(numero)
  Faker::Number.number(digits: numero)
end

def gerar_complemento
  Faker::Lorem.sentence
end