import 'package:flutter/material.dart';
import '../../constant/custom_button.dart';
import '../../constant/custom_text.dart';
import '../home/home.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: SizedBox(
                  height: 530,
                  child: Image.asset(
                    "assets/images/bg.png",
                    fit: BoxFit.fill,
                  )),
            ),
            const Positioned(
                left: 20,
                right: 20,
                bottom: 150,
                child: CustomText(
                  title: 'Coffee so good, your taste buds will love it.',
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.center,
                )),
            const Positioned(
                left: 20,
                right: 20,
                bottom: 100,
                child: CustomText(
                  title:
                      'The best grain, the finest roast, the powerful flavor.',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                )),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: CustomButton(
                title: 'Get Started',
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => const Home()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
