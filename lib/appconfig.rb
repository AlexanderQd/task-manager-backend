module Appconfig
  DEFAULT_FROM = 'AlexanderQd <manualex2193@gmail.com>'

  module Database
    ADAPTER = 'postgresql'
    ENCODING = 'unicode'
    HOST = 'localhost'
    POOL = 5
    USER = 'task_manager'
    PASSWORD = ['production'].include?(Rails.env) ? '59hoLOF&vz:GI#*1' : ''

    module Main
      NAME = case Rails.env
        when 'production'
          'task_manager'
        else
          'task_manager_dev'
      end
    end

    module Operations
      NAME = Rails.env.production? ? 'task_manager' : 'task_manager_dev'
    end
  end
end