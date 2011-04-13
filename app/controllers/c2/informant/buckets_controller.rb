class C2::Informant::BucketsController < C2::BaseController
  respond_to(:json)
  
  def index
    respond_with(@locus = C2::Informant::Locus.find(params[:locus_id]).buckets)
  end
  
  def update
    respond_with(@locus = C2::Information::Locus.find(params[:locus_id]).buckets)
  end
end
