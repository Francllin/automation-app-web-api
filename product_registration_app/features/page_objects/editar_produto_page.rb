module Produto
  class Editar
    attr_accessor :btn_editar

    def initialize
      @btn_editar = 'br.com.pztec.estoque:id/editar'
    end

    def editar(**options)
      cadastro_produto = Cadastro::NovoProduto.new
      codigo = options[:codigo]
      quantidade = options[:quantidade]
      lote = options[:lote]
      wait_for_element(cadastro_produto.inpt_codigo, 'id')
      find(cadastro_produto.inpt_codigo).clear
      find(cadastro_produto.inpt_codigo).send_keys(codigo)
      close_keyboard
      find(cadastro_produto.inpt_quantidade).clear
      find(cadastro_produto.inpt_quantidade).send_keys(quantidade)
      find(cadastro_produto.inpt_lote).clear
      find(cadastro_produto.inpt_lote).send_keys(lote)
      wait_for_element(cadastro_produto.btn_salvar, 'id')
      find(cadastro_produto.btn_salvar).click
    end
  end
end
