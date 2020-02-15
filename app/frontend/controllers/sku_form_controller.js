import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "template", "add_item" ]

  add_sku(evt) {
    evt.preventDefault()

    let content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.add_itemTarget.insertAdjacentHTML('beforebegin', content)
  }
}
