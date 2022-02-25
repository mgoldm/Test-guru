document.addEventListener('turbolinks:load', function () {
    const control = document.querySelector('.select')

    let ruleSelect = control.querySelector('#badge_rule_type')
    let categorySelect = control.querySelector('#badge_type_title')
    let levelSelect = control.querySelector('#test_level')
    let testSelect = control.querySelector('#badge_param')


    if (control) {
        categorySelect.disabled = true
        levelSelect.disabled = true
        testSelect.disabled = true
        ruleSelect.addEventListener('input', selectRule)
    }

    function selectRule() {
        if (ruleSelect.value === 'Category') {
            categorySelect.disabled = false
            levelSelect.disabled = true
            testSelect.disabled = true
        } else if (ruleSelect.value === 'Level') {
            categorySelect.disabled = true
            levelSelect.disabled = false
            testSelect.disabled = true
        } else if (ruleSelect.value === 'First Test') {
            categorySelect.disabled = true
            levelSelect.disabled = true
            testSelect.disabled = false
        }
    }
})