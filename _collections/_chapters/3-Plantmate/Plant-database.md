---
title: Plant database
pagenum: 4
---
<table>
<tr>
<td> Name </td> <td> Picture </td> <td> Notes </td>
</tr>

<tr>
<td> Anthurium 'Lilli' </td>
<td>
<a href="..\assets\images\Plant-database\Anthurium_Lilly.png" target="_blank">
<img 
    src="..\assets\images\Plant-database\Anthurium_Lilly.png"
    alt="Anthurium 'Lilli'" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</a>
</td>
<td></td>
</tr>

<tr>
<td> Anthurium 'Zizou' </td>
<td>
<img 
    src="..\assets\images\Plant-database\Anthurium_Zizou.png"
    alt="Anthurium 'Zizou'" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td></td>
</tr>

<tr>
<td> Ctenanthe Burle Marxii </td>
<td>
<img 
    src="..\assets\images\Plant-database\Ctenanthe_Burle_Marxii.png"
    alt="Ctenanthe Burle Marxii" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td> Bought as 'miniplant' in Intratuin. </td>
</tr>

<tr>
<td> Dieffenbachia 'Compacta' </td>
<td>
<img 
    src="..\assets\images\Plant-database\Dieffenbachia _Compacta.png"
    alt="Dieffenbachia 'Compacta'" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td> </td>
</tr>

<tr>
<td> Maranta Leuconeura </td>
<td>
<img 
    src="..\assets\images\Plant-database\Maranta_Leuconeura.png"
    alt="Maranta Leuconeura" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td> Bought as 'miniplant' in Intratuin. </td>
</tr>

<tr>
<td> Monstera ob. 'Monkey Mask' </td>
<td>
<img 
    src="..\assets\images\Plant-database\Monstera_ob_Monkey_Mask.png"
    alt="Monstera ob. 'Monkey Mask'" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td> Also successfully tried other Monstera types in the past. </td>
</tr>

<tr>
<td> Philodendron 'White Measure' </td>
<td>
<img 
    src="..\assets\images\Plant-database\Philodendron_White_Measure.png"
    alt="Philodendron 'White Measure'" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td> </td>
</tr>

<tr>
<td> Scindapsus pictus 'Trebie' </td>
<td>
<img 
    src="..\assets\images\Plant-database\Scindapsus_pictus_Trebie.png"
    alt="Scindapsus pictus 'Trebie'" 
    sizes="(max-width: 600px) 50px, 
            300px" 
    style="display: block; margin-left: auto; margin-right: auto; max-width: 100%;"/>
</td>
<td> Bought as 'miniplant' in Intratuin. </td>
</tr>

[image](D:\github\HA_Mate\assets\images\Plant-database\Anthurium_Lilly.png)
![a markdown image](/assets/Scindapsus_pictus_Trebie.png)

<!-- The Modal -->
<div id="myModal" class="modal">
    <span class="close">&times;</span>
    <img class="modal-content" id="img01">
</div>

<style>
    /* Modal styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.9);
    }

    .modal-content {
        margin: auto;
        display: block;
        width: 80%;
        max-width: 700px;
    }

    .close {
        position: absolute;
        top: 15px;
        right: 35px;
        color: #fff;
        font-size: 40px;
        font-weight: bold;
        transition: 0.3s;
    }

    .close:hover,
    .close:focus {
        color: #bbb;
        text-decoration: none;
        cursor: pointer;
    }
</style>

<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the modal image element
    var modalImg = document.getElementById("img01");

    // Get all images with the class "modal-img"
    var images = document.getElementsByClassName("modal-img");

    // Loop through all images and add click event
    for (var i = 0; i < images.length; i++) {
        images[i].onclick = function() {
            modal.style.display = "block";
            modalImg.src = this.src;
        }
    }

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() { 
        modal.style.display = "none";
    }
</script>
