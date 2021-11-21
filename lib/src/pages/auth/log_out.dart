// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockva_app/src/bloc/delete_bloc/delete_bloc.dart';
import 'package:mockva_app/src/pages/auth/login_page.dart';
import 'package:mockva_app/src/utils/components/custom_appbar.dart';
import 'package:mockva_app/src/utils/components/custom_button.dart';
import 'package:mockva_app/src/utils/values/colors.dart';
import 'package:mockva_app/src/utils/values/dimens.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key key}) : super(key: key);

  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  DeleteBloc _deleteBloc = DeleteBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarCustom.appBarStyle(context, Dictionary.aabarLogout.toString()),
      body: BlocProvider(
        create: (context) => DeleteBloc(),
        child: BlocConsumer<DeleteBloc, DeleteState>(
          // ignore: void_checks
          listener: (context, state) {
            if (state is DeleteSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false);
            }

            if (state is DeleteProgress) {
              return const Center(
                  child: CircularProgressIndicator(color: primaryColor));
            }
          },
          builder: (context, state) {
            if (state is DeleteProgress) {
              return const Center(
                  child: CircularProgressIndicator(color: primaryColor));
            } else {
              return _buildLayoutLogout(context);
            }
          },
        ),
      ),
    );
  }

  _buildLayoutLogout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(marginActivity),
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: marginForm),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 150,
                child: FlatButtonPrimaryTf(
                  label: Dictionary.logout,
                  onPress: () {
                    BlocProvider.of<DeleteBloc>(context).add(DeleteStarted());
                  },
                ),
              ),
            ),
            const SizedBox(height: marginForm),
            const SizedBox(height: marginForm),
            const SizedBox(height: marginActivity),
          ],
        ),
      ),
    );
  }
}
