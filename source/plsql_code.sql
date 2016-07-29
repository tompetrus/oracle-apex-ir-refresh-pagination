FUNCTION ikp_render
( p_dynamic_action in apex_plugin.t_dynamic_action
, p_plugin         in apex_plugin.t_plugin 
)
RETURN apex_plugin.t_dynamic_action_render_result
IS
  l_result apex_plugin.t_dynamic_action_render_result;
  l_keep   VARCHAR2(1)    := COALESCE(p_dynamic_action.attribute_01, 'Y');
  l_code   VARCHAR2(4000);
BEGIN
  IF apex_application.g_debug
  THEN
    apex_plugin_util.debug_dynamic_action(
       p_plugin         => p_plugin,
       p_dynamic_action => p_dynamic_action 
    );
  END IF;

  l_code :=  'function(){ apex.jQuery("#" + this.affectedElements[0].id + "_ir").interactiveReport("refresh", '||CASE l_keep WHEN 'Y' THEN 'true' ELSE 'false' END||'); }';
   
  l_result.javascript_function := l_code;
  
  RETURN l_result;
END;