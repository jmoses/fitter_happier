class FitterHappierController < ActionController::Base
  layout nil

  def index
    render(:text => "FitterHappier Site Check Passed\n")
  end

  def site_check
    time = Time.now.to_formatted_s(:rfc822)
    render(:text => "FitterHappier Site Check Passed @ #{time}\n")
  end

  def site_and_database_check
    table_name = (Rails::VERSION::STRING >= '2.1.0' ? 'schema_migrations' : 'schema_info')
    query      = "SELECT max(lpad(version, 20, '0')) FROM #{table_name}"
    version    = ActiveRecord::Base.connection.select_value(query).to_i
    time       = Time.now.to_formatted_s(:rfc822)
    render(:text => "FitterHappier Site and Database Check Passed @ #{time}\nSchema Version: #{version}\n")
  end

  private

  def process_with_silence(*args)
    logger.quietly do
      process_without_silence(*args)
    end
  end

  alias_method_chain :process, :silence
end
