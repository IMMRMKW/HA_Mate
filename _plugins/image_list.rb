require 'jekyll'
require 'find'
require 'pathname'
require 'json'
require 'fastimage'

module Jekyll
  class GenerateImageList < Generator
    priority :highest  # Ensure this generator runs last

    def generate(site)
      base_dir = File.join(site.source, 'assets/images')
      image_list = {}

      Find.find(base_dir) do |path|
        if File.file?(path)
          width, height = FastImage.size(path)
          relative_path = Pathname.new(path).relative_path_from(Pathname.new(site.source)).to_s
          #relative_path = File.join('../', relative_path)
          file_name = File.basename(path)

          image_list[file_name] ||= []
          image_list[file_name] << { width: width, height: height, path: relative_path }
        end
      end

      # Use the project folder as the base directory
      project_folder = site.source
      output_file = File.join(project_folder, 'assets', 'image_list.json')

      # Ensure the directory exists
      FileUtils.mkdir_p(File.dirname(output_file))

      File.write(output_file, JSON.pretty_generate(image_list))
      site.static_files << Jekyll::StaticFile.new(site, site.source, 'assets', 'image_list.json')
    end
  end
end




