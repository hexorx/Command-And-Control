module C2
  class AccessDenied < StandardError
    attr_reader :action, :subject
    attr_writer :default_message

    def initialize(message = nil, subject = nil)
      @message = message
      @subject = subject
      @default_message = "You are not authorized to access this page."
    end

    def to_s
      @message || @default_message
    end
  end
end