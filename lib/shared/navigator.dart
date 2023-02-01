import 'package:states_rebuilder/states_rebuilder.dart';

import '../features/dashboard/dashboard.dart';

final navigator = RM.injectNavigator(routes: {'/': (data) => DashboardView()});
