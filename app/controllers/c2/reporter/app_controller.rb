class C2::Reporter::AppController < C2::BaseController  
  def show
    @reports = C2::Reporter.reports
    @reports.each(&:refresh)
  end  
end
