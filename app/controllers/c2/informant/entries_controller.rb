class C2::Informant::EntriesController < C2::BaseController
  respond_to(:json)
  
  def index
    @locus = C2::Informant::Locus.find(params[:locus_id])
    @bucket = @locus.buckets.find(params[:bucket_id])
    @entries = @bucket.entries.offset(0).limit(12)
    respond_with(@entries)
  end
end
