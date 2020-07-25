Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def home
    @home ||= Cadastro::Home.new
  end

  def cadastro_produto
    @cadastro_produto ||= Cadastro::NovoProduto.new
  end

  def deletar_produto
    @deletar_produto ||= Produto::Deletar.new
  end

  def editar_produto
    @editar_produto ||= Produto::Editar.new
  end
end
