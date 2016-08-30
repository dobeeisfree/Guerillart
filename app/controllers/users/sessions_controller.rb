class Users::SessionsController < Devise::SessionsController
  


  # protected
  # def auth_options
  #   {:scope => resource_name, :recall => "#{controller_path}#failure"}
  # end
  
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :allow_params_authentication!, :only => :create
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  prepend_view_path 'app/views/devise'

  # GET /resource/sign_in
  def new
    puts "testing : 9"
    self.resource = resource_class.new(sign_in_params)
    puts "testing : 8"
    clean_up_passwords(resource)
    puts "testing : 7"
    respond_with(resource, serialize_options(resource))
    puts "testing : 6"
  end

  # POST /resource/sign_in
  def create
    puts "testing : 0"
    puts Time.now
    
    self.resource = warden.authenticate!(auth_options)
    puts "testing : 1"
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    puts "testing : 2"
    sign_in(resource_name, resource)
    puts "testing : 3"
    respond_to do |format|
        format.json { render :json => {}, :status => :ok }
        format.html { respond_with resource, :location => after_sign_in_path_for(resource) } 
    end
    puts "testing : 4"
  end

  # DELETE /resource/sign_out
  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message :notice, :signed_out if signed_out && is_navigational_format?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end

  def failure   
    puts "failure"
    warden.custom_failure!
    render json: { success: false, error: I18n.t("devise.failure.#{env['warden'].message.to_s}") }, status: 401
  end

  protected

  def sign_in_params
    devise_parameter_sanitizer.sanitize(:sign_in)
  end

  def serialize_options(resource)
    methods = resource_class.authentication_keys.dup
    methods = methods.keys if methods.is_a?(Hash)
    methods << :password if resource.respond_to?(:password)
    { :methods => methods, :only => [:password] }
  end

  def auth_options
    { :scope => resource_name, :recall => "#{controller_path}#new" }
  end
end
