class User extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <h2>{this.props.user.username}</h2>
        <ul>
          <li><img src={this.props.user.thumb} /></li>
          <li>Fornavn: <strong>{this.props.user.firstname}</strong></li>
          <li>Efternavn: <strong>{this.props.user.lastname}</strong></li>
          <li>Postnr: <strong>{this.props.user.zip}</strong></li>
          <li>Oprettet: <strong>{this.props.user.created_at}</strong></li>
        </ul>
      </div>
    )
  }
};

