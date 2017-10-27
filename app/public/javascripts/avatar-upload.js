$("#avatarUpload").on("change", function(e) {
  let file = $("#avatarUpload")[0].files[0];
  console.log("upload: ", file);
  $("#avatarUploadPath").attr('placeholder', file.name);
  $("#avatarPreview").html(`<img id="avatarImg" src='${URL.createObjectURL(file)}'/>`);
});

$("#avatarUploadButton").on("click", function(e) {
  $("#avatarUpload").click();
});