module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_request, only: %i[login register]

      def login
        authenticate params[:email], params[:password]
      end

      def test
        render json: {
            message: 'You have passed authentication and authorization test'
        }
      end

      # POST /register
      def register
        @user = User.create(user_params)
        if @user.save
          response = { message: 'User created successfully'}
          render json: response, status: :created
        else
          render status: 400, json: {
              validationMessage: @user.errors.full_messages.to_sentence,
          }.to_json
        end
      end

      private

      def user_params
        params.permit(:email, :password)
      end

      def authenticate(email, password)
        command = AuthenticateUser.call(email, password)

        if command.success?
          render json: {
              access_token: command.result,
              message: 'Login Successful'
          }
        else
          render json: { error: command.errors }, status: :unauthorized
        end
      end

    end
  end
end