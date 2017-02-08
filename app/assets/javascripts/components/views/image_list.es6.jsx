class ImageList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        {this.props.images.map( image => (
            <ImageListItem key={image.id} image={image} />
        ))}
      </div>
    )
  }
};

