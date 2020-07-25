def ids(element)
  find_elements(:accessibility_id, element)
rescue StandardError => e
  raise "Element with ACCESSIBILITY_IDS = '#{element}' was not found on the current screen.\n#{e}"
end

def id(element)
  find_element(:accessibility_id, element)
rescue StandardError => e
  raise "Element with ACCESSIBILITY_ID = '#{element}' was not found on the current screen.\n#{e}"
end

def find_class(element)
  find_elements(:class_name, element)
rescue StandardError => e
  raise "Element with CLASS = '#{element}' was not found on the current screen.\n#{e}"
end

def find(element)
  find_element(:id, element)
rescue StandardError => e
  raise "Element with ID = '#{element}' was not found on the current screen.\n#{e}"
end

def all(element)
  find_elements(:id, element)
rescue StandardError => e
  raise "Element with IDS = '#{element}' was not found on the current screen.\n#{e}"
end

def find_text_android(text)
  xpath("//*[@text='#{text}']")
rescue StandardError => e
  raise "Element with XPATH_TEXT = '#{element}' was not found on the current screen.\n#{e}"
end
