// ignore_for_file: prefer_final_fields, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockva_app/src/bloc/history_bloc/history_bloc.dart';
import 'package:mockva_app/src/models/list_history_tf.dart';
import 'package:mockva_app/src/utils/components/custom_appbar.dart';
import 'package:mockva_app/src/utils/values/dimens.dart';
import 'package:mockva_app/src/utils/values/strings.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  HistoryBloc _historyBloc = HistoryBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom.appBarStyle(context, Dictionary.history.toString()),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<HistoryBloc>(
              create: (context) => _historyBloc..add(HistoryStarted()),
            ),
          ],
          child: BlocConsumer<HistoryBloc, HistoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is HistoryLoaded) {
                return _buildLayoutHistory(state.response);
              } else if (state is HistoryFailure) {
                return Container();
              } else {
                return Container();
              }
            },
          )),
    );
  }

  Widget _buildLayoutHistory(List<DataHistory> dataHistory) =>
      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(marginActivity),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 1,
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Date : " +
                                      dataHistory[index].transactionTimestamp,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ), // Padding(
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    "Amount : " +
                                        dataHistory[index].amount.toString(),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Ref : " + dataHistory[index].clientRef,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    "Destination : " +
                                        dataHistory[index].accountDstId,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: dataHistory.length,
          ),
        ),
      );
}
