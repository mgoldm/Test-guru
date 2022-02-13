document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.password-validation')
    const password = control.querySelector('#user_password')
    const passwordConfirmation = control.querySelector('#user_password_confirmation')

    let submitButton = control.parentNode.querySelector('input[type="submit"]')
    let correctIcon = control.querySelector('.octicon-check-circle')
    let errorIcon = control.querySelector('.octicon-x-circle')

    correctIcon.style.display = 'none'
    errorIcon.style.display = 'none'

    if (control) {
        submitButton.disabled = true
        control.addEventListener('input', validationPassword)
    }


    function validationPassword() {
        if (password.value === passwordConfirmation.value) {
            submitButton.disabled = false
            correctIcon.style.display = 'block'
        } else if (password.value === "" || passwordConfirmation.value === "") {
            submitButton.disabled = true
        } else {
            submitButton.disabled = true
            errorIcon.style.display = 'block'
        }
    }
})
