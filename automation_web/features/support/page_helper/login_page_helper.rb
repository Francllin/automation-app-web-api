Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def login
    @login ||= Pages::Login.new
  end
end