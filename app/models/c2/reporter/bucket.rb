class C2::Reporter::Bucket
  attr_accessor :refreshed_at
  
  attr_accessor :series
  attr_accessor :series_cache
  
  def initialize(klass_name, scope_name, *series)
    @klass_name = klass_name
    @scope_name = scope_name

    series = [:count] if series.empty?
    @series = series.inject({}) do |m,v|
      name, *mutators = *[*v]
      m[name.to_sym] = {
        :id => name.to_sym,
        :name => name.to_s.titleize,
        :mutators => mutators,
        :data => []
      }
      m
    end
  end
  
  def klass
    @klass_cache ||= @klass_name.to_s.classify.constantize
  end
  
  def scope
    self.klass.send(@scope_name)
  end
  
  def id
    @scope_name.to_sym
  end
  
  def label
    @scope_name.to_s.titleize
  end
  
  def count
    self.scope.count
  end
  
  def refresh
    @series_cache = {}
    started_at = self.scope.where(:created_at.ne => nil).min(:created_at) || Time.now
    self.scope.each do |item|
      date = (item.created_at || started_at).to_date
      @series.each do |key,value|
        data = item.respond_to?(key) ? item.send(key) : 1
        @series_cache[key] ||= Hash.new(0)
        @series_cache[key][date] += value[:mutators].inject(data) { |memo,mutator| memo.send(mutator) }
      end
    end
    @series.map do |key,value|
      value[:start] = started_at.to_date
      value[:end] = Date.today
      value[:data] = (value[:start]..value[:end]).map { |d| @series_cache[key][d] }
    end
    @refreshed_at = Time.now.utc
  end
  
  def as_json(options={})
    {
      :id => self.id,
      :label => self.label,
      :count => self.count,
      :series => self.series.map {|k,v| v }
    }
  end
  
end