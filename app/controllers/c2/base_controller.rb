class C2::BaseController < ApplicationController
  unloadable
  layout 'c2'
  
  before_filter :authorize_c2_agent
end