class CommandWithErrors < Imperator::Command
  include Resque::Plugins::Status
  
  def initialize(*args)
    options = args.extract_options!
    super(::Resque::Plugins::Status::Hash.generate_uuid, options)
    @errors = ActiveModel::Errors.new(self)
  end
end
