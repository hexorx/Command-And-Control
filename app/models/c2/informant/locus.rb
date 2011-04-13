class C2::Informant::Locus
  include Mongoid::Document
  
  field :label
  field :description
  
  field :class_name
  
  field :entry_label
  
  embeds_many :buckets, :class_name => 'C2::Informant::Bucket'
  embeds_many :elements, :class_name => 'C2::Informant::FormElement'
  
  delegate :count, :to => :klass
  
  def label
    self[:label] || self.class_name.pluralize.titleize
  end
    
  def entry_label
    self[:entry_label] || ([:c2_label, :entry_label, :to_label, :label, :title, :name, :email].map(&:to_s) & klass.instance_methods).first
  end
    
  def klass
    @klass ||= self.class_name.classify.constantize
  end  

  def entries
    klass.all
  end
    
  def entries_page(page=1,per=10)
    entries.offset((page - 1) * per).limit(per).map do |entry|
      data = elements.inject({}) do |memo, element|
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
            {'type' => 'submit', 'class' => '.button', 'value' => 'Save'},
            {
              'type' => 'a',
              'class' => 'cancel',
              'href' => "#{hash_path}/entries",
              'html' => 'Cancel'
            }
          ]
        }
      ]
    }
  end

  def as_json(options={})
    cleaned = super((options || {}).merge({
      :methods => [:count, :buckets, :entry_label, :entries_page, :entry_form_builder]
    })).map {|k,v| [k.to_s, (v.is_a?(Numeric) ? v.to_s : v)]}
    Hash[cleaned]
  end
end