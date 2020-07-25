Dado("esta na home do cadastro de produtos") do
  wait_for_element(home.btn_novo, 'id')
  cadastro_produto.criar_novo_produto if @gerar_cadastro_novo_produto
end

Quando("incluir um novo produto") do |table|
  find(home.btn_novo).click
  codigo = table.hashes[0]['codigo']
  unidade = table.hashes[0]['unidade']
  @options = {codigo: codigo,
             descricao: gerar_complemento,
             unidade: unidade,
             quantidade: gerar_numero(2),
             lote: gerar_numero(8),
             val_unit: gerar_numero(2)}
  cadastro_produto.cadastrar_produto(@options)
end


Então("validar que o produto foi cadastrado com sucesso") do
  wait_for_element(deletar_produto.btn_deletar, 'id')
  page_text = page_lista_text
  aggregate_failures do
    expect(find(deletar_produto.btn_deletar).displayed?).to be_truthy
    expect(page_text).to include(@options[:codigo])
    expect(page_text).to include(@options[:descricao])
    expect(page_text).to include(@options[:unidade])
    expect(page_text).to include(@options[:quantidade].to_s)
    expect(page_text).to include(@options[:lote].to_s)
    expect(page_text).to include(@options[:val_unit].to_s)
  end
end
