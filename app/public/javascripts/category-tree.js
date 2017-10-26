/**
 * Created by alex on 26.10.17.
 */

const apiServHost = "http://localhost:8008";

function createTree($place, tree) {
  if (!$place instanceof jQuery) {
    throw new Error("Invalid 1st argument. It must be instance of jQuery");
  }

  let queue = [];
  let $parent = $place,
    $icon = null,
    tmp,
    next;

  let elem = tree;
  let start = true;

  while (start || queue.length !== 0) {
    if (queue.length > 0) {
      next = queue.shift();
      $parent = next.jQuery;
      elem = next.elem;
      if (start) start = false;
    }
    if (!start) {
      $icon = $("<a><span class=\"fa category\"></span></a>");
      $parent.prepend($icon);
    }
    if (elem.hasOwnProperty("categories") && elem.categories.length > 0) {
      if ($icon) {
        $icon.children("span").addClass("has-child");
      }
      tmp = $("<ul></ul>").appendTo($parent);
      for (let child of elem["categories"]) {
        let $child = $("<li></li>").html(`<a href='#'>${child.name}</a>`).data("id", child.id);
        tmp.append($child);
        queue.push({ elem: child, jQuery: $child });
      }
    }
  }
}

$(document).ready(function() {
  $.ajax('http://127.0.0.1:8008/category', {
      dataType: 'json'
    }).done((data) => {
    let struct = JSON.parse(data);

    console.log("GET "+ apiServHost + "/category - success");
    console.log("Response data: ", struct);
    createTree($('.tree'), struct);

    $(".fa.category").on("click", e => {
      let $obj = $(e.target);
      $obj.toggleClass("opened");
      $obj.parent().siblings("ul").toggleClass("opened");
    });

  });
});
