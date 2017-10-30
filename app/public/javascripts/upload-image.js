;(function() {
    let $submit = $("form.form-horizontal .form-group button[type='submit']");
    let setDefaultAvatar = function () {
        $submit.attr("disabled", true);

        let img = new Image();
        img.src = "/images/";
        img.src += ($(".js-image-preview").data("type") === "designer") ? "no-avatar.png" : "no-place.png";
        img.onload = () => {
            let canvas = $(".js-image-preview")[0];
            canvas.getContext('2d').drawImage(img, 0, 0, img.width, img.height,
                0, 0, canvas.width, canvas.height);
            $submit.attr("disabled", false);
        }
    };

    $(document).ready(function() {
       setDefaultAvatar();
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
                    let ratio_x = 1, ratio_y = 1, x0 = 0, y0 = 0;
                    if(img.width < img.height) {
                        ratio_x = img.width / img.height;
                        x0 = (1 - ratio_x) * canvas.width / 2;
                    } else {
                        ratio_y = img.height / img.width;
                        y0 = (1 - ratio_y) * canvas.height / 2;
                    }

                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                    // ctx.drawImage(img, 0, 0, canvas.width * ratio, canvas.height);
                    ctx.drawImage(img, x0, y0, ratio_x * canvas.width, ratio_y * canvas.height);
                    $submit.attr("disabled", false);
                    $(".form-group .avatar-wrapper > .fa.fa-times")
                    $(".form-group .avatar-wrapper > .fa.fa-times")
                        .addClass("visible")
                        .on("click", function() {
                            ctx.clearRect(0, 0, canvas.width, canvas.height);
                            setDefaultAvatar();
                            $(this).off();
                            $(".form-group .avatar-wrapper > .fa.fa-times").removeClass("visible");
                        });
                }
            }
        });
}());
