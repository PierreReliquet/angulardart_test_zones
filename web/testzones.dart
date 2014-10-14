import 'package:angular/angular.dart';
import 'dart:async';
import 'package:angular/application_factory.dart';

@Component(
    selector: "x-square",
    template: '{{foo.square}}',
    publishAs: 'foo'
)
class Square implements ScopeAware {
  Scope scope;
  num square = 0;

  Square(){
    new Timer.periodic(new Duration(seconds: 1), (_) { 
      square = square * square;
    });
  }
}

main() {
  applicationFactory()
      ..addModule(new Module()..bind(Square))
      ..run();
}

