$(document).on('turbolinks:load', function() {
    $('.close').click(function() {
        $(this).slideToggle();
    });

    if ($('.user-search-container').html().trim() === "") {
        $('.user-search-container').append(
            "<h3>No New Users Nearby!</h3>"
        )
    }

    var modal = document.getElementById('myModal');

    var expiration_date = new Date();
    var cookie_string = '';

    expiration_date.setFullYear(expiration_date.getFullYear() + 1);
    cookie_string = "visitedHaven=true; expires=" + expiration_date.toUTCString();
    
    $(".modal-close").click(function() {
        $("#myModal").toggle();
        document.cookie = cookie_string;
    })
    
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
            document.cookie = cookie_string;
        }
    }
});

