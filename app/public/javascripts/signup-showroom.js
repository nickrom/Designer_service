function sendSignupData() {
    let inputsSelectors = [
        {selector: "#inputName", field: 'nickname'},
        {selector: "#inputEmail", field: 'email'},
        {selector: "#inputPhone", field: 'phone'},
        {selector: "#inputPassword", field: 'password'},
        {selector: "#textArea", field: 'about'}
    ];
    let addressFields = [
        {selector: "#inputCity", field: "city"},
        {selector: "#inputStreet", field: "street"},
        {selector: "#inputHouse", field: "house"}
    ];
    let reqData = {};

    for (let obj of inputsSelectors) {
        reqData[obj.field] = $(obj.selector).val();
    }

    reqData['address'] = {};
    for (let addr of addressFields) {
        reqData['address'][addr.field] = $(addr.selector).val();
    }


    let imgB64 = '[image]';
    reqData['photos'] = imgB64;

    alert('request data' + JSON.stringify(reqData));

    $.ajax('/showroom', {
            method: 'POST', data: JSON.stringify(reqData)
    }).done(() => {
        console.log('post data: success');
    });
}
