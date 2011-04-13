class C2::Informant::FormElement
  include Mongoid::Document
  
  field :tag
  field :name
  field :caption
  field :tip
  
  field :enabled, :type => Boolean, :default => true
  
  embedded_in :locus, :class_name => 'C2::Informant::Locus'
  
  scope :enabled, :where => { :enabled => true }
  
  def as_json(options={})
    {
      'type' => 'div',
      'id' => "entry_#{name}_field",
      'class' => "field #{name}_field #{tag}",
      'elements' => [
        {
          'type' => tag,
          'name' => name,
          'id' => "entry_#{name}",
          'class' => "#{name}_input #{tag}",
          'caption' => caption          
        },
        {
          'type' => 'div',
          'class' => 'tip',
          'elements' => [
            {
              'type' => 'p',
              'html' => tip
            }
          ]
        }
      ]
    }
  end
end