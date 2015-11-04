var wsUri = "ws://",
    wssUri = "wss://",
    socketendpoint = "/service",
    wsconn = getWSUri(),
    websocket = new WebSocket(wsconn);

websocket.onerror = function(evt) { onError(evt) };

function getWSUri() {
    var url = window.location.href;
    //console.log(url);
    var arr = url.split("/");
    //console.log(arr[0]);
    //console.log(arr[2]);
    if (arr[0].indexOf("https") == 0) {
        url = wssUri + arr[2] + "/" + arr[3] + socketendpoint;
        //url = wssUri + "127.0.0.1/" + arr[3] + socketendpoint;
    } else {
        url = wsUri + arr[2] + "/" + arr[3] + socketendpoint;
        //url = wsUri + "127.0.0.1/" + arr[3] + socketendpoint;
    }
    //console.log('Uri ' + url);
    return url;
}

function onError(evt) {
    writeToScreen('ERROR:  ' + evt.data);
}

websocket.onopen = function(evt) { onOpen(evt) };

function writeToScreen(message) {
  /*var msgOutput =  AdfPage.PAGE.findComponentByAbsoluteId("messageMonitor");
  msgOutput.setValue(message);*/
  console.log(message);
}

function onOpen() {
    writeToScreen("Connected to " + wsconn);
}

websocket.onmessage = function(evt) { onMessage(evt) };

function onMessage(evt) {
    console.log("received: " + evt.data);
    writeToScreen(evt.data);
    handleMessage(evt.data);
}

function handleMessage(message) {
  /*var msgOutput =  AdfPage.PAGE.findComponentByAbsoluteId("messageMonitor");    
  if (message.indexOf('IMAGE=')>-1) {
   /* an image was selected 
    var image = message.substring(6);
    msgOutput.setValue('an image was selected: '+image)
    showPopup(image);
   }*/
   var component = AdfPage.PAGE.findComponentByAbsoluteId("pgl2");
   AdfCustomEvent.queue(component,"customEvent",
                {payload:message}, true);                     
   console.log(message);
}
function sendText(json) {
    websocket.send(json);
}