Quando("editar um produto") do
  wait_for_element(editar_produto.btn_editar, 'id')
  find(editar_produto.btn_editar).click
  @options = {codigo: gerar_numero(5),
              quantidade: gerar_numero(2),
              lote: gerar_numero(8)}
  editar_produto.editar(@options)
end

Então("validar que o produto foi editado com sucesso") do
  wait_for_element(editar_produto.btn_editar,'id')
  page_text = page_lista_text
  aggregate_failures do
    expect(find(editar_produto.btn_editar).displayed?).to be_truthy
    expect(page_text).to include(@options[:codigo].to_s)
    expect(page_text).to include(@options[:quantidade].to_s)
    expect(page_text).to include(@options[:lote].to_s)
  end
end
