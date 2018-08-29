// $.ajax({
//     url: "/",
//     dataType: "json",
//     method: "GET",
//     success: function(data){
//         // console.log(data)
//         $(".testimg").attr("src", data.url)
//     }
// })
$(document).ready(
    function(){
        console.log("Ready!")
        $(".image").each(
            function(index, elem){
                console.log($(elem).attr("image_id"))
                $.ajax({
                    url: "/",
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