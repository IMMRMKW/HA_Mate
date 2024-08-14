module Jekyll
  class ImageTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @filepath, @alt_text = markup.split(',').map(&:strip)
    end

    def render(context)
    modal_id = "modal_#{@filepath.hash.abs}"
    filename = File.basename(@filepath)
    alt_text = @alt_text.gsub('"', '&quot;')  # Escape double quotes in alt text
    <<~HTML
      <style>
        .modal {
          display: none;
          position: fixed;
          z-index: 1;
          left: 0;
          top: 0;
          width: 100%;
          height: 100%;
          overflow: auto;
          background-color: rgba(0,0,0,0.4);
          align-items: center;
          justify-content: center;
        }
        .modal-content {
          margin: auto;
          display: block;
          max-width: 80%;
          max-height: 80%;
          width: auto;
          height: auto;
        }
        .modal-content, #caption {
          animation-name: zoom;
          animation-duration: 0.6s;
        }
        @keyframes zoom {
          from {transform: scale(0)} 
          to {transform: scale(1)}
        }
        .close {
          position: absolute;
          top: 15px;
          right: 35px;
          color: #f1f1f1;
          font-size: 40px;
          font-weight: bold;
          transition: 0.3s;
        }
        .close:hover,
        .close:focus {
          color: #bbb;
          text-decoration: none;
          cursor: pointer;
        }
      </style>
      <img 
        src="#{@filepath}"
        srcset="#{@filepath.gsub('300', '100')} 100w, 
                #{@filepath} 300w"
        sizes="(max-width: 600px) 100px, 300px"
        alt="#{alt_text}"
        style="display: block; margin-left: auto; margin-right: auto; max-width: 100%; cursor: pointer;"
        onclick="openModal('#{modal_id}', '#{@filepath}')"/>

      <div id="#{modal_id}" class="modal" onclick="this.style.display='none'">
        <span class="close" onclick="document.getElementById('#{modal_id}').style.display='none'">&times;</span>
        <img class="modal-content" id="img_#{modal_id}" src="#{@filepath}" onclick="event.stopPropagation()">
      </div>

      <script>
        function openModal(modalId, initialPath) {
          var modal = document.getElementById(modalId);
          var imgElement = document.getElementById('img_' + modalId);
          const screenWidth = window.innerWidth;
            const screenHeight = window.innerHeight;
            let fileName = initialPath.split('/').pop();
            findFittingImage(fileName, screenWidth, screenHeight).then(imagePath => {
                imgElement.src = imagePath;
                console.log(imagePath);
            });
          modal.style.display = 'flex';
        }

        async function findFittingImage(fileName, screenWidth, screenHeight) {
            try {
                fetch('/image_list.json')
                .then(response => response.json())
                .then(data => console.log(data))
                .catch(error => console.error('Error fetching JSON:', error));
                const response = await fetch('/image_list.json');
                if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
                }
                const images = await response.json();

                if (!images[fileName]) {
                return null;
                }

                let fittingImage = null;
                images[fileName].forEach(image => {
                if (image.width <= screenWidth && image.height <= screenHeight) {
                    if (!fittingImage || (image.width > fittingImage.width && image.height > fittingImage.height)) {
                    fittingImage = image;
                    }
                }
                });

                return fittingImage ? fittingImage.path : null;
            } catch (error) {
                console.error("Unable to fetch data:", error);
                return null;
            }
            }
      </script>
    HTML
  end
  end
end

Liquid::Template.register_tag('image_tag', Jekyll::ImageTag)