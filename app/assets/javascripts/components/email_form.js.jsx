// app/assets/javascripts/components/email_form.js.jsx

var EmailForm = React.createClass({
  handleClick() {
    var email = this.refs.email.value;
    console.log('The name value is ' + name + 'the description value is ' + description);
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

