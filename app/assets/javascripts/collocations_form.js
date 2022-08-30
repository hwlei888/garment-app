

$(function(){
    $("#collocation_image_link button").on("click", function(){
        $("#collocation_image_link").append(
        `<div>
            <br>
        <input type="text" name="photo_links[]" />

        </div>`)
    })
})



