module ApiError

  class StandardError < ::StandardError
    attr_reader :status_code, :error_code
  end

  class RecordInvalidError < StandardError
    def initialize(message = 'No message')
      @status_code = 400
      @error_code = 40001
      super
    end
  end

  class NotUniqueError < StandardError
    def initialize(message = 'No message')
      @status_code = 400
      @error_code = 40002
      super
    end
  end

  class LoginCredentialsError < StandardError
    def initialize(message = 'No message')
      @status_code = 400
      @error_code = 40003
      super
    end
  end

  class UserNotConfirmed < StandardError
    def initialize(message = 'No message')
      @status_code = 401
      @error_code = 40101
      super
    end
  end

  class RecordNotFound < StandardError
    def initialize(message = 'No message')
      @status_code = 404
      @error_code = 40401
      super
    end
  end

  class UserNotFound < StandardError
    def initialize(message = 'No message')
      @status_code = 404
      @error_code = 40402
      super
    end
  end
end
