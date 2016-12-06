class UserForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {message: "Velkommen"};
  }

  render() {

    return (
      <div>
        <p>{console.log(this.props.email)}</p>
        <output id="result" />

        <form className="new_user" id="new_user" encType="multipart/form-data" action="/users" acceptCharset="UTF-8" method="post">
          <input name="utf8" type="hidden" value="&#x2713;" />
          <input type="hidden" name="authenticity_token" value={this.props.authenticity_token} />

          <div className="field">
            <label htmlFor="user_username">Email</label>
            <input type="text" name="user[username]" id="user_name" value={this.props.email} readonly />
          </div>

          <div className="field">
            <label htmlFor="user_username">Brugernavn</label>
            <input type="text" name="user[username]" id="user_name" />
          </div>

          <div className="field">
            <label htmlFor="user_firstname">Fornavn</label>
            <input type="text" name="user[firstname]" id="user_firstname" />
          </div>

          <div className="field">
            <label htmlFor="user_lastname">Efternavn</label>
            <input type="text" name="user[lastname]" id="user_lastname" />
          </div>

          <div className="field">
            <label htmlFor="user_address">Addresse</label>
            <input type="text" name="address[lastname]" id="user_address" />
          </div>

          <div className="field">
            <label htmlFor="user_zip">Postnr.</label>
            <input type="text" name="zip[lastname]" id="user_zip" />
          </div>

          <br />
          <div className="actions">
            <input type="submit" name="commit" value="Create Gallery" data-disable-with="Gem" />
          </div>
        </form>
      </div>
    )
  }
};

