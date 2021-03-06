document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.select')

    let ruleSelect = control.querySelector('#badge_rule_type')
    let paramSelect = control.querySelector('#badge_param')

    let categoryShow = document.querySelector('.show.category')
    let testShow = document.querySelector('.show.tests')

    categoryShow.style.display = 'none'
    testShow.style.display = 'none'

    if (control) {
        ruleSelect.addEventListener('input', selectRule)
    }

    function selectRule() {
        if (ruleSelect.value === 'category') {
            testShow.style.display = 'none'
            categoryShow.style.display = 'block'
        } else if (ruleSelect.value === 'level') {
            testShow.style.display = 'none'
            categoryShow.style.display = 'none'
        } else if (ruleSelect.value === 'firstTest') {
            testShow.style.display = 'block'
            categoryShow.style.display = 'none'
        }
    }
})
