
$(document).ready(
    function() {
        dataCollector.info();
        dataCollector.sendEvent();
    });

function send_contact(){
    dataCollector.sendContact($("#email").val());
    alert('Dados enviados');
    $("#email").val('');
    return false;
}