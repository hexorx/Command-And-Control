module C2
  module ControllerAdditions        
    def self.included(base)
      base.extend ClassMethods
      base.helper_method :current_c2_agent, :current_c2_agent_title, :c2_login_path, :c2_profile_path, :c2_logout_path
    end
    
    def current_c2_agent
      @current_c2_agent ||= current_user
    end
    
    def current_c2_agent_title
      @current_c2_agent_title ||= current_c2_agent.send(([:c2_title, :title, :name, :email].map(&:to_s) & current_c2_agent.methods).first)
    end
    
    def c2_clearance?
      current_c2_agent && current_c2_agent.admin?
    end
    
    def authorize_c2_agent
      raise C2::AccessDenied unless c2_clearance?
    end
    
    def c2_login_path
      '/'
    end
    
    def c2_profile_path
      '/'
    end
    
    def c2_logout_path
      '/'
    end
  end
end

if defined? ActionController
  ActionController::Base.class_eval do
    include C2::ControllerAdditions
  end
end