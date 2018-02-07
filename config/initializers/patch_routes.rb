class ActionDispatch::Request
  def controller_class_for(name)
    if name
      vv_controller_param = name.underscore
      v_controller = nil
      SUPPORTED_VERSIONS.reverse.each do |v|
        lv_controller_param = vv_controller_param.sub(/^vv/, v)
        lv_const_name = "#{lv_controller_param.camelize}Controller"
        begin
          v_controller = ActiveSupport::Dependencies.constantize(lv_const_name)
          break
        rescue NameError
        end
      end
      vv_const_name = "#{vv_controller_param.camelize}Controller"
      v_controller || ActiveSupport::Dependencies.constantize(vv_const_name)
    else
      PASS_NOT_FOUND
    end
  end
end
