import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamic/model/radio_model.dart';
import 'package:islamic/tabs/radio/radio_item.dart';
import 'package:http/http.dart' as http;
class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    return FutureBuilder(
      future: getRadio(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Radios> radios = snapshot.data?.radios ??  [];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/radio_image.png',
                  alignment: Alignment.center,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemBuilder: (context, index) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: RadioItem(
                      audioPlayer: audioPlayer,
                      radios: radios[index],
                    ),
                  ),
                  itemCount: radios.length,
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Failed to load radio',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<RadioModel?> getRadio() async {
    var uri = Uri.parse("https://mp3quran.net/api/v3/radios");
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioModel.fromJson(json);
    }
  }
}
