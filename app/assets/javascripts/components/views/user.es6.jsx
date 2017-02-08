class User extends React.Component {
  constructor(props) {
    super(props);

  }

  render() {
    console.log(this.props.user);
    return (
      <div>
        <h2>{this.props.user.username}</h2>
        <ClickableImage
          src={this.props.user.thumb}
          href={`/users/${this.props.user.id}`} />

        <UserInfo user={this.props.user} />

        <Votes
          user_id={this.props.user.id}
          likes={this.props.user.likes}
          dislikes={this.props.user.dislikes} />
      </div>
    );
  }
};

