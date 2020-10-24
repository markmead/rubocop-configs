import { Controller } from 'stimulus'

export default class extends Controller {
  hide() {
    this.element.setAttribute('hidden', true)
  }
}
