import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:user/feature/movie_details/presentation/movie_details_screen.dart';
import 'package:user/feature/myticket/presentation/my_tickets_screen.dart';
import 'package:user/mainpage.dart';
import 'package:user/route/route_contants.dart';

import '../feature/home/data/model/movie.dart';
import '../feature/home/presentation/home_page_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteConstants.HOME_PAGE,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (BuildContext context, GoRouterState state, Widget child) {
            return MainPage(child: child);
          },
          routes: <RouteBase>[
            GoRoute(
                path: RouteConstants.HOME_PAGE,
                builder: (context, state) => const HomePage(),
                routes: [

                ]),
            GoRoute(
                path: RouteConstants.MOVIE_DETAILS_PAGE,
                builder: (context, state) {
                  Movie movie = state.extra as Movie;
                  return MovieDetails(movie);
                }),
            GoRoute(
                path: RouteConstants.MY_TICKETS_ROUTE,
                builder: (context, state) => const MyTicketsScreen()
            ),
          ])
    ]);
