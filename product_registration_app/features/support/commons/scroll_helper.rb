def scroll_element(atributos_ios, text_android)
  device_is_ios? ? $driver.scroll(direction: 'down', name: atributos_ios) : $driver.scroll_to(text_android)
  LOGGER.info("Executou o scroll scroll_element para o elemento do iOS #{atributos_ios} ou Texto Android #{text_android}")
end

def swipe_down
  x = window_size[:width] / 2
  y = window_size[:height] - 200

  start_cords = [x, y]
  en_cords = first_text.location

  swipe(start_x: start_cords[0], start_y: start_cords[1], end_x: en_cords[0], end_y: en_cords[1], duration: 1000)
  LOGGER.info("Executou o scroll swipe_down para as coordenadas: start_x #{start_cords[0]} - start_y #{start_cords[1]} - screen_x_end #{en_cords[0]} - screen_y_end #{en_cords[0]}")
end