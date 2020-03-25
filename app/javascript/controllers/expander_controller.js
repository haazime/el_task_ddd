import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['content']

  connect() {
    this.update()
  }

  toggle(e) {
    e.preventDefault()

    if (this.isExpanded) {
      this.data.set('isExpanded', 'n')
    } else {
      this.data.set('isExpanded', 'y')
    }

    this.update()
  }

  update() {
    if (this.isExpanded) {
      this.contentTarget.style.display = 'block'
    } else {
      this.contentTarget.style.display = 'none'
    }
  }

  get isExpanded() {
    return this.data.get('isExpanded') == 'y';
  }
}
