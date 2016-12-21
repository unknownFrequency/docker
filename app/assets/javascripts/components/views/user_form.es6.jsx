class UserForm extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <output id="result" />

        <form className={this.props.name} id={this.props.name} encType="multipart/form-data"
            action={this.props.action} acceptCharset="UTF-8" method="post">

          <input type="hidden" name="_method" defaultValue={this.props.method} />
          <input type="hidden" name="utf8" defaultValue="&#x2713;" />
          <input type="hidden" name="authenticity_token" value={this.props.authenticity_token} />

          <div className="field">
            <label htmlFor="user_email">Email</label>
            <input type="text" name="user[email]" id="user_email" value={this.props.user.email} readOnly />
          </div>

          <div className="field">
            <label htmlFor="user_username">Brugernavn</label>
            <input type="text" name="user[username]" id="user_username" defaultValue={this.props.user.username} />
          </div>

          <div className="field">
            <label htmlFor="user_firstname">Fornavn</label>
            <input type="text" name="user[firstname]" id="user_firstname" defaultValue={this.props.user.firstname} />
          </div>

          <div className="field">
            <label htmlFor="user_lastname">Efternavn</label>
            <input type="text" name="user[lastname]" id="user_lastname" defaultValue={this.props.user.lastname} />
          </div>

          <div className="field">
            <label htmlFor="user_address">Addresse</label>
            <input type="text" name="user[address]" id="user_address" defaultValue={this.props.user.address} />
          </div>

          <div className="field">
            <label htmlFor="user_zip">Postnr.</label>
            <input type="text" name="user[zip]" id="user_zip" defaultValue={this.props.user.zip} />
          </div>

          <br />
          <div className="actions">
            <input type="submit" name="commit" defaultValue="Gem" data-disable-with="Gem" />
          </div>
        </form>
      </div>
    )
  }
};

