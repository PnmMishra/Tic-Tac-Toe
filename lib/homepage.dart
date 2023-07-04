import 'package:flutter/material.dart';
import 'player.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 45, 35, 100),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                child: Column(
              children: [
                Text(
                  'TIC\nTAC\nTOE',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.monoton(
                    color: Colors.yellow,
                    fontSize: 70.0,
                  ),
                ),
              ],
            )),
            SizedBox(height: 60.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Players(pageType: "S"),
                      ));
                },
                child: Text(
                  'Single Player',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Color(0xffAC31EA),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Players(pageType: "M"),
                      ));
                },
                child: Text('Multiple Player',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Color(0xffF95C8A),
                ),
              ),
            ),
          ],
        ));
  }
}
