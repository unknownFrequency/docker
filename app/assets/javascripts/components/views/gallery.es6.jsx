class Gallery extends React.Component {
  constructor(props) {
    super(props);
  }
  render() {
    console.log(this.props.images);
    console.log(this.props.user);
    return (
        <h1>Gallery</h1>
    );
  }
}
