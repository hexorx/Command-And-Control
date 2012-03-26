namespace :c2 do
  def get_mongoid_models
    documents = []
    Dir.glob("app/models/**/*.rb").sort.each do |file|
      model_path = file[0..-4].split('/')[2..-1]
      begin
        klass = model_path.map(&:classify).join('::').constantize
        if klass.ancestors.include?(Mongoid::Document) && !klass.embedded
          documents << klass
        end
      rescue => e
        # Just for non-mongoid objects that dont have the embedded
        # attribute at the class level.
      end
    end
    documents
  end
  
  def valid_scopes_for(document)
    valid_scopes = document.scopes.select do |method, scope|
      valid = case conditions = scope
      when Hash
        true
      when Proc
        true if conditions.arity == 0
      else
        false
      end
      valid || false
    end
    Hash[*valid_scopes.flatten]
  end
  
  def categorized_fields_for(document)
    valid_fields = document.fields.map do |name, field|
      tag = case field.type.name
      when 'String', 'Object'
        if field.options[:metadata]
          nil
        elsif name.to_s.ends_with?('_password')
          [name.to_s, 'password']
        else
          [name.to_s, 'text']
        end
      when 'Boolean'
        [name.to_s, 'checkbox']
      else
        nil
      end
    end
    Hash[*valid_fields.compact.flatten]
  end
  
  desc 'List all mongoid models'
  task :discover => :environment do
    locus_list = get_mongoid_models.map do |document|
      C2::Informant::Locus.find_or_create_by({ :class_name => document.name })
    end
    locus_list.each do |document|
      puts document.label

      puts ' > Scopes'
      valid_scopes_for(document.klass).each do |method, scope|
        puts "  - #{method}"
        document.buckets.find_or_create_by({ :method_name => method.to_s })
      end

      puts ' > Fields'
      categorized_fields_for(document.klass).each do |name, tag|
        puts "  - #{name} as #{tag}"
        unless document.elements.where({ :name => name }).first
          document.elements.create({ :name => name, :tag => tag })
        end
      end
    end
    
  end
  
end