class ApplicationController < ActionController::Base
    USERS = {"admin_user" => "admin_password"}
    #before_action :authenticate
    # before_action :digest_authenticate

    private
        # def authenticate
        #     authenticate_or_request_with_http_digest do |username|
        #         USERS[username]
        #     end
        # end

        def digest_authenticate
            authenticate_or_request_with_http_digest do |username|
                USERS[username]
            end
        end
end