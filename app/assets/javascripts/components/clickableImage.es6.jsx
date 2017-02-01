class ClickableImage extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <a href={this.props.href}>
        <img src={this.props.src} />
      </a>
    );
  }
}

ClickableImage.propTypes = {
  src: React.PropTypes.string,
  href: React.PropTypes.string
};
