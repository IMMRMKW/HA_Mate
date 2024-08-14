require 'jekyll'
require 'find'
require 'pathname'
require 'json'
require 'fastimage'

module Jekyll
  class GenerateImageList < Generator
    priority :lowest  # Ensure this generator runs last

    def generate(site)
      base_dir = File.join(site.source, 'assets/images/Plant-database')
      image_list = {}

      Find.find(base_dir) do |path|
        if File.file?(path)
          width, height = FastImage.size(path)
          relative_path = Pathname.new(path).relative_path_from(Pathname.new(site.source)).to_s
          relative_path = File.join('../', relative_path)
          file_name = File.basename(path)

          image_list[file_name] ||= []
          image_list[file_name] << { width: width, height: height, path: relative_path }
        end
      end

      output_dir = site.dest  # Write to the root of the _site directory
      output_file = File.join(output_dir, 'image_list.json')

      # Ensure the directory exists
      FileUtils.mkdir_p(File.dirname(output_file))

      File.write(output_file, JSON.pretty_generate(image_list))

      # Register the file as a static file
      site.static_files << Jekyll::StaticFile.new(site, site.source, '', 'image_list.json')
    end
  end
end

# module Jekyll
#   class GenerateImageList < Generator
#     priority :highest  # Ensure this generator runs last

#     def generate(site)
#       base_dir = File.join(site.source, 'assets/images/Plant-database')
#       image_list = {}

#       Find.find(base_dir) do |path|
#         if File.file?(path)
#           width, height = FastImage.size(path)
#           relative_path = Pathname.new(path).relative_path_from(Pathname.new(site.source)).to_s
#           relative_path = File.join('../', relative_path)
#           file_name = File.basename(path)

#           image_list[file_name] ||= []
#           image_list[file_name] << { width: width, height: height, path: relative_path }
#         end
#       end

#       output_dir = site.dest  # Write to the root of the _site directory
#       File.write(File.join(output_dir, 'image_list.json'), JSON.pretty_generate(image_list))
#     end
#   end
# end




