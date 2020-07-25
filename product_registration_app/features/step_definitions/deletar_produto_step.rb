Quando("excluir um produto") do
  wait_for_element(deletar_produto.btn_deletar, 'id')
  find(deletar_produto.btn_deletar).click
  wait_for_element(deletar_produto.btn_sim, 'id')
  find(deletar_produto.btn_sim).click
end

Então("validar que o produto foi excluido com sucesso") do
  wait_for_element(home.btn_novo, 'id')
  expect(element?(deletar_produto.btn_deletar)).to be_falsey
end
