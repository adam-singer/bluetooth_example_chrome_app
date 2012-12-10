import 'dart:html';
import 'package:js/js.dart' as js;

void main() {
  js.scoped(() {
    var chrome = js.context.chrome;
    print("bluetooth = chrome");
  });
  
  print("finished main");
}