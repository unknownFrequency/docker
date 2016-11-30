class ImageForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {file: '', imagePreviewUrl: ''};
  }

  handleSubmit(e) {
    e.preventDefault();
    console.log('Uploader...', this.state.file);
  }

  handleImageChange(e) {
    e.preventDefault();
    let reader = new FileReader();
    let file = e.target.files[0];

    reader.onloadend = () => {
      this.setState({
        file: file,
        imagePreviewUrl: reader.result
      });
    }
    reader.readAsDataURL(file)
  }

  render() {
    let {imagePreviewUrl} = this.state;
    let $imagePreview = null;
    if (imagePreviewUrl) {
      $imagePreview = (<img src={imagePreviewUrl} />);
    } else {
      $imagePreview = (<div className="previewText">Please select an Image for Preview</div>);
    }

    return (
      <div>
        <div className="imgPreview">
          {$imagePreview}
        </div>

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

