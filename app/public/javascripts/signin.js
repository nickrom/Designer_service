$("#signinForm").on("submit", function(evt) {
    evt.preventDefault();
    let inputsSelectors = [
        {selector: "#inputEmail", field: 'email'},
        {selector: "#inputPassword", field: 'password'},
    ];

    let reqData = {};

    for (let obj of inputsSelectors) {
        reqData[obj.field] = $(obj.selector).val();
    }

    fetch('/signin', {
        method: 'POST',
        body: JSON.stringify(reqData),
        redirect: 'follow'}
    ).then(resp => {
            window.location.href = resp.url;
    });

});


function sendSignupData() {

}

