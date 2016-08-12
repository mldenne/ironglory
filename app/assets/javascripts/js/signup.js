document.getElementById('btnSignUp').addEventListener('click', function () {

  var formFields = {
    firstName: document.getElementById('firstNameModal').value,
    lastName: document.getElementById('lastNameModal').value,
    email: document.getElementById('emailSignUpModal').value,
    username: document.getElementById('usernameModalSignUp').value,
    password: document.getElementById('passwordModalSignUp').value
  }

  fetchApi('POST','/users', formFields, function (response, statusCode) {
    console.log(response)

    if (statusCode >= 200 && statusCode < 300) {
      // saveToken(response.api_token)
      location.reload()
    }
    else {
      alert(response)
      location.reload()
    }
  })
})
