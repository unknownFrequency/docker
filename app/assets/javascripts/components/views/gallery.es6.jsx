class Gallery extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    console.log(this.props.images);
    return (
        <h1>Gallery</h1>
    );
  }
}
