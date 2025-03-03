part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const NEVBAR = _Paths.NEVBAR;
  static const SPLASH = _Paths.SPLASH;
  static const ON_BOARDING = _Paths.ON_BOARDING;
  static const AUTH = _Paths.AUTH;
  static const SETTING = _Paths.SETTING;
  static const EXPLORE = _Paths.EXPLORE;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const NEVBAR = '/nevbar';
  static const SPLASH = '/splash';
  static const ON_BOARDING = '/on-boarding';
  static const AUTH = '/auth';
  static const SETTING = '/setting';
  static const EXPLORE = '/explore';
}
