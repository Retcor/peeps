/**
 * Created by danbaker on 9/13/14.
 */
$(function() {
    // ======= List.JS Required Information =============
    // List.JS needs this information to know what to search.
    // valueNames are the class names of td tags
    options = {
        valueNames: [ 'employeeId', 'firstName', 'lastName', 'address1', 'address2',
            'city', 'state', 'zip', 'phone', 'startDate' ]
    };

    var userList = new List('peeps', options);

    $("#searchOptions").change(function() {
        var selected = $("#searchOptions").val();

        if (selected == "employeeId") {
            options = {
                valueNames: [ 'employeeId' ]
            };
        } else if (selected == 'firstName') {
            options = {
                valueNames: [ 'firstName' ]
            };
        } else if (selected == 'lastName') {
            options = {
                valueNames: [ 'lastName' ]
            };
        } else if (selected == 'startDate') {
            options = {
                valueNames: [ 'startDate' ]
            };
        } else if (selected == "all") {
            options = {
                valueNames: [ 'employeeId', 'firstName', 'lastName', 'address1', 'address2',
                    'city', 'state', 'zip', 'phone', 'startDate' ]
            };
        }

        userList = new List('peeps', options);
    });

    // ==================================================

    $("#search").keyup(function() {
        if($(this).val() != '') {
            $("#searchOptions").attr("disabled", true);
        } else {
            $("#searchOptions").attr("disabled", false);
        }
    });

    $('input[id^="edit_"]').click(function() {
        var id = $(this).attr("id");
        var number = id.split("_");
        $("#update_" + number[1]).attr("hidden", false);
        $("#tdUpdate_" + number[1]).attr("hidden", false);
        $("#edit_" + number[1]).attr("hidden", true);
        $("#tdEdit_" + number[1]).attr("hidden", true);

        var firstNameInput = $("#firstName_" + number[1]);
        var lastNameInput = $("#lastName_" + number[1]);
        var address1Input = $("#address1_" + number[1]);
        var address2Input = $("#address2_" + number[1]);
        var cityInput = $("#city_" + number[1]);
        var stateInput = $("#state_" + number[1]);
        var zipInput = $("#zip_" + number[1]);
        var phoneInput = $("#phone_" + number[1]);

        firstNameInput
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        lastNameInput
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        address1Input
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        address2Input
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        cityInput
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        stateInput
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        zipInput
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
        phoneInput
            .removeClass('baseInput')
            .addClass('editInput')
            .attr('readonly',false);
    });
    $('input[id^="update_"]').click(function() {
        var id = $(this).attr("id");
        var number = id.split("_");
        $("#update_" + number[1]).attr("hidden", true);
        $("#tdUpdate_" + number[1]).attr("hidden", true);
        $("#edit_" + number[1]).attr("hidden", false);
        $("#tdEdit_" + number[1]).attr("hidden", false);

        var firstNameInput = $("#firstName_" + number[1]);
        var lastNameInput = $("#lastName_" + number[1]);
        var address1Input = $("#address1_" + number[1]);
        var address2Input = $("#address2_" + number[1]);
        var cityInput = $("#city_" + number[1]);
        var stateInput = $("#state_" + number[1]);
        var zipInput = $("#zip_" + number[1]);
        var phoneInput = $("#phone_" + number[1]);

        firstNameInput
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        lastNameInput
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        address1Input
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        address2Input
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        cityInput
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        stateInput
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        zipInput
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);
        phoneInput
            .removeClass('editInput')
            .addClass('baseInput')
            .attr('readonly',true);

        var data = 'employeeId='+ $("#employeeId_" + number[1]).val()
            + '&firstName=' + firstNameInput.val()
            + '&lastName=' + lastNameInput.val()
            + '&address1=' + address1Input.val()
            + '&address2=' + address2Input.val()
            + '&city=' + cityInput.val()
            + '&state=' + stateInput.val()
            + '&zip=' + zipInput.val()
            + '&phone=' + phoneInput.val();

        $.ajax({
            type: 'POST',
            url: '/editPeep?',
            data: data,
            dataType: "text",
            success: function() {
                // Maybe display a success notification?
            },
            error: function() {
                alert("ERROR: Update Failed.");
            }
        });
    })

    $('textarea').autosize();
});
