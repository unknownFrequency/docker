// app/assets/javascripts/components/email_form.js.jsx

var EmailForm = React.createClass({
  handleClick() {
    var email = this.refs.email.value;

    $.ajax({
      url:  '/send_login',
      type: 'POST',
      data: { data: {email: email} },
      success: (response) => { "Email blev sendt" }
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

