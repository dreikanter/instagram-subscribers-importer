class InstagramSubscribersImporter
  def self.import!(options = {})
    new(options).send(:import!)
  end

  private

  attr_reader :logger
  attr_reader :session
  attr_reader :sheet_id

  def initialize(options = {})
    @session ||= new_session(options.fetch(:google_service_key))
    @sheet_id = options.fetch(:sheet_id)
    @logger ||= Logger.new(options[:logger] || '/dev/null')
  end

  def import!
    logger.info 'importing Instagram subscribers to a spreadsheet'
  end

  def new_session(google_service_key)
    GoogleDrive::Session.from_service_account_key(google_service_key)
  end

  def worksheet
    @worksheet ||= session.spreadsheet_by_key(sheet_id).worksheets[0]
  end
end
