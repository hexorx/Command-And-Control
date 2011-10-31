module C2::Reporter  
  mattr_accessor :reports
  @@reports = []

  class Report  
    attr_accessor :refreshed_at
    attr_accessor :buckets
    attr_accessor :options
    attr_accessor :meta
  
    def initialize(klass_name, options={}, &block)
      @options = options.with_indifferent_access

      @buckets = []
      @klass_name = klass_name
      @meta = @options.delete(:meta)
    
      instance_eval(&block)
    
      ::C2::Reporter.reports.push(self)
    end
  
    def klass
      @klass_cache ||= @klass_name.to_s.classify.constantize
    end
  
    def id
      @klass_name.to_sym
    end
  
    def label
      @klass_name.to_s.pluralize.titleize
    end
  
    def refresh
      @buckets.each(&:refresh)
      @refreshed_at = Time.now.utc
    end
  
    def as_json(options={})
      {
        :id => self.id,
        :label => self.label,
        :buckets => self.buckets
      }
    end
  
  private

    def bucket(scope_name, *series)
      @buckets.push(C2::Reporter::Bucket.new(@klass_name, scope_name, *series))
    end
  
  end
end
