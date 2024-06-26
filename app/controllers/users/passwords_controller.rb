# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :random_delay, only: [:create, :update]

  # GET /resource/password/new
  def new
    authorize :"users/passwords"
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    authorize :"users/passwords"
    super
  end

  # POST /resource/password
  def create
    authorize :"users/passwords"
    self.resource = resource_class.send_reset_password_instructions(resource_params)
    yield resource if block_given?
    # This operation should always look like it succeeded
    set_flash_message! :notice, :send_instructions
    respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
  end

  # PUT /resource/password
  def update
    authorize :"users/passwords"
    super
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
