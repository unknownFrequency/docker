// same as const image = props.image;
class ImageListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <li>
        <img src={this.props.image.image.thumb.url} />
        <br />
        <p>{this.props.image.created_at}</p>
      </li>
    );
  }

};
