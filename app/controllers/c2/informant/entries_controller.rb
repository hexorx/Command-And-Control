class C2::Informant::EntriesController < C2::BaseController
  respond_to(:json)
  before_filter :load_source
  
  def index
    @entries = @source.entries.offset(0).limit(12)
    render :json => @source.entries_as_json(@entries)
  end
  
  def show
    @entry = @source.entries.find(params[:id])
    render :json => @source.entry_as_json(@entry)
  end
  
  def create
    @entry = @source.klass.new(@source.sanitized(params))
    @entry.save
    render :json => @source.entry_as_json(@entry)
  end

  def update
    @entry = @source.entries.find(params[:id])
    @entry.update_attributes(@source.sanitized(params))
    render :json => @source.entry_as_json(@entry)
  end
  
protected
  
  def load_source
    @locus = C2::Informant::Locus.find(params[:locus_id])
    @bucket = @locus.buckets.find(params[:bucket_id]) if params[:bucket_id]
    @source = (@bucket || @locus)
  end  
end
