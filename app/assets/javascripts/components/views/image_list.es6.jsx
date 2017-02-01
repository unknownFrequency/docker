class ImageList extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <ul>
        {this.props.images.map( image => (
            <ImageListItem key={image.id} image={image} />
        ))}
      </ul>
    )
  }
};

