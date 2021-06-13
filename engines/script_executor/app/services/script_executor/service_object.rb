# frozen_string_literal: true

# Модуль для создания Service-Object. Для использования нужно включить данный модуль
# в класс сервисного объекта, и объявить конструктор и метод #call (без параметров)
#
# @example
#   class CreateUser
#     include ServiceObject
#
#     def initialize(param1, param2)
#       ...
#     end
#
#     def call
#       ...
#     end
#   end
#
# Стоит придерживаться следующих правил:
# + Придерживаться единой конверции по именованию
# + SO стоит вызывать через метод call
# + У SO должна быть одна обязанность
# + Конструктор должен быть простым
# + Аргруметны SO должны быть максимально примитивными
# + Необходимо объединять SO по namespace'ам
module ScriptExecutor
  module ServiceObject
    extend ActiveSupport::Concern

    def handle_success(data)
      ServiceResultObject.new(true, data)
    end

    def handle_error(error)
      ServiceResultObject.new(false, errors: [error].flatten)
    end

    def handle_model_error(model)
      errors_hash = model.errors.messages
      model_errors = []

      errors_hash.each_key do |field|
        errors_hash[field].inject(model_errors) { |res, value| res << error(value, 400) }
      end

      handle_error(model_errors)
    end

    # Формат ошибки
    def error(message, status, backtrace = nil, object_instance = nil)
      { title: message, status: status, backtrace: backtrace, object_instance: object_instance }
    end

    # Проверяет запись в service object, создает лог для отправки в splunk
    #
    # @param result [Boolean] Обязательный параметр. Успешное ли действие
    # @param record_id [ActiveRecord] Обязательный параметр. Id модели или массив ids, при metadatapackage может указываться имя архива
    # @param record_type [String] Обязательный параметр. Тип сущности
    # @param event [Integer] Обязательный параметр. Тип события
    # @param request_data [Hash] Параметры запроса
    # @param source [String] Обязательный параметр. Название модуля или СО
    # @param initiator [String] Инициатор действия
    # @param category [Integer] Код категории события безопасности
    # @param is_security [Boolean] Является ли событием ИБ
    # @param logging_level [Integer] Уровень логирования
    # @param severity [Integer] Код уровня критичности события безопасности
    # @param record_errors [Hash] Ошибки
    #
    # @example
    # log_on_action(result: true, record_id: build.id, record_type: 'Build', event: :delete, initiator: current_user.email,
    #     source: 'Builds::Delete', category: :crud)
    # => Создает лог
    def log_on_action(
        result:, record_id:, record_type:, event:, source:, category: :access, initiator: 'system', request_data: {},
        is_security: true, logging_level: :info, severity: :informational_event, record_errors: nil
    )
      log_params = {
          success: result,
          event: event,
          record_type: record_type,
          request_data: request_data,
          record_id: record_id,
          record_errors: result ? nil : { errors: record_errors },
          initiator: initiator,
          source: source,
          category: category,
          is_security: is_security,
          logging_level: logging_level,
          severity: severity,
      }

      LogJob.perform_async(log_params)
    end

    class_methods do
      def call(*args)
        new(*args).call
      end
    end
  end
end
