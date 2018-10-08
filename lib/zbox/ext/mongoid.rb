module Mongoid
	module Mongoid::Document

		def self.included(base)
			base.include(InstanceMethods)
			base.extend(ClassMethods)
		end

		module InstanceMethods
			# remove medias within the content
			def delete_medias(content)
				doc = Nokogiri::HTML(eval("self.#{content.to_s}"))
				#doc = Nokogiri::HTML(self.content)
				images = doc.css("img[src*='/see/']")
				if images.count>0
					images.each do |image|
						grid_id = image["src"].split("/")[2]
						MongoGrid.remove(grid_id)
					end
				end
			end
		end
    
		module ClassMethods
			def method_missing(name,*args)
				if name.to_s =~ /^remove_(.*)$/
					# if name is pluralize
					if name.to_s.pluralize == name.to_s
						return self.class_eval(%Q{
							define_method("remove_#{$1}") do
								grid_files=self.#{$1}
								grid_files.each do |grid_file|
									id = BSON::ObjectId.from_string(grid_file['grid_id'])
									MongoGrid.grid.delete(id)
								end
							end
					  })
					else
						# name is singlular
						return self.class_eval(%Q{
							define_method("remove_#{$1}") do
								grid_file=self.#{$1}
								unless grid_file.blank?
									id = BSON::ObjectId.from_string(grid_file['grid_id'])
									MongoGrid.grid.delete(id)
								end
							end
					  })
					end
				else
					puts "No this method"
				end
			end
		end
	end
end
