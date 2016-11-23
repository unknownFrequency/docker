// app/assets/javascripts/components/email_form.js.jsx
// this.state is the only thing that can change internally in this class.
// props are untouchables from above (eg. super() which is the controller that calls this class)
class EmailForm extends React.Component {

  constructor(props) {
    super(props);

    this.state = { msg: this.props.msg }
    // So i can use this.props?
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault(); // Cancels the event, and the POST action will not occur

    const data = {
      data: {email: this.refs.email.value}
    };

    post('/send_login', data); // from components/fetch.es6.jsx
  }

  render() {
    const button =
      <button type="submit" onClick={this.handleSubmit}>
          Email mit login link
      </button>;

    return (
      <form>
        <div>
          <input placeholder="Indtast email" ref="email" />
        </div>
        {button}
      </form>
    )
  }
};

EmailForm.propTypes = {
  //email: React.PropTypes.string.isRequired
};
