// app/assets/javascripts/components/email_form.js.jsx

var EmailForm = React.createClass({
  handleClick() {
    var email = this.refs.email.value;

    $.ajax({
      url:  '/api/v1/send_login',
      type: 'POST',
      data: { email: email },
      success: (response) => { console.log("Email blev sendt") }
    })
  },

  render() {
    return (
      <div>
        <input ref="email" placeholder="Indtast email" />
        <button onClick={this.handleClick}>Send login</button>
      </div>
    )
  }
});

