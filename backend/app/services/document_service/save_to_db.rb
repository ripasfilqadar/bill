require 'docx'


module DocumentService
	class SaveToDB < Services::Base
		def initialize(path, document)
			@path =  Rails.root.join("public", path)
			@ext = path.split('.').last
			@document = document
		end

		def perform
			if @ext == 'pdf'

			elsif @ext.in? %w('doc', 'docx')
				last_modified = File.mtime(@path)
				doc = Docx::Document.open(@path)
				if last_modified > document.last_updated
					string_content = ""
					doc.paragraphs.each do |p|
					  string_content += p
					end
					document.last_updated = last_modified
					document.content = string_content
					document.data_file_name = File.basename(@path)
				end

				document
			end
		end
	end
end


