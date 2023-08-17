import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:daily_todos/model/all_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<MainScreenModel, GlobalModel>(
      builder: (context, model, globalModel, _) {
        model.setContext(context, globalModel: globalModel);
        return Container(
          decoration: model.logic.getBackground(globalModel),
          child: Scaffold(
            key: model.scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Daily '),
              // leading: ElevatedButton(onPressed: () {}, child: child),
            ),
            body: SafeArea(
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Opacity(
                        opacity: 1.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(62, 8, 50, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: InkWell(
                                        child: Hero(
                                          tag: 'avatar',
                                          child: Container(
                                            width: 60,
                                            height: 60,
                                            child: CircleAvatar(
                                              child: ClipOval(
                                                child:
                                                    model.logic.getAvatarWidget(),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // TODO
                                  // Expanded(child: Container(alignment: Alignment.centerRight, child: ,))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
