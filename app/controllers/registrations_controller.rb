class RegistrationsController < Devise::RegistrationsController
  protected
  # This is a Devise method (defined in the RegistrationsController), that we are overwriting. This is because when
  # someone signs up with facebook, devise automatically sets up a password for them, and we need to have a solution
  # to this.
    def update_resource(resource, params)
      resource.update_without_password(params)
    end
end