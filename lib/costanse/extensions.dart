import 'package:flutter/widgets.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this , rootNavigator: true).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this, rootNavigator: true).pushReplacementNamed(routeName, arguments: arguments , );
  }

  Future<dynamic> pushNamedAndRemoveUntil(
      String routeName, RoutePredicate predicate, {Object? arguments}) {
    return Navigator.of(this ,rootNavigator: true).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}