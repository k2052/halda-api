module Halda
	module Helpers
		module Auth
	    ##
	    # Returns the current_account, it's an instance of Account model.
	    #
	    def current_account
	      @current_account ||= login_from_session
	    end

		  ##
		  # Override the current_account, you must provide an instance of Account model.
		  #
		  # @example
		  #     set_current_account(Account.authenticate(params[:email], params[:password])
		  #
		  def set_current_account(account=nil)
		    session[APP.config.session_id] = account ? account.id : nil
		    @current_account = account
		  end

	    def login_from_session
	      Account.find_by_id(session[APP.config.session_id])
	    end
		end
	end
end
