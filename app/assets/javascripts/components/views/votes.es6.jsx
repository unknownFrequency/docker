class Votes extends React.Component {
  constructor(props) {
    super(props);
  }


  render() {
    return (
      <div>
        <a className="vote" rel="nofollow" data-method="put" href={`/users/${this.props.user_id}/like`}>
          <p>Like&nbsp;&nbsp;&nbsp;</p>
        </a>
        <a className="vote" rel="nofollow" data-method="put" href={`/users/${this.props.user_id}/dislike`}>
          <p>Dislike</p>
        </a>
        <p className="votes"><span className="green">Anbefalet</span> af <strong>{this.props.likes}</strong> brugere</p>
        <p className="votes"><span className="red">Fraraades</span> af <strong>{this.props.dislikes}</strong> brugere</p>
      </div>
    );
  }
}
