/*
addEventListener("direct-upload:initialize", event => {
  const { target, detail } = event
  const { id, file } = detail
  target.insertAdjacentHTML("beforebegin", `
    <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
      <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
      <span class="direct-upload__filename">${file.name}</span>
    </div>
  `)
})
 
addEventListener("direct-upload:start", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.remove("direct-upload--pending")
})
 
addEventListener("direct-upload:progress", event => {
  const { id, progress } = event.detail
  const progressElement = document.getElementById(`direct-upload-progress-${id}`)
  progressElement.style.width = `${progress}%`
})
 
addEventListener("direct-upload:error", event => {
  event.preventDefault()
  const { id, error } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--error")
  element.setAttribute("title", error)
})
 
addEventListener("direct-upload:end", event => {
  const { id } = event.detail
  const element = document.getElementById(`direct-upload-${id}`)
  element.classList.add("direct-upload--complete")
})*/

"use strict";

addEventListener("direct-upload:initialize", function (event) {
  var target = event.target;
  var detail = event.detail;
  var id = detail.id;
  var file = detail.file;

  target.insertAdjacentHTML("beforebegin", "\n    <div id=\"direct-upload-" + id + "\" class=\"direct-upload direct-upload--pending\">\n      <div id=\"direct-upload-progress-" + id + "\" class=\"direct-upload__progress\" style=\"width: 0%\"></div>\n      <span class=\"direct-upload__filename\">" + file.name + "</span>\n    </div>\n  ");
});

addEventListener("direct-upload:start", function (event) {
  var id = event.detail.id;

  var element = document.getElementById("direct-upload-" + id);
  element.classList.remove("direct-upload--pending");
});

addEventListener("direct-upload:progress", function (event) {
  var _event$detail = event.detail;
  var id = _event$detail.id;
  var progress = _event$detail.progress;

  var progressElement = document.getElementById("direct-upload-progress-" + id);
  progressElement.style.width = progress + "%";
});

addEventListener("direct-upload:error", function (event) {
  event.preventDefault();
  var _event$detail2 = event.detail;
  var id = _event$detail2.id;
  var error = _event$detail2.error;

  var element = document.getElementById("direct-upload-" + id);
  element.classList.add("direct-upload--error");
  element.setAttribute("title", error);
});

addEventListener("direct-upload:end", function (event) {
  var id = event.detail.id;

  var element = document.getElementById("direct-upload-" + id);
  element.classList.add("direct-upload--complete");
});
