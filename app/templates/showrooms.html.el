<!DOCTYPE html>
<html>
<head>
    <meta charset="utf8">
    <title>Шоурумы</title>
    <link rel="stylesheet" href="/stylesheets/style.css">
    <link rel="stylesheet" href="/stylesheets/bootstrap.min.css">
</head>
<body>
<div class="header">
    <nav class="navbar navbar-default no-margin-bottom">
        <div class="container-fluid header-container">
            <div class="navbar-header">
                <button type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                        class="navbar-toggle collapsed"><span class="sr-only">Toggle navigation</span><span
                        class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a href="#" class="navbar-brand">Магазин одежды</a>
                <form role="search" class="navbar-form navbar-left">
                    <div class="form-group"><input type="text" placeholder="Поиск одежды, шоурума или дизайнера ..."
                                                   class="input-400 form-control"></div>
                    <button type="submit" class="btn btn-default">Поиск</button>
                </form>
            </div><!--ul.nav.navbar-nav.navbar-right.padding-right//li
  //a.basket(href='#')
    //span
    //| Корзина--><!--.profileInfo--><!--  span.name--><!--    a(href='#') #{userName}--><!--  span.role-->
            <!--    | #{profileRole}-->
            <ul class="nav navbar-nav profile">
                <li class="dropdown"><a href="#" data-toggle="dropdown" role="button" aria-expanded="false"
                                        class="porfile dropdown-toggle">
                    <div class="profileInfo"><span class="user-name">Romanov Nikita</span><br><span class="user-role">дизайнер</span>
                    </div>
                    <div class="avatar-wrapper"><img src="/images/romanov.jpg"><span class="caret"></span></div>
                </a>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="#">Моя страница</a></li>
                        <li><a href="#">Редактировать</a></li>
                        <li><a href="#">Выйти</a></li><!--li.divider-->


                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <nav class="navbar navbar-default navbar-1">
        <div id="bs-example-navbar-collapse-1" class="collapse navbar-collapse header-container">
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="/" class="nav-link nav-link1">Каталог одежды</a></li>
                <li class="nav-item active"><a href="/showroom" class="nav-link nav-link1">Шоурумы</a><span
                        class="sr-only">(current)</span></li>
                <li class="nav-item"><a href="/designer" class="nav-link nav-link1">Дизайнеры</a></li>
            </ul>
        </div>
    </nav>
</div>
<div class="content">
<table class="table" id="tblUsers">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
        </table>
</div>
<script type="text/javascript" src="/javascripts/libs/popper.js"></script>
<script type="text/javascript" src="/javascripts/libs/jquery.min.js"></script>
<script type="text/javascript" src="/javascripts/libs/bootstrap.js"></script>
<script type="text/javascript" src="/javascripts/common.js"></script>
<script>
            fetch('/get_showrooms').then(resp => {
                resp.json().then(data => {

                    function createCell(tr, txt){
                        tr.insertCell().appendChild(
                        document.createTextNode(txt));
                        }

                    let tblUsers = document.getElementById('tblUsers');

                    for(let i=0;i<data.showrooms.length;i++){
                                        var tr = tblUsers.insertRow();
                                        createCell(tr, data.showrooms[i].id);
                                        createCell(tr, data.showrooms[i].name);
                                        createCell(tr, data.showrooms[i].email);
                                    }
                });
            });
</script>
</body>
</html>