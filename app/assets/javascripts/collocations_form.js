

$(function(){
    $("#collocation_image_link button").on("click", function(){
        $("#collocation_image_link").append(`<div>
        <br>
        <input type="text" name="photo_links[]" />

        </div>`)
    });

    $("#remove_link button").on("click", function(){
        $("#remove_link").closest("#photo_links_").remove()
    });

})



