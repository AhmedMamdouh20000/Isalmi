import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/model/radio_model.dart';
import 'package:audioplayers/audioplayers.dart';

class RadioItem extends StatefulWidget {
  final Radios radios;
  AudioPlayer audioPlayer ;  // Create an AudioPlayer instance

  RadioItem({super.key, required this.radios,required this.audioPlayer});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlaying = false;  // Track whether the audio is playing

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.radios.name ?? "",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.skip_previous_rounded,
                size: 50,
              ),
            ),
            IconButton(
              onPressed: () async {
                if (isPlaying) {
                  await widget.audioPlayer.pause();
                } else {
                  await widget.audioPlayer.play(UrlSource(widget.radios.url ?? ''));
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              icon: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,  // Change icon based on state
                size: 50,
              ),
            ),
            IconButton(
              onPressed: () {
              },
              icon: const Icon(
                Icons.skip_next_rounded,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
