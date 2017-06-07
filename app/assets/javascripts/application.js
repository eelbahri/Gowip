// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree
//= require bootstrap-sprockets
//= require turbolinks



$(document).on('turbolinks:load', function() {

    $('.cube').each(function() {
        $(this).css("background-color", getRandomColor());
    });

    function getRandomColor() {
        var color = '#10';
        for (var i = 0; i < 6; i++) {
            color += (Math.random() * 8 | 0).toString(8);
        }
        return color;
    }

    $('#sendMessage').submit(function(event) {
        event.preventDefault();
        var room = $("#content").data("room");
        var content = $("#content").val();
        var data = {'room': room, 'content': content};

        $.ajax({
            url: "/messages/new",
            type: "POST",
            data: data,
            dataType: "json",
            success: function(data){
                alert(done);
            },error: function(ts) {
                console.log(ts.responseText);
            }
        })

        console.log(content);
        $("#content").val("");


    });


})
