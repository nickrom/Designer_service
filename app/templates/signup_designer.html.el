<!DOCTYPE html>
<html>

<head>
    <meta charset="utf8">
    <title>Регистрация</title>
    <link rel="stylesheet" href="stylesheets/style.css">
    <link rel="stylesheet" href="stylesheets/bootstrap.min.css">
</head>

<body>
    <div class="header">
        <nav class="navbar navbar-default no-margin-bottom">
            <div class="container-fluid header-container">
                <div class="navbar-header"><button type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" class="navbar-toggle collapsed"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                    <a href="#" class="navbar-brand">Магазин одежды</a>
                    <form role="search" class="navbar-form navbar-left">
                        <div class="form-group"><input type="text" placeholder="Поиск одежды, шоурума или дизайнера ..." class="input-400 form-control"></div><button type="submit" class="btn btn-default">Поиск</button></form>
                </div>
                <!--ul.nav.navbar-nav.navbar-right.padding-right//li
  //a.basket(href='#')
    //span
    //| Корзина-->
                <!--.profileInfo-->
                <!--  span.name-->
                <!--    a(href='#') #{userName}-->
                <!--  span.role-->
                <!--    | #{profileRole}-->
            </div>
        </nav>
        <nav class="navbar navbar-default navbar-1">
            <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse header-container">
                <ul class="nav navbar-nav">
                    <li class="nav-item"><a href="/" class="nav-link nav-link1">Каталог одежды</a></li>
                    <li class="nav-item"><a href="/showroom" class="nav-link nav-link1">Шоурумы</a></li>
                    <li class="nav-item"><a href="/designer" class="nav-link nav-link1">Дизайнеры</a></li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="content">
        <form onsubmit="sendSignupData()" class="form-horizontal signup-form">
            <fieldset>
                <legend>Signup designer</legend>
                <div class="form-group"><label for="inputEmail" class="col-lg-2 control-label">Nickname</label>
                    <div class="col-lg-10"><input id="inputNickname" type="text" placeholder="Nickname" class="form-control"></div>
                </div>
                <div class="form-group"><label for="inputEmail" class="col-lg-2 control-label">Email</label>
                    <div class="col-lg-10"><input id="inputEmail" type="text" placeholder="Email" class="form-control"></div>
                </div>
                <div class="form-group"><label for="inputPassword" class="col-lg-2 control-label">Password</label>
                    <div class="col-lg-10"><input id="inputPassword" type="password" placeholder="Password" class="form-control"></div>
                </div>
                <div class="form-group"><label for="inputName" class="col-lg-2 control-label">Name</label>
                    <div class="col-lg-10"><input id="inputName" type="text" placeholder="Name" class="form-control"></div>
                </div>
                <div class="form-group"><label for="inputPhone" class="col-lg-2 control-label">Phone</label>
                    <div class="col-lg-10"><input id="inputPhone" type="text" placeholder="Phone" class="form-control"></div>
                </div>
                <div class="form-group"><label for="textArea" class="col-lg-2 control-label">About</label>
                    <div class="col-lg-10"><textarea id="textArea" rows="3" class="form-control"></textarea></div>
                </div>
                <div class="form-group"><label for="inputCity" class="col-lg-2 control-label">City</label>
                    <div class="col-lg-10"><input id="inputCity" type="text" placeholder="City" class="form-control"></div>
                </div>
                <div class="form-group"><label for="inputStreet" class="col-lg-2 control-label">Street</label>
                    <div class="col-lg-10"><input id="inputStreet" type="text" placeholder="Street" class="form-control"></div>
                </div>
                <div class="form-group"><label for="inputHouse" class="col-lg-2 control-label">House</label>
                    <div class="col-lg-10"><input id="inputHouse" type="text" placeholder="House" class="form-control"></div>
                </div>
                <div class="form-group"><label for="avatarUploadPath" class="col-lg-2 control-label">Photo</label>
                    <div class="col-lg-8"><input id="avatarUploadPath" type="text" placeholder="No image chosen" disabled class="form-control"></div>
                    <div class="col-lg-2"><button id="avatarUploadButton" type="button" class="btn btn-default">Open ..</button></div><input id="avatarUpload" type="file">
                    <div id="avatarPreview"></div>
                </div>
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <!--button.btn.btn-default(type='reset') Cancel--><button id="submitButton" type="submit" class="btn btn-primary">Sign up</button></div>
                </div>
            </fieldset>
        </form>
        <div id="source-button" style="display: none;" class="btn btn-primary btn-xs">
            <>
        </div>
    </div>
    <script type="text/javascript" src="javascripts/libs/popper.js"></script>
    <script type="text/javascript" src="javascripts/libs/jquery.min.js"></script>
    <script type="text/javascript" src="javascripts/libs/bootstrap.js"></script>
    <script type="text/javascript" src="javascripts/common.js"></script>
    <script type="text/javascript" src="javascripts/signup-designer.js"></script>
    <script type="text/javascript" src="javascripts/avatar-upload.js"></script>
</body>

</html>