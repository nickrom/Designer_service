function sendSignupData() {
  let inputsSelectors = [
    {selector: "#inputNickname", field: 'nickname'},
    {selector: "#inputEmail", field: 'email'},
    {selector: "#inputName", field: 'name'},
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

  let imgB64='[image]';
  reqData['photos'] = imgB64;

  fetch('/designer', {
      method: 'POST',
      body: JSON.stringify(reqData),
      redirect: 'follow'}
  ).then(resp => {
      window.location.href = resp.url;
  });

}
