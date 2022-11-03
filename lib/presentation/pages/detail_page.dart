// ignore_for_file: prefer_const_constructors, deprecated_member_use, must_be_immutable


import 'package:flutter/material.dart';
import 'package:load_api/data/model/data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = 'detail-page-route';
  DetailPage({super.key, required this.dataModel});
  DataModel dataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 240,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        dataModel.thumbnail.toString(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      SizedBox(
                        width: double.infinity,
                        child: customHeadTitle(
                            title: dataModel.title.toString(), size: 20),
                      ),

                      //platform
                      customHeadTitle(
                          title: dataModel.platforms.toString(), size: 14),
                      //game description

                      Text(
                        'Game Description',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),

                      customHeadTitle(
                          title: dataModel.description.toString(), size: 14),

                      //steps to get it
                      Text(
                        'Steps to get it ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      customHeadTitle(
                          title: dataModel.instructions.toString(), size: 14),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: MaterialButton(
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              height: 75,
                              color: Colors.purpleAccent,
                              onPressed: () {
                                launch(dataModel.gamerpowerUrl.toString());
                              },
                              child: Center(
                                child: Text(
                                  'Open in Gamepower',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: MaterialButton(
                              padding: EdgeInsets.all(14),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              height: 75,
                              color: Colors.blueAccent,
                              onPressed: () {
                                launch(dataModel.openGiveawayUrl!);
                              },
                              child: Center(
                                child: Text(
                                  'Get the Game',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  customHeadTitle({required String title, required double size}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: size,
        ),
      ),
    );
  }
}
