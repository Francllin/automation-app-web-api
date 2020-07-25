Before do
  $driver.start_driver
end

After do |scenario|
  time_stamp = Time.now.strftime('%Y-%m-%d_%H.%M.%S')
  date = Time.now.strftime('%d_%m_%Y')
  sufix = ('fail' if scenario.failed?) || 'sucess'
  name = scenario.name.tr(' ', '_').downcase
  Dir.mkdir('report') unless Dir.exist?('report')
  Dir.mkdir("report/#{sufix}") unless Dir.exist?("report/#{sufix}")
  Dir.mkdir("report/#{sufix}/#{date}") unless Dir.exist?("report/#{sufix}/#{date}")
  screenshot_file = Base64.encode64(File.open(screenshot("report/#{sufix}/#{date}/#{name}_#{time_stamp}.png")).read)
  embed(screenshot_file.to_s, 'image/png', 'Screenshot')
  LOGGER.info("Fim da execução do cenário: ###{scenario.name}## com o status: #{sufix.upcase}")
  $driver.driver_quit
end

Before do |scenario|
  @gerar_cadastro_novo_produto = scenario.tags.select { |item| item.name == '@gerar_cadastro_novo_produto' }.any?
end


at_exit do
  current_date = Time.now
  date = current_date.strftime('%d_%m_%Y')
  name_report = "mobile_#{PLATAFORMA}_#{current_date.strftime('%d-%m-%Y_%H-%M-%S')}"
  Dir.mkdir('report') unless Dir.exist?('report')
  Dir.mkdir('report/local') unless Dir.exist?('report/local')
  Dir.mkdir("report/local/#{date}") unless Dir.exist?("report/local/#{date}")
  Dir.mkdir("report/local/#{date}/#{PLATAFORMA}") unless Dir.exist?("report/local/#{date}/#{PLATAFORMA}")
  ReportBuilder.configure do |config|
    config.input_path = 'report/report.json'
    config.report_path = "report/local/#{date}/#{PLATAFORMA}/" + name_report
    config.report_types = [:html]
    config.report_title = 'Relatório de teste da automação do App calculadora'
    config.compress_image = true
    config.additional_info = { 'App' => 'App calculadora',
                               'Data de execução' => current_date.strftime('%d-%m-%Y %H:%M:%S') }
    config.color = 'indigo'
  end
  ReportBuilder.build_report
end