module GlobalQueriesInTopMenu
  module QueryPatch
    def self.included(base)
		base.extend(ClassMethods)
		base.send(:include, InstanceMethods)	

		base.class_eval do

		end
		
    end
	
	module ClassMethods   
=begin
		def get_top_menu_caption
			query=Query.find(Setting.plugin_global_queries_in_top_menu['query_id'])
			"<span id='query_in_top_menu'>#{query.name} &mdash; #{query.issue_count}</span>
			<span id='query_in_top_menu_id' style='display:none;'>#{Setting.plugin_global_queries_in_top_menu['query_id']}</span>".html_safe
		end	
=end
		def get_top_menu_caption_query_name(project)
			query=Query.find(Setting.plugin_global_queries_in_top_menu['query_id'])
			if project!=nil
				"<span id='query_in_top_menu'>#{query.name} &mdash; #{query.get_issues_count(project)}</span>".html_safe
			else
				"<span id='query_in_top_menu'>#{query.name} &mdash; #{query.issue_count}</span>".html_safe
			end
		end



		def query_in_top_menu?
			if Query.count(:conditions => ["id=?", Setting.plugin_global_queries_in_top_menu['query_id'] ])>0
				true
			else
				false
			end
		end

	end
	
	module InstanceMethods
		def get_issues_count(project)	
		  conditions=statement  
		  conditions+=" AND project_id="+project.id.to_s
		  Issue.visible.count(:include => [:status, :project], :conditions =>conditions)
		end
	end
	
  end
end
