import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_assesment/features/groceries/presentation/pages/getAllGroceries.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const getAllGroceries()),
      );
    });
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash.png'),
            fit: BoxFit.cover,
          ),
        color : Color(0x000000).withOpacity(0.6),
         
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 570),
            const Text(
              'Welcome to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'SPEDDY SHOW',
             style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
                    ),
            ),
          ],
        ),

      )
    );
  }
}