// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockva_app/src/bloc/transfer_bloc/transfer_bloc.dart';
import 'package:mockva_app/src/pages/confirm/transfer_confirm.dart';
import 'package:mockva_app/src/pages/confirm/transfer_confirm_final.dart';
import 'package:mockva_app/src/utils/components/custom_appbar.dart';
import 'package:mockva_app/src/utils/components/custom_button.dart';
import 'package:mockva_app/src/utils/components/custom_textfield.dart';
import 'package:mockva_app/src/utils/values/colors.dart';
import 'package:mockva_app/src/utils/values/dimens.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key key}) : super(key: key);

  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TransferBloc _transferBloc = TransferBloc();

  final TextEditingController _AccounrMember = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBarCustom.appBarStyle(context, Dictionary.aapbarNameTf.toString()),
      body: BlocProvider(
        create: (context) => TransferBloc(),
        child: BlocConsumer<TransferBloc, TransferState>(
          listener: (context, state) {
            if (state is TransferLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TransferConfirm(
                    dataTransfer: state.response,
                  ),
                ),
              );
            }

            if (state is TransferFailure) {
              showDialog(
                context: context,
                builder: (context) =>
                    _validasiNotAccessTransfer(context, state.message),
              );
            }
          },
          builder: (context, state) {
            if (state is TransferProgress) {
              return const Center(
                  child: CircularProgressIndicator(color: primaryColor));
            } else {
              return _buildLayoutTf(context);
            }
          },
        ),
      ),
    );
  }

  _buildLayoutTf(BuildContext context) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(Dictionary.acountDestination),
                ),
              ],
            ),
            const SizedBox(height: marginForm),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _AccounrMember,
                readOnly: false,
                decoration: TextFieldCustom.textFieldGeneral(),
              ),
            ),
            const SizedBox(height: marginBig),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Text(Dictionary.amount),
                ),
              ],
            ),
            const SizedBox(height: marginForm),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: _Name..text = model.username ?? '',
                readOnly: false,
                decoration: TextFieldCustom.textFieldGeneral(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 150,
                child: FlatButtonPrimaryTf(
                  label: Dictionary.transfer,
                  onPress: () {
                    BlocProvider.of<TransferBloc>(context)
                        .add(TransferStarted());
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

  Widget _validasiNotAccessTransfer(BuildContext context, message) {
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(
            width: 10.0,
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Account Not Found',
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
      actions: <Widget>[
        SizedBox(
          width: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              // ignore: sized_box_for_whitespace
              child: Container(
                width: 100,
                child: FlatButtontfNotAccess(
                  label: Dictionary.konfirm,
                  onPress: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
