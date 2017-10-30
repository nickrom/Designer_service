var Clothes = (function() {
    let Get = function(url) {
        let fp = fetch(url)
            .then(resp => resp.json())
            .then(function (data) {
                console.log('data: ', data);

                let cards = [];

                for (let item of data.items) {
                    let fields = [
                        {label: 'Описание', text: item.about},
                        {label: 'Дизайнер', text: item.designer},
                        {label: 'Шоурум', text: item.showroom},
                        {label: 'Размер', text: item.sizes.join(', ')}
                    ];

                    let card = renderCard({
                        photo: '/images/clothes/' + item.photos[0],
                        title: item.name,
                        price: item.des_price
                    }, fields);

                    cards.push(card);
                }
                $("#productItems").html(cards.join(""));
            });

        return fp;
    };

    return {Get};
}());