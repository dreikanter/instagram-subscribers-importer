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
    # ws = session.spreadsheet_by_key(SHEET_ID).worksheets[0]

    # # Gets content of A2 cell.
    # p ws[2, 2]

    # # Changes content of cells.
    # # Changes are not sent to the server until you call ws.save().
    # ws[2, 1] = 'foo'
    # ws[2, 2] = 'bar'
    # ws.save

    # # Dumps all cells.
    # (1..ws.num_rows).each do |row|
    #   (1..ws.num_cols).each do |col|
    #     p ws[row, col]
    #   end
    # end

    # # Yet another way to do so.
    # p ws.rows #==> [['fuga', '], ['foo', 'bar]]

    # # Reloads the worksheet to get changes by other clients.
    # ws.reload
  end

  def new_session(google_service_key)
    GoogleDrive::Session.from_service_account_key(google_service_key)
  end
end
