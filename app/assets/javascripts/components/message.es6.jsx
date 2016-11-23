class Message extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    return (
      <div>
        <div>{this.props.message}</div>
      </div>
    );
  }
}

Message.propTypes = {
  message: React.PropTypes.string
};
