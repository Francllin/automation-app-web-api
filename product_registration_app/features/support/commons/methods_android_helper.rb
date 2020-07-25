def close_keyboard
  device_is_ios? ? hide_keyboard_ios : $driver.hide_keyboard('Finished')
rescue Selenium::WebDriver::Error::UnknownError
  puts 'keyboard não está visivel!'
end

def page_lista_text
  Appium.update_settings(snapshotTimeout: 50) if device_is_ios?
  @string_text_tela = device_is_android? ? get_android_inspect.split('text: ').map(&:strip).to_s : get_source
  LOGGER.info('Retornou a lista de texto da página')
  @string_text_tela.to_s
end