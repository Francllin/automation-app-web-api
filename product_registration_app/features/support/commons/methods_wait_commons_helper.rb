def wait_for_time(time)
  sleep time
  LOGGER.info("Aguardando o tempo #{time} segundos")
end

def wait_for_element(atributos, find_true = nil, time = 30)
  Selenium::WebDriver.logger.level = :error
  wait = Selenium::WebDriver::Wait.new(timeout: time)
  case find_true
  when 'class' then
    wait.until { visible?(find_class(atributos), true) }
  when 'id' then
    wait.until { visible?(find(atributos), true) }
  when 'xpath' then
    wait.until { visible?(xpath(atributos), true) }
  else
    wait.until { visible?(atributos) }
  end
  Selenium::WebDriver.logger.level = :warn
  find_true_valuer = find_true || 'ACCESSIBILITY_ID'
  LOGGER.info("Aguardou a existência do elemento #{atributos} usando o tipo #{find_true_valuer}")
rescue Selenium::WebDriver::Error::TimeoutError => e
  Selenium::WebDriver.logger.level = :warn
  raise "Não encontrou resultado da busca para o id: #{atributos} \n #{e.message} "
end

def get_xpath_wait(atributos, time = 30)
  Selenium::WebDriver.logger.level = :error
  wait = Selenium::WebDriver::Wait.new(timeout: time)
  wait.until { visible?(xpath(atributos), true) }
  xpath(atributos)
rescue Selenium::WebDriver::Error::TimeoutError => e
  Selenium::WebDriver.logger.level = :warn
  raise "Não encontrou resultado da busca para o xpath: #{atributos} \n #{e.message} "
end

def visible?(elemento, id_true = nil)
  status = id_true.nil? ? wait(timeout: 1) { exists { id(elemento) } } == true : wait(timeout: 1) { exists { elemento } } == true
  LOGGER.info("Aguardou o status (#{status}) do elemento #{elemento} estar visivel!")
  status
end

def wait_for_text(text, time = 30)
  wait(timeout: time) { exists { xpath("//*[@text='#{text}']") } }
  LOGGER.info("Aguardou o texto #{text} estar visivel")
end

def element?(atributos)
  Selenium::WebDriver.logger.level = :error
  wait = Selenium::WebDriver::Wait.new(timeout: 1)
  wait.until { find_element(:id, atributos) }
  Selenium::WebDriver.logger.level = :warn
  LOGGER.info("Aguardou o elemento #{atributos}")
  return true
rescue Selenium::WebDriver::Error::TimeoutError
  Selenium::WebDriver.logger.level = :warn
  return false
end