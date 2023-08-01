import 'package:flutter/material.dart';
import 'package:presence_auth_mobile/core/components/wave/wave.dart';
import 'package:presence_auth_mobile/core/components/wave/wave_container.dart';

class LoginWaves extends StatelessWidget {
  const LoginWaves({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WaveContainer(
          waveCount: 3,
          initialColor: Theme.of(context).primaryColorDark,
          endColor: Theme.of(context).primaryColor
        ),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w900
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}