import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:weather_app/pages/weather_Page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final weatherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(6, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-8, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Colors.orange),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: const BoxDecoration(color: Colors.orange),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(6, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-8, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                ),
              ),
              BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  )),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                        child: Container(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.13),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.white.withOpacity(0.15),
                                Colors.white.withOpacity(0.5),
                              ],
                            )),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Weather in your city",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white70.withOpacity(0.4),
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  TextField(
                                    controller: weatherController,
                                    style:
                                        const TextStyle(color: Colors.white54),
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Enter city',
                                      hintStyle: const TextStyle(
                                          color: Colors.white54),
                                      fillColor:
                                          Colors.white70.withOpacity(0.2),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          )),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.13),
                                          )),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.13),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor:
                                                Colors.white.withOpacity(0.3),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12))),
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return HomePage(
                                                  locations:
                                                      weatherController.text);
                                            },
                                          ));
                                        },
                                        child: const Text(
                                          "Search",
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                          .animate(delay: 100.ms)
                          .fadeIn(duration: 800.ms)
                          .moveY(begin: 15, end: 0),
                    ],
                  ),
                )
                    .animate(delay: 100.ms)
                    .fadeIn(duration: 1500.ms)
                    .moveY(begin: 15, end: 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
