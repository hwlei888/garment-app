

$(function(){
    $("#collocation_image_link button").on("click", function(){
        $("#collocation_image_link").append(`<div>
        <br>
        <input type="text" name="photo_links[]" class="collocation_photo_link" />

        </div>`)
    });

    // $("#remove_link button").on("click", function(){
    //     $("#remove_link").closest(".collocation_photo_link").remove()
    // });

    // $("#collocation_image_link").delegate("#remove_link", "click", function(){
    //     $(this).closest(".collocation_photo_link").remove()
    // });

})



