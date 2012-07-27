module GlobalQueriesInTopMenu
	module GlobalQueriesInTopMenu
		class Hooks < Redmine::Hook::ViewListener
			render_on :view_layouts_base_html_head, :partial => 'hooks/global_queries_in_top_menu/html_head', :layout => false	
			render_on :view_layouts_base_content, :partial => "hooks/global_queries_in_top_menu/layouts_base_content"	 
		end
	end
end