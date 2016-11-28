class ImageForm extends React.Component {
  //constructor(props) {
    //super(props);
    //this.state = {
      //message: "Velkommen",
      //file:    ''
    //};
    //this.handleSubmit = this.handleSubmit.bind(this);
  //}

  //handleSubmit(e) {
    //e.preventDefault(); // Cancels the event, and the POST action will not occur

    //let data = new FormData();
    //data.append('name', this.refs.name.value);
    //data.append('description', this.refs.description.value);
    //data.append('image', this.refs.image.files[0]);

    //fetch('/gallery', {
        //method: 'POST',
        //body: data,
        //headers: {
          //'X-CSRF-Token':  document.getElementsByName("csrf-token")[0].content,
          ////'Accept': 'application/json',
        //},
        //credentials: 'same-origin' //for csrf-token
    //});
  //}

  render() {
    //const button =
      //<button type="submit" onClick={this.handleSubmit}>
        //Upload
      //</button>;

    return (
      <form class="new_gallery" id="new_gallery" encType="multipart/form-data" action="/galleries" acceptCharset="UTF-8" method="post">
      <input name="utf8" type="hidden" value="&#x2713;" />
      <input type="hidden" name="authenticity_token" value="DCMwHHjARRa1p+tCf8dg2+SIq3Jp8yEAhZtmuQc8nOy0auZdY/pxlTlp1rla0AzL5z3pzsUOZpkfcYWqo/EK5g==" />
        <div class="field">
          <label for="gallery_name">Navn</label>
          <input type="text" name="gallery[name]" id="gallery_name" />
        </div>
        <div class="field">
          <label for="gallery_description">Beskerivelse</label>
          <textarea name="gallery[description]" id="gallery_description"></textarea>
        </div>
        <div class="field">
          <label for="gallery_gallery_images_attributes_0_image">Billeder</label>
          <input multiple="multiple" name="gallery_images[image][]" type="file" id="gallery_gallery_images_attributes_0_image" />
        </div>
        <div class="actions">
          <input type="submit" name="commit" value="Create Gallery" data-disable-with="Create Gallery" />
        </div>
      </form>
    )
  }
};

