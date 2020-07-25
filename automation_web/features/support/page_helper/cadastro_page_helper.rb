Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def cadastro
    @cadastro ||= Pages::Cadastro.new
  end
end