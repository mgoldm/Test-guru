document.addEventListener('turbolinks:load', function () {
    let control = document.querySelector('.sort-by-title')

    control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
    let table = document.querySelector('table')
    let rows = table.querySelectorAll('tr')
    let sortedRows = []

    for (let i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
    }

    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
        sortedTable.appendChild(sortedRows[i])
    }
    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
    let testTitle1 = row1.querySelector('td').textContent
    let testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) {
        return -1
    }
    if (testTitle1 > testTitle2) {
        return 1
    }
    return 0
}
