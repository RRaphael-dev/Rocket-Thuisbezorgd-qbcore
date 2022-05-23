$(document).ready(function() {
    $(".sushi").hide();
    $(".pizza").hide();
    $(".pasta").hide();
    $(".selectreen").hide();
    window.addEventListener('message', function(event) {
        switch (event.data.action) {
            case "open":
                OpenThuis()
                break;
            case "close":
                CloseThuis()
                break;
        }
    });

    $(document).keyup(function(e) {
        if (e.key === "Escape") { // escape key maps to keycode `27`
            $(".container").fadeOut();
            $(".sushi").hide();
            $(".pizza").hide();
            $(".pasta").hide();
            $(".selectreen").hide();
            $.post('http://Rocket-Thuisbezorgd/close', JSON.stringify({}))
        }
    });

    function OpenThuis() {
        $(".container").fadeIn();
        $(".selectreen").fadeIn();
    }

    function CloseThuis() {
        $(".container").fadeOut();
        $(".sushi").hide();
        $(".pizza").hide();
        $(".pasta").hide();
        $(".selectreen").hide();
    }


});