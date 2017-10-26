/**
 * Created by alex on 25.10.17.
 */


function sendSignupData() {
  let inputsSelectors = [
    {selector: "#inputName", field: 'nickname'},
    {selector: "#inputEmail", field: 'email'},
    {selector: "#inputPhone", field: 'phone'},
    {selector: "#inputPassword", field: 'password'},
    {selector: "#textArea", field: 'about'}
  ];
  let addressFields = [
    {selector: "#inputCity", field: "city" },
    {selector: "#inputStreet", field: "street" },
    {selector: "#inputHouse", field: "house" }
  ];
  let reqData = {};

  for (let obj of inputsSelectors) {
    reqData[obj.field] = $(obj.selector).val();
  }

  reqData['address'] = {};
  for (let addr of addressFields) {
    reqData['address'][addr.field] = $(addr.selector).val();
  }


  //let $avaUpload = $("#avatarUpload")[0];
  let imgB64='[image]';
  reqData['photos'] = imgB64;

  alert('request data' + JSON.stringify(reqData));

    $.ajax('http://127.0.0.1:8008/category', {
        method: 'POST', data: JSON.stringify(reqData),
          dataType: 'json'
        }).done((data) => {
                           console.log('post data: success');
                         });
  // let imgB64 = ""
  // if ($avaUpload && $avaUpload.files[0]) {
  //   let reader = new FileReader();
  //   reader.onload = function (e) {
  //
  //
  //   };
  //   reader.readAsDataURL(input.files[0]);
  // }


}

// $(document).ready(function() {
//   $(".signup-form").submit((e) => {
//     console.log('123');
//     sendSignupData();
//   });
// });
