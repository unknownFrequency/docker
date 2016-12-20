class UserForm extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let action = `/user/{this.props.user_id}`
    let name   = "edit_user"

    return (
      <div>
        <p>{console.log(this.props.email)}</p>
        <output id="result" />

        <form className={name} id={name} encType="multipart/form-data"
            action="/users/7" acceptCharset="UTF-8" method="post">
          <input type="hidden" name="_method" value="patch" />
          <input name="utf8" type="hidden" value="&#x2713;" />
          <input type="hidden" name="authenticity_token" value={this.props.authenticity_token} />

          <div className="field">
            <label htmlFor="user_email">Email</label>
            <input type="text" name="user[email]" id="user_email" value={this.props.email} readonly />
          </div>

          <div className="field">
            <label htmlFor="user_username">Brugernavn</label>
            <input type="text" name="user[username]" id="user_username" />
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
            <input type="text" name="user[address]" id="user_address" />
          </div>

          <div className="field">
            <label htmlFor="user_zip">Postnr.</label>
            <input type="text" name="user[zip]" id="user_zip" />
          </div>

          <br />
          <div className="actions">
            <input type="submit" name="commit" value="Gem" data-disable-with="Gem" />
          </div>
        </form>
      </div>
    )
  }
};

