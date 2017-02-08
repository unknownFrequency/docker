class ImageForm extends React.Component {
  constructor(props) {
    super(props);
  }

  handleImageChange(e) {
    e.preventDefault();
    let reader = new FileReader();
    let files = e.target.files;
    let output = document.getElementById("result");

    for (let i = 0; i < files.length; i++) {
      let file = files[i];
      if (!file.type.match('image')) continue;
      let picReader = new FileReader();
      picReader.addEventListener("load", (event) => {
        image = new Image();
        image.src = picReader.result

        // TODO: Sets width+height = 0 when clicking "Browse" more than once
        let size = scaleSize(100,100, image.width, image.height) // method from: image_handling.es6.js
        let picFile = event.target;
        var div = React.createElement("div");
        div.innerHTML = "<img class='thumbnail' width='" + size.width + "' height='" + size.height + "' src='" + picFile.result + "' />";
        output.insertBefore(div, null);
      });
      //Read the image
      picReader.readAsDataURL(file);
    }
  }

  render() {
    return (
      <div>
        <output id="result" />

        <form className="new_gallery" id="new_gallery" encType="multipart/form-data" action="/galleries" acceptCharset="UTF-8" method="post">
          <input name="utf8" type="hidden" value="&#x2713;" />
          <input type="hidden" name="authenticity_token" value={this.props.authenticity_token} />

          <div className="field">
            <label htmlFor="gallery_name">Navn</label>
            <input type="text" name="gallery[name]" id="gallery_name" />
          </div>
          <div className="field">
            <label htmlFor="gallery_description">Beskerivelse</label>
            <textarea name="gallery[description]" id="gallery_description"></textarea>
          </div>
          <div className="field">
            <label htmlFor="gallery_gallery_images_attributes_0_image">Billeder</label>
            <input onChange={(e)=>this.handleImageChange(e)} multiple="multiple"
              name="gallery_images[image][]" type="file" id="gallery_gallery_images_attributes_0_image" />
          </div>
          <div className="actions">
            <input type="submit" name="commit" value="Create Gallery" data-disable-with="Create Gallery" />
          </div>
        </form>
      </div>
    )
  }
};

