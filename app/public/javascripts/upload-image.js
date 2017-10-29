;(function() {
    let $submit = $("form.form-horizontal .form-group button[type='submit']");

    $(document)
        .ready(function() {
            $submit.attr("disabled", true);

            let img = new Image();
            img.src = "/images/avatars/no-avatar.png";
            img.onload = () => {
                let canvas = $(".js-image-preview")[0];
                canvas.getContext('2d').drawImage(img, 0, 0, canvas.width, canvas.height);
                $submit.attr("disabled", false);
            }
        });

    $(".js-image-upload")
        .on("click", function() {
            $(".js-image-file").click();
        });

    $(".js-image-file")
        .on("change", function(evt) {
            $submit.attr("disabled", true);

            let file = evt.target.files[0];
            let reader = new FileReader();
            reader.readAsDataURL(file);

            reader.onload = (e) => {
                let img = new Image();
                img.setAttribute('crossOrigin', 'anonymous');
                img.src = e.target.result;

                img.onload = () => {
                    let canvas = $(".js-image-preview")[0];
                    let ctx = canvas.getContext('2d');
                    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
                    $submit.attr("disabled", false);
                }
            }
        });
}());
