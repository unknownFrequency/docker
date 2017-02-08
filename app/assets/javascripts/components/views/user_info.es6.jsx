class UserInfo extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <ul>
        <li>Fornavn: <strong>{this.props.user.firstname}</strong></li>
        <li>Efternavn: <strong>{this.props.user.lastname}</strong></li>
        <li>Addresse:<strong>{this.props.user.address}</strong></li>
        <li>Postnr: <strong>{this.props.user.zip}</strong></li>
        <li>Oprettet: <strong>{this.props.user.created_at}</strong></li>
      </ul>
    );
  }
}
