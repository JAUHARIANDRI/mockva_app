// ignore_for_file: non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockva_app/src/bloc/detail_account_bloc/detail_account_bloc.dart';
import 'package:mockva_app/src/models/list_response_detail_account.dart';
import 'package:mockva_app/src/utils/components/custom_appbar.dart';
import 'package:mockva_app/src/utils/components/custom_textfield.dart';
import 'package:mockva_app/src/utils/values/dimens.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({Key key}) : super(key: key);

  @override
  _DashboardHomeState createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  final TextEditingController _AccounrMember = TextEditingController();
  final TextEditingController _Name = TextEditingController();
  final TextEditingController _Balance = TextEditingController();
  DetailAccountBloc _detailAccountBloc = DetailAccountBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom.appBarStyle1(
          context, Dictionary.aapbarNameHome.toString()),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<DetailAccountBloc>(
                create: (context) =>
                    _detailAccountBloc..add(DetailAccountStarted())),
          ],
          // ignore: missing_required_param
          child: BlocConsumer<DetailAccountBloc, DetailAccountState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is DetailAccountLoaded) {
                return _buildLayoutHome(context, state.response);
              } else {
                return Container();
              }
            },
          )),
    );
  }

  _buildLayoutHome(BuildContext context, ListDetailAccount model) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(marginActivity),
        height: MediaQuery.of(context).size.height,
        // child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: marginForm),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(Dictionary.acountMember),
            ),
            const SizedBox(height: marginForm),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: _AccounrMember..text = model.id ?? '',
                readOnly: true,
                decoration: TextFieldCustom.textFieldGeneral(),
              ),
            ),
            const SizedBox(height: marginForm),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(Dictionary.customerName),
            ),
            const SizedBox(height: marginForm),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: _Name..text = model.username ?? '',
                readOnly: true,
                decoration: TextFieldCustom.textFieldGeneral(),
              ),
            ),
            const SizedBox(height: marginForm),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(Dictionary.balance),
            ),
            const SizedBox(height: marginForm),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: _Balance..text = model.balance.toString() ?? '',
                readOnly: true,
                decoration: TextFieldCustom.textFieldGeneral(),
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
