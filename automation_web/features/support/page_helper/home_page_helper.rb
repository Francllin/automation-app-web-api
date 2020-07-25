Dir[File.join(File.dirname(__FILE__), '../*_page.rb')].map { |file| require file }

module PageObjects
  def home_page
    @home_page ||= Pages::HomePage.new
  end
end