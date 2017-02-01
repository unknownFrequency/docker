function _fetch(url, options) {
  return fetch(url, options)
    .then( response => {
      return response.json();
    })
    .catch( err => {
      console.log('Noget gik galt med din forspørgelse');
      console.log(err);
    });
}

function get(url, options={}) {
  const defaultOptions = {
    headers: {
      'Accept':       'application/json',
      'Content-Type': 'application/json'
    }
  };
  return _fetch(url, Object.assign({}, defaultOptions, options));
}

function post(url, data, options) {
  const defaultOptions = {
    method: 'POST',
    body: JSON.stringify(data),
    headers: {
      'X-CSRF-Token':  document.getElementsByName("csrf-token")[0].content,
      'Accept':       'application/json',
      'Content-Type': 'application/json'
    },
    credentials: 'same-origin' //for csrf-token
  };
  return _fetch(url, Object.assign({}, defaultOptions, options));
}


//function patch(url, data, options) {
  //const _options = Object.assign({}, options, {method: 'PATCH'});
  //return post(url, data, options)
//}

    //$.ajax({
      //url:  '/send_login',
      //type: 'POST',
      //data: { data: {email: this.refs.email.value} },
      //success: (response) => { "Email blev sendt" }
    //})
