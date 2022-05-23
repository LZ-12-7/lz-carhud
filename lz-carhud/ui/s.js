$(() => {
    window.addEventListener('message', function(event){
        let e = event.data

        if (e.action == "InVeh") {
            $('.container').fadeIn(100);
            $('.progresskmh').fadeIn(100)
            $('.progressBarKmh').css("width", (e.kmh) + "");
            $('.fuel-l').text(Math.round(e.fuel) + "L");
            $(".velocidad").text(Math.round(e.kmh) + "");
        } else if (e.action == "outVeh") {
            $('.container').fadeOut()
            $('.progresskmh').fadeOut(100)
        };
        
        if (e.action === "cintotrue") {
            $('#seat-belt').show(100)
        } else if (e.action === "cintofalse"){
            $('#seat-belt').hide(100)
        };

    });
});