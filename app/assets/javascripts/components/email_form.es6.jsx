// app/assets/javascripts/components/email_form.js.jsx
// this.state is the only thing that can change internally in this class.
// props are untouchables from above (eg. super() which is the controller that calls this class)
class EmailForm extends React.Component {

  constructor(props) {
    super(props);
    // So i can use this.props?
    this.state = {message: "Velkommen"};
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  // extract to fetch.es6.jsx?
  validate() {
    var pattern = /[@]+/;
    if(pattern.exec(this.refs.email.value)) {
        return true;
    }
  }

  handleSubmit(e) {
    e.preventDefault(); // Cancels the event, and the POST action will not occur

    const data = {
      data: {email: this.refs.email.value}
    };

    const isValid = this.validate();
    if (isValid) {
      post('/send_login', data) // from components/fetch.es6.jsx
        .then( json => {
          this.setState({
            message: 'Token genereret og sendt til ' +  this.refs.email.value
          });
        });
    } else {
      this.setState({
        message: this.refs.email.value + ' er ikke korrekt format'
      });
    }
  }

  render() {
    const button =
      <button type="submit" onClick={this.handleSubmit}>
          Email mit login link
      </button>;

    return (
      <form>
        <h1><Message message={this.state.message} /></h1>
        <div><input placeholder="Indtast email" ref="email" /></div>
        <br />
        <div>{button}</div>
      </form>
    )
  }
};

