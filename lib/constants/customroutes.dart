//Custom Page Route has no animation
import 'package:flutter/material.dart';

class CustomSimplePageRoute extends PageRouteBuilder {
  final Widget page;

  CustomSimplePageRoute({required this.page,required String routeName})
      : super(
          settings: RouteSettings(name: routeName), // set name here
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              // opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 500),
        );
}
