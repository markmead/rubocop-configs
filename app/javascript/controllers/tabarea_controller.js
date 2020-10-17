import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['input']

  tab(event) {
    if (event.key !== 'Tab') return

    event.preventDefault()

    let newCaretPosition = this.getCaretPosition() + '  '.length

    this.inputTarget.value =
      this.inputTarget.value.substring(0, this.getCaretPosition()) +
      '  ' +
      this.inputTarget.value.substring(this.getCaretPosition(), this.inputTarget.value.length)

    this.setCaretPosition(newCaretPosition)
  }

  setCaretPosition(position) {
    this.inputTarget.selectionStart = position
    this.inputTarget.selectionEnd = position
    this.inputTarget.focus()
  }

  getCaretPosition() {
    return this.inputTarget.selectionStart
  }
}
