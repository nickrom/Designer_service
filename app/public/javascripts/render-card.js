function renderCard(vars, fields) {
    let infoItems = fields.map(
        field => `<li><span>${field.label}</span>: ${field.text}</li>`
    );

    let html = "";

    html += `<div class="product-item card card-default">`;
    html += `<div class="card-body"><div class="card-img-wrapper"><img src="${vars.photo}"></div>`;
    html += `<div class="product-content">`;
    html += `<h3><a href="#">${vars.title}</a></h3>`;
    html += `<div class="product-info">`;
    html += vars.hasOwnProperty('price') ? `<div class="price">${vars.price} руб.</div>` : '';
    html += `<ul class="product-desc-list">`;
    html += infoItems.join('');
    html += `</ul></div></div></div></div>`;

    return html;
}