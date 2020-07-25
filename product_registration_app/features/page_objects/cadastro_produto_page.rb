module Cadastro
  class Home
    attr_accessor :btn_novo

    def initialize
      @btn_novo = 'br.com.pztec.estoque:id/Button1'
    end
  end

  class NovoProduto
    attr_accessor :inpt_codigo,
                  :inpt_descricao,
                  :inpt_unidade,
                  :inpt_quantidade,
                  :inpt_val_unit,
                  :inpt_lote,
                  :slc_validade,
                  :btn_salvar

    def initialize
      @inpt_codigo = 'br.com.pztec.estoque:id/txt_codigo'
      @inpt_descricao = 'br.com.pztec.estoque:id/txt_descricao'
      @inpt_unidade = 'br.com.pztec.estoque:id/txt_unidade'
      @inpt_quantidade = 'br.com.pztec.estoque:id/txt_quantidade'
      @inpt_val_unit = 'br.com.pztec.estoque:id/txt_valunit'
      @inpt_lote = 'br.com.pztec.estoque:id/txt_lote'
      @slc_validade = 'br.com.pztec.estoque:id/data'
      @btn_salvar = 'br.com.pztec.estoque:id/btn_gravar_assunto'
    end

    def cadastrar_produto(**options)
      codigo = options[:codigo]
      descricao = options[:descricao]
      unidade = options[:unidade]
      quantidade = options[:quantidade]
      val_unit = options[:val_unit]
      lote = options[:lote]
      find(@inpt_codigo).send_keys(codigo)
      find(@inpt_descricao).send_keys(descricao)
      find(@inpt_unidade).send_keys(unidade)
      close_keyboard
      find(@inpt_quantidade).send_keys(quantidade)
      find(@inpt_val_unit).send_keys(val_unit)
      find(@inpt_lote).send_keys(lote)
      wait_for_element(@btn_salvar, 'id')
      find(@btn_salvar).click
    end

    def criar_novo_produto
      find(Home.new.btn_novo).click
      @options = {codigo: gerar_numero(1),
                  descricao: gerar_complemento,
                  unidade: 'quilo',
                  quantidade: gerar_numero(2),
                  lote: gerar_numero(8),
                  val_unit: gerar_numero(2)}
      self.cadastrar_produto(@options)
    end
  end
end
