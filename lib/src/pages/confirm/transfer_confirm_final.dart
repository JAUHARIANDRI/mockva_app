// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mockva_app/src/models/list_response_confirm.dart';
import 'package:mockva_app/src/utils/components/custom_appbar.dart';
import 'package:mockva_app/src/utils/values/strings.dart';

class TransferConfimFinal extends StatefulWidget {
  final ListResponseConfirm listResponseConfirm;
  const TransferConfimFinal({Key key, this.listResponseConfirm})
      : super(key: key);

  @override
  _TransferConfimFinalState createState() => _TransferConfimFinalState();
}

class _TransferConfimFinalState extends State<TransferConfimFinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom.appBarStyleCinfirm(
          context, Dictionary.aapbarNameTf.toString()),
      body: _layoutConfirmFinal(widget.listResponseConfirm),
    );
  }

  Widget _layoutConfirmFinal(listResponseConfirm) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60, top: 30),
          child: Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("Account Source",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text(listResponseConfirm[0]),
                SizedBox(
                  height: 15,
                ),
                Text("Account Source Name",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text(listResponseConfirm[1]),
                SizedBox(
                  height: 10,
                ),
                Text("Account Source",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text(listResponseConfirm[2]),
                SizedBox(
                  height: 15,
                ),
                Text("Account Destination",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text("Account Source"),
                SizedBox(
                  height: 15,
                ),
                Text("Amount",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text("Account Source"),
                SizedBox(
                  height: 15,
                ),
                Text("Reference Number",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text("Account Source"),
                SizedBox(
                  height: 15,
                ),
                Text("Transaction Timestamp",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text("Account Source"),
                SizedBox(
                  height: 15,
                ),
                Text("Status",
                    style: TextStyle(fontSize: 12, color: Colors.blue)),
                Text("Account Source"),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
    // return Container(
    //   margin: const EdgeInsets.only(left: 60.0, top: 40),
    //   child: Container(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Row(
    //           // mainAxisAlignment: MainAxisAlignment.start,
    //           // crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: const [
    //                 Text("Account Source",
    //                     style: TextStyle(fontSize: 12, color: Colors.blue)),
    //                 Text("Account Source"),
    //               ],
    //             ),
    //             // SizedBox(
    //             //   height: 10,
    //             // ),
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 10,
    //         ),
    //         Row(
    //           // mainAxisAlignment: MainAxisAlignment.start,
    //           children: const [
    //             Text("Account Source"),
    //             SizedBox(
    //               height: 10,
    //             ),
    //           ],
    //         ),
    //         Row(
    //           // mainAxisAlignment: MainAxisAlignment.start,
    //           children: const [
    //             Text("Account Source Home"),
    //             SizedBox(
    //               height: 10,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
