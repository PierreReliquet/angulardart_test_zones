import 'package:angular/angular.dart';
import 'dart:async';
import 'package:angular/application_factory.dart';

@Component(
    selector: "x-square",
    template: '{{square}}'
)
class Square implements ScopeAware {
  Scope scope;
  num square = 2;

  Square(){
    new Timer.periodic(new Duration(seconds: 1), (_) { 
      square *= square;
    });
  }
}

main() {
  applicationFactory()
      ..addModule(new Module()..bind(Square))
      ..run();
}

