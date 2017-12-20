$(document).on('turbolinks:load', function() {
    $('.close').click(function() {
        $(this).slideToggle();
    });

    if ($('.user-search-container').html().trim() === "") {
        $('.user-search-container').append(
            "<h3>No New Users Nearby!</h3>"
        )
    }
});