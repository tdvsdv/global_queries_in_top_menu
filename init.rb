

Redmine::Plugin.register :global_queries_in_top_menu do
  	name 'Global Queries In Top Menu plugin'
 	author 'Pitin Vladimir'
 	description 'This plugin place link to the query in top menu'
  	version '0.0.1'
 	url 'http://pitin.su'
  	author_url 'http://pitin.su'


 	settings :partial => 'settings/global_queries_in_top_menu_settings',
             :default => {
             "query_id" => "0"
             }
   	menu :top_menu, :query_link, { :controller => 'issues', :action => 'index', :query_id => ''}, :caption => Proc.new { Query.get_top_menu_caption_query_name(nil) },  :if => Proc.new { User.current.logged? && Query.query_in_top_menu? }, :after => :my_page    
end

Rails.application.config.to_prepare do
  Query.send(:include, GlobalQueriesInTopMenu::QueryPatch)
end

require 'global_queries_in_top_menu/hooks_views'