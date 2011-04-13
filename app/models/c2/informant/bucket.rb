class C2::Informant::Bucket
  include Mongoid::Document
  
  field :label
  field :description
  
  field :method_name
  
  embedded_in :locus, :class_name => 'C2::Informant::Locus'
  
  delegate :count, :to => :entries
  delegate :elements, :entry_label, :to => :locus
  
  def label
    self[:label] || self.method_name.titleize
  end
    
  def entries
    return _parent.klass.all unless method_name && _parent.klass.respond_to?(method_name)
    _parent.klass.try(method_name)
  end
  
  def entries_page(page=1,per=10)
    entries.offset((page - 1) * per).limit(per).map do |entry|
      data = elements.enabled.inject({}) do |memo, element|
        memo[element.name] = entry.send(element.name) if entry.respond_to?(element.name)
        memo
      end
      data['_id'] = entry['_id']
      data['created_at'] = entry['created_at']
      data['updated_at'] = entry['updated_at']
      data[entry_label] = entry[entry_label] 
      data
    end
  end

  def as_json(options={})
    cleaned = super((options || {}).merge({
      :methods => [:label, :count, :entries_page]
    })).map {|k,v| [k.to_s, (v.is_a?(Numeric) ? v.to_s : v)]}
    Hash[cleaned]
  end
end