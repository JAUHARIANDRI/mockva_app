import 'package:flutter/material.dart';
import 'package:mockva_app/src/pages/auth/history_page.dart';
import 'package:mockva_app/src/pages/auth/log_out.dart';
import 'package:mockva_app/src/pages/auth/transfer_page.dart';
import 'package:mockva_app/src/pages/dashboard/dashboard_page.dart';
import 'package:mockva_app/src/utils/components/custom_toast.dart';
import 'package:mockva_app/src/utils/values/colors.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class DashboardNavigation extends StatefulWidget {
  final int indexInitial;

  const DashboardNavigation({Key key, this.indexInitial}) : super(key: key);
  @override
  _DashboardNavigationState createState() => _DashboardNavigationState();
}

class _DashboardNavigationState extends State<DashboardNavigation> {
  int _selectedIndex = 0;

  final _layoutPage = [
    const DashboardHome(),
    const TransferPage(),
    const HistoryPage(),
    const LogoutPage(),
  ];

  @override
  void initState() {
    if (widget.indexInitial != null) {
      _selectedIndex = widget.indexInitial;
    }
    super.initState();
  }

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  DateTime currentBackPressTime;
  Future<bool> doubleTapToExit() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ToastFlush.info(context: context, message: Dictionary.warningDoubleTap);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: doubleTapToExit,
      child: Scaffold(
        body: _layoutPage.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.transfer_within_a_station,
                  size: 30,
                ),
                title: Text('Transfer')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.history,
                  size: 30,
                ),
                title: Text('History')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                title: Text('Account')),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onTabItem,
        ),
      ),
    );
  }
}
