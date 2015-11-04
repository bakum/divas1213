//function closedWin() {
//    confirm("close ?");
//    return false; /* which will not allow to close the window */
//}
//if(window.addEventListener) {
//     window.addEventListener("close", closedWin, false);
//}
//
//window.onclose = closedWin;

//$(window).on('beforeunload', domystuff);
//window.addEventListener('beforeunload',
//                           function (){performUnloadEvent()},false) 
//                           
//function performUnloadEvent(){
//  //note that af:document must have clientComponent="true" set
//  //for JavaScript to access the component object
//  var eventSource = AdfPage.PAGE.findComponentByAbsoluteId('pgl2');
//  //var x and y are dummy variables obviously needed to keep the page
//  //alive for as long it takes to send the custom event to the server
//  var x = AdfCustomEvent.queue(eventSource,
//                               "customEvent",
//                               {payload:'logoff'},false);
//  //replace args:'noargs' with key:value pairs if your event needs to
//  //pass arguments and values to the server side managed bean.
//
//  var y = 0;
//
//} 


function domystuff(e){
    var str = "Я не понял";
    //alert(str);
    return str;
//    if(confirm('Are you nuts? Do you really want to leave me?')){
//		return 'OK, Good Bye then';
//	}
//	else {
//		e = e || event;
//		if(e.preventDefault){e.preventDefault();}
//		e.returnValue = false;
//		return 'I said, "Are you nuts? Do you really want to leave me?"';
//	}
//    return "Я не понял???";
//    var ur = window.location.href,
//        killdpoint = "/sessionkillservlet",
//        arr = ur.split("/");
//    //console.log(ur);        
//    //console.log(arr[0]);
//    //console.log(arr[2]);
//    ur = arr[0]+"//" + arr[2] + "/" + arr[3] + killdpoint;
//    //if (arr[0].indexOf("https") == 0) {
//   //     ur = wssUri + arr[2] + "/" + arr[3] + killdpoint;
//        //url = wssUri + "127.0.0.1/" + arr[3] + socketendpoint;
//   // } else {
//   //     ur = wsUri + arr[2] + "/" + arr[3] + killdpoint;
//        //url = wsUri + "127.0.0.1/" + arr[3] + socketendpoint;
//   // }
//    //event.cancel();
//    //var component = AdfPage.PAGE.findComponentByAbsoluteId("pgl2");
//    //AdfCustomEvent.queue(component,"customEvent",{payload:'logoff'}, true);
//    //$get("/faces/home.jsf");
//    if (event.target == null) {
//        $.get(ur);
//    }
}

function Growl(ttl,mess, stl){
  $.growl(
        { title: ttl, 
          style: stl,
          size: "large",
          message: mess,
          duration: 6200
        }
    );
} 

/*
function clientMethodCall() {                   
    var component = AdfPage.PAGE.findComponentByAbsoluteId("pglKontragId");
    AdfCustomEvent.queue(component, "onSetKontragId", 
        null, true);                     
    event.cancel();                    
}       */

function enforcePreventUserInput(evt){            
    var popup = AdfPage.PAGE.findComponentByAbsoluteId('pLong');
    if (popup != null){
        AdfPage.PAGE.addBusyStateListener(popup,handleBusyState);        
        evt.preventUserInput();
    }
}

function handleBusyState(evt){
var popup = AdfPage.PAGE.findComponentByAbsoluteId('pLong');        
    if(popup!=null){
        if (evt.isBusy()){
            popup.show();   
        }
    else if (popup.isPopupVisible())
        {
            popup.hide();
            AdfPage.PAGE.removeBusyStateListener(popup,handleBusyState);
        }
    }
}