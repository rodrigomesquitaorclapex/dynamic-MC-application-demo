# APEX Dynamic Image Generation
This app is a demo on how to create a Dynamic Image

## Installation ##
Import *f119.sql* file to your workspace.
run membership_card.sql to create the required table

## Usage ##
1. Run the app and click on add data.
2. Select an value from the select list to generate the membership card
3. Click Download to download the membership card image


```sql
    function generateCard(id) {
    var canvas = document.getElementById("canvas"),
        ctx = canvas.getContext("2d");
        canvas.width = $("#img_membership_card").width();
        canvas.crossOrigin = "Anonymous";
        canvas.height = $("#img_membership_card").height();
    
        apex.server.process(
            "LOAD_DATA",
            {
                f01: id,
                pageItems: "#P2_NAME"
            },
            {
                success: function (pData) {
                    let membershipNumber,
                        name,
                        expirationDate,
                        image,
                        img = new Image();
                    img.onload = function () {
                        ctx.drawImage(this, 450, 20, 102, 100);
                    };
    
                    image = pData.output[0].image;
                    membershipNumber = pData.output[0].membershipNumber;
                    name = pData.output[0].name;
                    expirationDate = pData.output[0].expirationDate;
    
                    img.src = "data:image/png;base64," + image;
    
                    ctx.clearRect(0, 0, canvas.width, canvas.height);
                    ctx.drawImage($("#img_membership_card").get(0), 0, 0);
                    
                    ctx.font = "18pt monospace";
                    ctx.fillStyle = "#ffffff";
                    ctx.fillText(membershipNumber, 40, 200);
    
                    ctx.font = "12pt Arial";
                    ctx.fillStyle = "#000000";
                    ctx.fillText(name, 120, 245);
                    ctx.fillText(expirationDate, 120, 280);                
    
                },
            }
        );
    }
    function downloadCard() {
        var link = document.createElement("a");
        link.download = "membership_card.jpg";
        link.href = document.getElementById("canvas").toDataURL();
        link.click();
    }


```
