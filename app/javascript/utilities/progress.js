document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.progress-bar')
    if (control) {
        control.style.width = control.dataset.progress + '%'
    }
})
