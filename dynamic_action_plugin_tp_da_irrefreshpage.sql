set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.4.00.12'
,p_default_workspace_id=>27000294100083787867
,p_default_application_id=>90922
,p_default_owner=>'TPE'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/tp_da_irrefreshpage
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(37856321762875769036)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'TP.DA.IRREFRESHPAGE'
,p_display_name=>'IR Refresh Page'
,p_category=>'EXECUTE'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>'#PLUGIN_FILES#apex.interactiveReport.refreshPage.js'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'FUNCTION ikp_render',
'( p_dynamic_action in apex_plugin.t_dynamic_action',
', p_plugin         in apex_plugin.t_plugin ',
')',
'RETURN apex_plugin.t_dynamic_action_render_result',
'IS',
'  l_result apex_plugin.t_dynamic_action_render_result;',
'  l_keep   VARCHAR2(1)    := COALESCE(p_dynamic_action.attribute_01, ''Y'');',
'  l_code   VARCHAR2(4000);',
'BEGIN',
'  IF apex_application.g_debug',
'  THEN',
'    apex_plugin_util.debug_dynamic_action(',
'       p_plugin         => p_plugin,',
'       p_dynamic_action => p_dynamic_action ',
'    );',
'  END IF;',
'',
'  l_code :=  ''function(){ apex.jQuery("#" + this.affectedElements[0].id + "_ir").interactiveReport("refresh", ''||CASE l_keep WHEN ''Y'' THEN ''true'' ELSE ''false'' END||''); }'';',
'   ',
'  l_result.javascript_function := l_code;',
'  ',
'  RETURN l_result;',
'END;'))
,p_render_function=>'ikp_render'
,p_standard_attributes=>'REGION'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'2.0'
,p_about_url=>'https://github.com/tompetrus/oracle-apex-ir-refresh-pagination'
,p_files_version=>2
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(37856323547315772084)
,p_plugin_id=>wwv_flow_api.id(37856321762875769036)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Keep pagination?'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '282066756E6374696F6E202820242C20756E646566696E65642029207B0D0A202076617220435F504147494E4154494F4E5F4C4142454C203D20222E612D4952522D706167696E6174696F6E2D6C6162656C220D0A202020202C20435F4D41585F524F57';
wwv_flow_api.g_varchar2_table(2) := '532020202020202020203D20310D0A202020202C20435F524F57535F4645544348454420202020203D20313B0D0A20202F2A2A2040707572706F7365207265747269657665207468652063757272656E74206D696E20726F77206F6620616E2049522062';
wwv_flow_api.g_varchar2_table(3) := '792070617273696E672074686520706167696E6174696F6E206C6162656C206F6620616E202258202D205922206F722058202D2059206F66205A2220736368656D652E0D0A202020202A2040706172616D20756977207468652077696467657420696E73';
wwv_flow_api.g_varchar2_table(4) := '74616E63650D0A202020202A2F0D0A202066756E6374696F6E2067657443757272656E74526F77202875697729207B0D0A202020207661722063757272656E7454657874203D202428435F504147494E4154494F4E5F4C4142454C2C207569772E656C65';
wwv_flow_api.g_varchar2_table(5) := '6D656E74292E7465787428290D0A2020202020202C2063757272656E744D696E526F77203D2063757272656E74546578742E737562737472696E6728302C2063757272656E74546578742E696E6465784F6628222D2229292E7472696D28293B0D0A2020';
wwv_flow_api.g_varchar2_table(6) := '202072657475726E2063757272656E744D696E526F773B0D0A20207D3B0D0A20200D0A20202F2A2A2040707572706F736520636F6E737472756374732074686520706167696E6174696F6E20737472696E6773206173206170657820657870656374730D';
wwv_flow_api.g_varchar2_table(7) := '0A202020202A2040706172616D20704D696E526F772074686520726F772066726F6D20776869636820746F2073746172742074686520706167650D0A202020202A2040706172616D20704D6178526F777320697272656C6576616E74202D207468697320';
wwv_flow_api.g_varchar2_table(8) := '6973206E6F74207573656420627920617065780D0A202020202A2040706172616D2070526F77734665746368656420697272656C6576616E74202D2074686973206973206E6F74207573656420627920617065780D0A202020202A2F0D0A202066756E63';
wwv_flow_api.g_varchar2_table(9) := '74696F6E20636F6E737472756374506167696E6174696F6E537472696E67202820704D696E526F772C20704D6178526F77732C2070526F7773466574636865642029207B0D0A2020202072657475726E20227067525F6D696E5F726F773D222B704D696E';
wwv_flow_api.g_varchar2_table(10) := '526F772B226D61785F726F77733D222B704D6178526F77732B22726F77735F666574636865643D222B70526F7773466574636865643B0D0A20207D3B2020202020200D0A20200D0A2020242E7769646765742822617065782E696E746572616374697665';
wwv_flow_api.g_varchar2_table(11) := '5265706F7274222C20242E617065782E696E7465726163746976655265706F72742C207B0D0A202020202F2A2A2040707572706F736520726566726573682074686520696E746572616374697665207265706F72740D0A2020202020202A204070617261';
wwv_flow_api.g_varchar2_table(12) := '6D20704D61696E7461696E506167696E6174696F6E2073657420746F207472756520746F20707265736572766520706167696E6174696F6E2E2053657420746F2066616C7365206F7220626C616E6B20666F7220726567756C617220726566726573680D';
wwv_flow_api.g_varchar2_table(13) := '0A2020202020202A2F0D0A20202020726566726573683A2066756E6374696F6E202820704D61696E7461696E506167696E6174696F6E2029207B0D0A20202020202076617220756977203D20746869733B0D0A2020202020206966202820704D61696E74';
wwv_flow_api.g_varchar2_table(14) := '61696E506167696E6174696F6E2029207B0D0A20202020202020207569772E5F706167696E61746528636F6E737472756374506167696E6174696F6E537472696E672867657443757272656E74526F7728756977292C20435F4D41585F524F57532C2043';
wwv_flow_api.g_varchar2_table(15) := '5F524F57535F4645544348454429293B202020200D0A2020202020207D20656C7365207B0D0A20202020202020207569772E5F737570657228293B0D0A2020202020207D0D0A202020207D0D0A20207D293B0D0A7D292820617065782E6A517565727920';
wwv_flow_api.g_varchar2_table(16) := '293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(37856346232023775353)
,p_plugin_id=>wwv_flow_api.id(37856321762875769036)
,p_file_name=>'apex.interactiveReport.refreshPage.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
