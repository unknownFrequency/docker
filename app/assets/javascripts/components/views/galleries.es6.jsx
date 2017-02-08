class Galleries extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h1>Video Gallery</h1>
        <h3><a href="/galleries/new">Opret nyt Galleri</a></h3>
        <div>
          <Gallery images={this.props.images} username={this.props.user.username} />
        </div>
      </div>
    );
  }
}
