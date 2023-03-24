import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Icon fb;
  final Icon inst;
  final Icon twit;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.fb,
    required this.inst,
    required this.twit,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), onPrimary: Colors.black),
              onPressed: onClicked,
              child: const Icon(Icons.kayaking)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), onPrimary: Colors.black),
              onPressed: onClicked,
              child: const Icon(Icons.link)),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), onPrimary: Colors.black),
              onPressed: onClicked,
              child: const Icon(Icons.facebook)),
        ],
      );
}
