require 'yaml'
require 'rake'
require 'json'
require 'open3'

desc 'Abrir emulador para plataforma android'
task :run_emulador, %i[nome_emulador] do |_task, args|
  run_emulador(args.nome_emulador)
end

desc 'Validar de código ruby'
task :rubocop do
  run_rubocop
end

desc 'Abrir o appium'
task :run_appium do
  run_appium
end

desc 'Rodar os teste no sauce_labs para Android'
task :run_paralell_sauce_labs, %i[plataforma type_test] do |_task, args|
  run_sauce_labs(args.plataforma, args.type_test)
end

desc 'gerar ipa para projeto app calculadora'
task :generate_ipa do
  generate_ipa_ios
end

desc 'gerar apk para projeto app calculadora'
task :generate_apk do
  generate_apk_android
end

desc 'Retonar nome de simulador ios'
task :get_list_simulator, %i[version] do |_task, args|
  get_list_simulator(args.version)
end

desc 'Gherkin Linter'
task :gherkin_linter do
  run_gherkin_linter
end

desc 'Run Gherkin Linter e Rubocop'
task :run_linters do
  run_linters
end

def run_linters
  run_rubocop
  run_gherkin_linter
end

def run_gherkin_linter
  puts "\nAnalyzing feature files with Cuke Linter..."
  config = '-c cuke_linter/configs.yml'
  output = '-o cuke_linter/cuke_linter_report.txt'
  result = system "cuke_linter #{config} #{output}"
  puts 'There are problems in the feature files! Please, check the results file.' unless result
  puts 'Cuke Linter Analysis finished!'
end

def run_rubocop
  puts 'Analisando código-fonte com o Rubocop...'
  checklist = '-r rubocop/formatter/checkstyle_formatter'
  config = '-c code_analyzer/configs.yml'
  formatter = '-f RuboCop::Formatter::CheckstyleFormatter'
  output = '-o code_analyzer/checkstyle-result.xml -f html -o code_analyzer/index.html'
  system "rubocop #{checklist} #{config} #{formatter} #{output}"
  puts 'Análise concluída!'
end

# exemplo versoes: 13.0, 13.1, 13.2 e 13.3
def get_list_simulator(version)
  version = "iOS-#{version.tr('.', '-')}"
  array_simulator = []
  stdout = Open3.capture3('xcrun simctl list --json')
  data = JSON.parse(stdout.first)
  version_simulador = data['devices']["com.apple.CoreSimulator.SimRuntime.#{version}"]
  raise "This version #{version} of the simulator does not exist \n #{data['devices']}" if version_simulador.nil?

  version_simulador.each { |simulador| array_simulator.push(simulador['name']) }
  puts array_simulator
end

def run_sauce_labs(plataforma, type_test)
  puts 'Inicinado testes...'
  total_device = %w[emulador_sauce_android simulador_sauce_ios].include?(plataforma) ? 3 : 5
  if type_test.eql?('bvt')
    system "TYPE_TEST=#{type_test} PARALLEL=#{plataforma} SO=#{plataforma} ENVIRONMENT_TYPE=uat parallel_cucumber features/ -n #{total_device} -o '--tags @bvt' --ignore-tags @wip -t cucumber --group-by scenarios --quiet --verbose-rerun-command"
  else
    system "TYPE_TEST=#{type_test} PARALLEL=#{plataforma} SO=#{plataforma} ENVIRONMENT_TYPE=uat parallel_cucumber features/ -n #{total_device}  --ignore-tags @wip --ignore-tags @bvt -t cucumber --group-by scenarios --quiet --verbose-rerun-command"
  end
end
