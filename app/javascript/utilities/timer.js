document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.timer')
    let testTimer = control.querySelector('.timer-value')

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
            window.location.href = window.location.href + '/user_result'
        }
    }
})
