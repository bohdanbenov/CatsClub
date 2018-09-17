$(document).ready(
    function(){
        console.log("Ready!")
        $(".image").each(
            function(index, elem){
                console.log($(elem).attr("image_id"))
                $.ajax({
                    url: "/images/" + $(elem).attr("image_id"),
                    dataType: "json",
                    method: "GET",
                    success: function(data){
                        $(elem).attr("src", data.url)
                    }
                })
            }
        )
    }
)