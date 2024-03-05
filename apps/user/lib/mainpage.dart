import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user/route/route_contants.dart';

class MainPage extends StatelessWidget {

  final Widget child;

  MainPage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: "My Shows"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "Profile")
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int idx) => _onItemTapped(idx, context),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(RouteConstants.HOME_PAGE)) {
      return 0;
    }
    if (location.startsWith(RouteConstants.MY_TICKETS_ROUTE)) {
      return 1;
    }
    if (location.startsWith(RouteConstants.PROFILE)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go(RouteConstants.HOME_PAGE);
      case 1:
        GoRouter.of(context).go(RouteConstants.MY_TICKETS_ROUTE);
      case 2:
        GoRouter.of(context).go(RouteConstants.PROFILE);
    }
  }
}
