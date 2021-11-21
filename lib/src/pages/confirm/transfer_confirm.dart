// ignore_for_file: prefer_final_fields, void_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockva_app/src/bloc/confirm_bloc/confirm_bloc.dart';
import 'package:mockva_app/src/models/list_response_transfer.dart';
import 'package:mockva_app/src/pages/confirm/transfer_confirm_final.dart';
import 'package:mockva_app/src/utils/components/custom_appbar.dart';
import 'package:mockva_app/src/utils/components/custom_button.dart';
import 'package:mockva_app/src/utils/components/custom_textfield.dart';
import 'package:mockva_app/src/utils/values/colors.dart';
import 'package:mockva_app/src/utils/values/dimens.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class TransferConfirm extends StatefulWidget {
  final List<DataTransfer> dataTransfer;
  const TransferConfirm({Key key, this.dataTransfer}) : super(key: key);

  @override
  _TransferConfirmState createState() => _TransferConfirmState();
}

class _TransferConfirmState extends State<TransferConfirm> {
  ConfirmBloc _confirmBloc = ConfirmBloc();
  final TextEditingController _accountSource = TextEditingController();
  final TextEditingController _accountSourceName = TextEditingController();
  final TextEditingController _accountDestination = TextEditingController();
  final TextEditingController _accountDestinationName = TextEditingController();
  final TextEditingController _accountAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom.appBarStyleCinfirm(
          context, Dictionary.aapbarNameTf.toString()),
      body: BlocProvider(
        create: (context) => ConfirmBloc(),
        child: BlocConsumer<ConfirmBloc, ConfirmState>(
          listener: (context, state) {
            if (state is ConfirmCuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TransferConfimFinal(
                    listResponseConfirm: state.dataConfirm,
                  ),
                ),
              );
            }

            if (state is ConfirmProgress) {
              return const Center(
                  child: CircularProgressIndicator(color: primaryColor));
            }

            if (state is ConfirmFailure) {
              showDialog(
                context: context,
                builder: (context) => _validasiNotAccesConfirmt(context),
              );
            }
          },
          builder: (context, state) {
            return _buildLayoutTfConfirm(context, widget.dataTransfer);
          },
        ),
      ),
    );
    // body: _buildLayoutHome(context, widget.dataTransfer));
  }

  Widget _validasiNotAccesConfirmt(BuildContext context) {
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
              'Confirmation Not Access',
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
      actions: <Widget>[
        const SizedBox(
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

  _buildLayoutTfConfirm(BuildContext context, List<DataTransfer> dataConfirm) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(marginActivity),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
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
                    child: Text(Dictionary.acountSource),
                  ),
                ],
              ),
              const SizedBox(height: marginForm),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _accountSource
                    ..text = dataConfirm[0].accountSrcId ?? '',
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
                    child: Text(Dictionary.acountSourceName),
                  ),
                ],

                // child: Text(Dictionary.acountDestination),
              ),
              const SizedBox(height: marginForm),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _accountSourceName
                    ..text = dataConfirm[1].accountSrcName ?? '',
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
                    child: Text(Dictionary.acountDestination),
                  ),
                ],

                // child: Text(Dictionary.acountDestination),
              ),
              const SizedBox(height: marginForm),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _accountDestination
                    ..text = dataConfirm[2].accountDstId ?? '',
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
                    child: Text(Dictionary.acountDestinationName),
                  ),
                ],

                // child: Text(Dictionary.acountDestination),
              ),
              const SizedBox(height: marginForm),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _accountDestinationName
                    ..text = dataConfirm[3].accountDstName ?? '',
                  readOnly: false,
                  decoration: TextFieldCustom.textFieldGeneral(),
                ),
              ),
              const SizedBox(height: marginForm),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(Dictionary.amount),
                  ),
                ],

                // child: Text(Dictionary.acountDestination),
              ),
              const SizedBox(height: marginForm),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  controller: _accountAmount
                    ..text = dataConfirm[4].amount ?? '',
                  readOnly: false,
                  decoration: TextFieldCustom.textFieldGeneral(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                // ignore: sized_box_for_whitespace
                child: Container(
                  // width: MediaQuery.of(context).size.width,
                  width: 150,
                  child: FlatButtonPrimaryTf(
                    label: Dictionary.confrm,
                    onPress: () {
                      BlocProvider.of<ConfirmBloc>(context).add(ConfirmStarted(
                        _accountSource.text,
                        _accountDestination.text,
                        _accountAmount.text,
                        dataConfirm[0].inquiryId,
                      ));
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
      ),
    );
  }
}
