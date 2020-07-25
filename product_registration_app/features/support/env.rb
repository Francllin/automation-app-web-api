PLATAFORMA ||= ENV['SO']
PLATFORM ||= ENV['PLATFORM']
TYPE_TEST ||= ENV['TYPE_TEST']

require 'appium_lib'
require 'cucumber'
require 'appium_console'
require 'faker'
require 'open3'
require 'parallel_tests'
require 'pry'
require 'rexml/document'
require 'rspec'
require 'rspec/expectations'
require 'rspec/core'
require 'rubygems'
require 'report_builder'
require 'selenium-webdriver'
require 'touch_action'
require 'json'

Dir["#{File.expand_path('', __dir__)}/page_helper/*page_helper.rb"].map { |file| require_relative file }

DADOS_SAUCE = YAML.load_file(File.expand_path('../../config/ondemand.yml', __dir__))

test_batch_id = ENV['TEST_BATCH_ID']
puts(test_batch_id)
device = PLATFORM

time = Time.new
time = time.strftime('%d_%m_%Y')
Dir.mkdir('./report/exec_logs') unless Dir.exist?('./report/exec_logs')
LOGGER = Logger.new("./report/exec_logs/exec_log_#{time}.log")

def return_udid_simulador(name, version = 'iOS-13-3')
  retries = 0
  stdout = Open3.capture3('xcrun simctl list --json')
  data = JSON.parse(stdout.first)
  version_simulador = data['devices']["com.apple.CoreSimulator.SimRuntime.#{version}"]
  raise "This version #{version} of the simulator does not exist \n #{data['devices']}" if version_simulador.nil?

  waiting_time = version_simulador.size
  version_simulador.each do |simulador|
    return simulador['udid'] if name.eql?(simulador['name'])
    raise "This the simulator does not exist. \n #{name}" if (retries += 1) >= waiting_time
  end
end

file_platafoma = []
file_caps = Dir[File.expand_path("../support/caps/#{PLATAFORMA}/*", __dir__)]
raise "The directory with caps configurations were not presented for the platform #{PLATAFORMA}" if file_caps.eql? []

file_caps.each do |file|
  file.split('/').include?(PLATAFORMA) ? file_platafoma.push("#{file}/caps.txt") : false
end

raise "The directory '../support/caps/../#{device}' not presented" unless file_platafoma.to_s.include?(device)

caps = file_platafoma.each_with_index { |file_devices, index| break Appium.load_appium_txt file: file_devices, verbose: true if file_caps[index].split('/').last.eql?(device) }

test_local = TYPE_TEST || 'Local'

if !device.include?('sauce')
  version = ENV['VERSION_APP'].nil? ? Dir['./app/version/*'].last.split('/').last : ENV['VERSION_APP']
  caps_app = PLATAFORMA == 'android' ? Dir["./app/version/#{version}/*.apk"][0] : Dir["./app/version/#{version}/*.app"][0]
  raise "the directory 'app/version/%number version%' or '.ipa/.app' or '.apk' was not presented" if caps_app.nil?

  caps[:caps][:app] = caps_app
  caps[:caps][:udid] = return_udid_simulador(caps[:caps][:deviceName]) if PLATAFORMA == 'ios'
else
  caps[:appium_lib][:server_url] = DADOS_SAUCE['sauce_app']['url'].gsub('username', DADOS_SAUCE['sauce_app']['username']).gsub('access_key', DADOS_SAUCE['sauce_app']['access_key'])
  caps[:caps][:username] = DADOS_SAUCE['sauce_app']['username']
  caps[:caps][:accessKey] = DADOS_SAUCE['sauce_app']['access_key']
  caps[:caps][:name] = "#{caps[:caps][:name]} - #{test_local}"
end

caps[:appium_lib][:export_session] = true

Before do
  puts('Rodando no device: ' + caps[:caps][:deviceName])
end

LOGGER.info("Detalhe do caps #{caps}")

Appium::Driver.new(caps, true)

Appium.promote_appium_methods Object

World(PageObjects)
