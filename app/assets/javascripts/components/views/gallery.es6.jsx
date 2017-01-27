class Gallery extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    console.log(this.props.images);
    return (
      <div>
        <h1>{this.props.user.username}s Gallery</h1>
        <ImageList images={this.props.images} />
      </div>
    );
  }
}
