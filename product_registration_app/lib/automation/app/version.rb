module Automation
  module App
    DEV_SPRINT = 0 # Versao da Sprint de desenvolvimento
    AUT_SPRINT = 0 # Versao da Sprint de automacao
    BUGFIX = 0 # Versao do Bugfix

    VERSION = "#{DEV_SPRINT}.#{AUT_SPRINT}.#{BUGFIX}".freeze
  end
end
