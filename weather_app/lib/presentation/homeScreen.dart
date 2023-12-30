import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white, //TODO change Theme
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1.5),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.lightBlue
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(6, -1.9),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[700]
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-6, -1.9),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.blue[700]
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -0.75),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(color: Color.fromRGBO(1, 255, 220, 1)),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
            ]),
          ),
      ),
    );
  }
}
