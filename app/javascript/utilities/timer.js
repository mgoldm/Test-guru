document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.timer')
    const testTimer = control.querySelector('.timer-value')

    if (testTimer.dataset.timer != 0) {
        setInterval(minusSecond, 1000)
    } else {
        testTimer.style.display = 'none'
    }

    function minusSecond() {
        testTimer.dataset.timer = testTimer.dataset.timer - 1
        testTimer.innerHTML = testTimer.dataset.timer
        checkTimer()
    }

    function checkTimer() {
        if (testTimer.dataset.timer == 0) {
            document.querySelector('form').submit()
        }
    }
})
