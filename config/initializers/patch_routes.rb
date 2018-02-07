LATEST_VERSION = 'v1'

class ActionDispatch::Request
  def controller_class_for(name)
    if name
      vv_controller_param = name.underscore
      lv_controller_param = vv_controller_param.sub(/^vv/, LATEST_VERSION)
      lv_const_name = "#{lv_controller_param.camelize}Controller"
      vv_const_name = "#{vv_controller_param.camelize}Controller"
      begin
        ActiveSupport::Dependencies.constantize(lv_const_name)
      rescue NameError
        ActiveSupport::Dependencies.constantize(vv_const_name)
      end
    else
      PASS_NOT_FOUND
    end
  end
end
