class C2::Informant::LocusController < C2::BaseController
  respond_to(:json)
  
  def index
    respond_with(@locus = C2::Informant::Locus.all)
  end
  
  def update
    respond_with(@locus = C2::Information::Locus.find(params[:id]))
  end
end
