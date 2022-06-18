import { Controller } from "@hotwired/stimulus";
import Rails from "@rails/ujs";

import Sortable from "sortablejs";

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      group: "shared",
      animation: 150,
      onEnd: this.end.bind(this),
    });
  }

  end(event) {
    let id = event.item.dataset.id;
    let data = new FormData();
    data.append("position", event.newIndex + 1);

    // console.log("this: ", this.element.dataset.dragUrl.replace(":id", id));
    // console.log("data: ", data);

    Rails.ajax({
      url: this.element.dataset.dragUrl.replace(":id", id),
      type: "PATCH",
      data: data,
    });
  }
}
