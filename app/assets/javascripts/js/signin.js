document.getElementById('btnSignIn').addEventListener('click', function () {
  var formFields = {
    username: document.getElementById('usernameModal').value,
    password: document.getElementById('passwordModal').value
  }

  fetchApi('POST', '/login', formFields, function (response, statusCode) {
    console.log(response)
    if (statusCode >= 200 && statusCode < 300) {
      // saveToken(response.api_token)
      redirect('/timeline.html')
    }
    else {
      alert(response.error)
      redirect('/timeline.html')
    }
  })
})
