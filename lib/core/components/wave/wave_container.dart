import 'package:flutter/material.dart';
import 'package:presence_auth_mobile/core/components/wave/wave.dart';

class WaveContainer extends StatelessWidget {
  WaveContainer({
    super.key,
    required this.waveCount,
    required this.initialColor,
    this.endColor = Colors.transparent
  });

  int waveCount;
  Color initialColor = Colors.transparent;
  Color endColor = Colors.transparent;  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: waveCount * 120,
      child: Stack(
        children: <Widget>[
          for (double i = waveCount.toDouble(), j = 0; i > 0; --i, j++) ...{
            Positioned(
              top: 0,
              left: 0,
              child: Wave(
                height: i * 120,
                waves: j.toInt() + 2,
                backgroundColor: Color.lerp(endColor, initialColor, j / waveCount)!,
              ),
            )
          }
        ],
      ),
    );
  }
}