var file = document.getElementById('upload-button');

var fsClient = filestack.init('AwjEmOSsTKuJMBQBVgE7fz');
function openPicker() {
    fsClient.pick({
        fromSources:["local_file_system","imagesearch","facebook","instagram","dropbox"]
    }).then(function(response) {
        // declare this function to handle response
        handleFilestack(response);
    });
}