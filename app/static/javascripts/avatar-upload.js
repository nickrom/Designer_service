/**
 * Created by alex on 25.10.17.
 */

$("#avatarUpload").on("change", function(e) {
  let file = $("#avatarUpload")[0].files[0];
  console.log("upload: ", file);
  $("#avatarUploadPath").attr('placeholder', file.name);
  $("#avatarPreview").html(`<img src='${URL.createObjectURL(file)}'/>`);
});

$("#avatarUploadButton").on("click", function(e) {
  // e.preventDefault();
  $("#avatarUpload").click();
});