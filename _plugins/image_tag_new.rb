# require 'liquid'
# require 'json'

# # Define the custom tag
# module Jekyll
#     class ImageTag < Liquid::Tag
#     def initialize(tag_name, markup, tokens)
#         super
#         @json_file, @image_name, @alt_text, @view_width_desktop, @view_width_mobile = markup.strip.split(',').map(&:strip)
#         @max_width = @max_width.to_i
#     end

#     def render(context)
#         modal_id = "modal_#{@image_name.hash.abs}"
#         # Get the absolute path to the JSON file
#         site_source = context.registers[:site].source
#         json_file_path = File.join(site_source, @json_file.gsub('../', ''))

#         # Read and parse the JSON file
#         json_data = JSON.parse(File.read(json_file_path))

#         # Find the image data for the specified image name
#         image_data = json_data[@image_name]

#         # Generate the srcset attribute
#         srcset = image_data.map { |img| "#{img['path']} #{img['width']}w" }.join(', ')
#         # Get the largest image for the src attribute
#         largest_image = image_data.max_by { |img| img['width'] }
#         puts "largest_image: #{largest_image['path']}"
#         html = <<-HTML
#               <style>
#         .modal {
#           display: none;
#           position: fixed;
#           z-index: 1;
#           left: 0;
#           top: 0;
#           width: 100%;
#           height: 100%;
#           overflow: auto;
#           background-color: rgba(0,0,0,0.4);
#           align-items: center;
#           justify-content: center;
#         }
#         .modal-content {
#           margin: auto;
#           display: block;
#           max-width: 80%;
#           max-height: 80%;
#           width: auto;
#           height: auto;
#         }
#         .modal-content, #caption {
#           animation-name: zoom;
#           animation-duration: 0.6s;
#         }
#         @keyframes zoom {
#           from {transform: scale(0)} 
#           to {transform: scale(1)}
#         }
#         .close {
#           position: absolute;
#           top: 15px;
#           right: 35px;
#           color: #f1f1f1;
#           font-size: 40px;
#           font-weight: bold;
#           transition: 0.3s;
#         }
#         .close:hover,
#         .close:focus {
#           color: #bbb;
#           text-decoration: none;
#           cursor: pointer;
#         }
#       </style>
#         <img 
#             src="#{largest_image['path']}"
#             srcset="#{srcset}"
#             sizes="(max-width: 600px) #{@view_width_mobile}vw, #{@view_width_desktop}vw"
#             alt="#{@alt_text}"
#             style="display: block; margin-left: auto; margin-right: auto; max-width: 100%; cursor: pointer;"
#             onclick="openModal('#{modal_id}', '#{@image_name}')"/>

#         <div id="#{modal_id}" class="modal" onclick="this.style.display='none'">
#             <span class="close" onclick="document.getElementById('#{modal_id}').style.display='none'">&times;</span>
#             <img class="modal-content" id="img_#{modal_id}" src="#{largest_image['path']}" onclick="event.stopPropagation()">
#         </div>

#         <script>
#             async function openModal(modalId, initialPath) {
#             var modal = document.getElementById(modalId);
#             var imgElement = document.getElementById('img_' + modalId);
#             const screenWidth = window.innerWidth;
#             const screenHeight = window.innerHeight;
#             let fileName = initialPath.split('/').pop();
#             let imagePath = await findFittingImage(fileName, screenWidth, screenHeight);
#             if (imagePath) {
#                 console.log(imagePath);
#                 imgElement.src = imagePath;
#                 modal.style.display = 'flex';
#             } else {
#                 console.error("No fitting image found");
#             }
#             }

#             async function findFittingImage(fileName, screenWidth, screenHeight) {
#                 try {
#                     const response = await fetch('#{@json_file}');
#                     if (!response.ok) {
#                     throw new Error(`HTTP error! Status: ${response.status}`);
#                     }
#                     const images = await response.json();

#                     if (!images[fileName]) {
#                     return null;
#                     }

#                     let fittingImage = null;
#                     images[fileName].forEach(image => {
#                     if (image.width <= screenWidth && image.height <= screenHeight) {
#                         if (!fittingImage || (image.width > fittingImage.width && image.height > fittingImage.height)) {
#                         fittingImage = image;
#                         }
#                     }
#                     });

#                     return fittingImage ? fittingImage.path : null;
#                 } catch (error) {
#                     console.error("Unable to fetch data:", error);
#                     return null;
#                 }
#                 }
#         </script>
#         HTML

#         html
#     end
#     end
# end

# # Register the custom tag with Liquid
# Liquid::Template.register_tag('image_tag_new', Jekyll::ImageTag)

