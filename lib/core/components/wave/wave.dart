import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Wave extends StatefulWidget {
  Wave({
    super.key,
    this.height,
    this.width,
    this.waves = 2,
    this.waveHeight = 150,
    this.backgroundColor = Colors.black
  });
  double? height;
  double? width;
  int waves;
  int waveHeight;
  Color backgroundColor;

  @override
  State<Wave> createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: GenerateClipper(
        waves: widget.waves,
        waveHeight: widget.waveHeight
      ),
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        color: widget.backgroundColor
      )
    );
  }
}

class GenerateClipper extends CustomClipper<Path> {

  GenerateClipper({
    this.waves = 2,
    this.waveHeight = 100
  });

  late final int waves;
  late final int waveHeight;

  @override
  Path getClip(Size size) {
    double waveHeight = 100;
    double increment = size.width / waves;
    double x = 0;


    final path = Path();

    path.lineTo(0, size.height - waveHeight / 2);

    for (int i = 0; i < waves; i++) {
      bool isEven = i % 2 == 0;
      
      path.quadraticBezierTo(
        x + increment / 2,
        isEven ? size.height - waveHeight : size.height,
        x + increment,
        isEven ? size.height - waveHeight / 2 : size.height - waveHeight / 2
      );

      x += increment;
    }

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}
