module GetCurrentTime
  extend ActiveSupport::Concern
  def  get_time
    Time.now
  end
end
