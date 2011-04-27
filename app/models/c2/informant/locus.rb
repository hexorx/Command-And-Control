class C2::Informant::Locus
  include Mongoid::Document
  
  field :label
  field :description
  
  field :class_name
  
  field :entry_label
  
  embeds_many :buckets, :class_name => 'C2::Informant::Bucket'
  embeds_many :elements, :class_name => 'C2::Informant::FormElement'
  
  delegate :count, :to => :klass
  
  validate :class_name, :presences => true, :unique => true
    
  def label
    return self[:label] || '' unless self.class_name
    self[:label] ||= self.class_name.pluralize.titleize
  end
  
  def singular_label
    label.to_s.singularize
  end
    
  def entry_label
    return self[:entry_label] || '' unless self.class_name
    self[:entry_label] ||= ([:c2_label, :entry_label, :to_label, :label, :title, :name, :email, :subject].map(&:to_s) & klass.instance_methods).first
  end
    
  def klass
    @klass ||= self.class_name.classify.constantize
  end  

  def entries
    klass.all
  end
    
  def entries_page(page=1,per=10)
    entries_as_json(entries)
  end
  
  def entry_as_json(entry)
    data = self.elements.inject({}) do |memo, element|
      memo[element.name] = entry.send(element.name) if entry.respond_to?(element.name)
      memo
    end
    data['_id'] = entry['_id']
    data[entry_label] = entry.send(entry_label) if entry_label && entry.respond_to?(entry_label)
    data['created_at'] = entry['created_at']
    data['updated_at'] = entry['updated_at']
    data['errors'] = entry.errors
    data
  end
  
  def entries_as_json(entries)
    entries.map { |entry| self.entry_as_json(entry) }
  end

  def sanitized(params)
    self.elements.enabled.map(&:name).inject({}) do |memo, field|
      memo[field] = params[field]
      memo
    end        
  end
  
  def hash_path
    '#/locus/' + self.id.to_s
  end
  
  def entry_form_builder
    {
      'action' => '#',
      'elements' => [
        {
          'type' => 'div',
          'id' => 'entry-fields',
          'class' => 'fields',
          'elements' => elements.enabled.as_json(:except => ['_id', 'tag'])
        },
        {
          'type' => 'div',
          'class' => 'actions',
          'elements' => [
            {'type' => 'submit', 'class' => 'button', 'value' => 'Save'},
            {
              'type' => 'a',
              'class' => 'cancel flip-trigger',
              'href' => "#",
              'html' => 'Cancel'
            }
          ]
        }
      ]
    }
  end

  def as_json(options={})
    cleaned = super((options || {}).merge({
      :methods => [:count, :buckets, :label, :singular_label, :entry_label, :entries_page, :entry_form_builder]
    })).map {|k,v| [k.to_s, (v.is_a?(Numeric) ? v.to_s : v)]}
    Hash[cleaned]
  end
end