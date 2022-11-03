// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:load_api/data/model/data_model.dart';
import 'package:load_api/presentation/pages/detail_page.dart';

import '../../business_logic/blocs/game_data_bloc/game_data_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'home-screen-route';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            BlocBuilder<GameDataBloc, GameDataState>(builder: (context, state) {
          if (state is GameDataInitialState) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataLoadedState) {
            return buidlGameWidget(state.apiResult);
          } else if (state is GameDataErrorState) {
            return Text('some error occured');
          } else {
            return Text('Error');
          }
        }),
      ),
    );
  }

  Widget buidlGameWidget(List<DataModel> apiResult) {
    return ListView.builder(
        itemCount: apiResult.length,
        itemBuilder: (context, index) {
          final dataModel = apiResult[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(dataModel: dataModel)));
              },
              child: SizedBox(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        fit: BoxFit.cover,
                        height: 230,
                        width: MediaQuery.of(context).size.width / 1.05,
                        image: NetworkImage(dataModel.image.toString()),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: GlassmorphicContainer(
                        width: MediaQuery.of(context).size.width / 1.05,
                        height: 110,
                        borderRadius: 12,
                        linearGradient: LinearGradient(
                          colors: [Colors.grey, Colors.black38],
                          stops: [0.1, 1],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: 0,
                        blur: 10,
                        borderGradient: LinearGradient(
                          colors: [Colors.grey, Colors.black38],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  dataModel.title.toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white54),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Platforms :  ${dataModel.platforms}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
