import 'dart:html';
import 'package:js/js.dart' as js;
// https://goo.gl/NKhvZ
void main() {
  
  js.scoped(() {    
    void permissionsCallback(var result) {
      print("permissions = $result");
      for (int i = 0; i < result.permissions.length; i++) {
        print(result.permissions[i]);
      }
    };
     
    var chrome = js.context.chrome;
    print("chrome = ${chrome.runtime.id}");  
    
    var permissionsCallbackHandler = new js.Callback.many(permissionsCallback);
    js.context.permissionsCallbackHandler = permissionsCallbackHandler;
    
    chrome.permissions.getAll(js.context.permissionsCallbackHandler);
  });
  
  js.scoped(() {
    void isAvailableCallback(var isAvailable) {
      print("bluetooth.isAvailable = $isAvailable");
    };
    
    var bluetooth = js.context.chrome.bluetooth;
    js.context.scoped_isAvailableCallback = new js.Callback.many(isAvailableCallback);
    bluetooth.isAvailable(js.context.scoped_isAvailableCallback);
  });
  
  print("finished main");
}