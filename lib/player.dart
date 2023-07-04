import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/model/brain.dart';

class Players extends StatelessWidget {
  final String pageType;
  const Players({super.key, required this.pageType});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 46, 34, 116),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 60.0, left: 50.0, right: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 24, 8, 77),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Icon(
                                Icons.person_sharp,
                                size: 100,
                              ),
                              radius: 50.0,
                              backgroundColor: Color(0xffEA1850),
                            ),
                            Text(
                              'Player 1',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            Text('X',
                                style: TextStyle(
                                    color: Color(0xffEA1850),
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 24, 8, 77),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Icon(
                                Icons.person_2_sharp,
                                size: 100,
                                color: Colors.white,
                              ),
                              radius: 50.0,
                              backgroundColor: Color(0xffFCCC3F),
                            ),
                            Text(
                              pageType == "M" ?"Player 2" : "AI",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            Text('O',
                                style: TextStyle(
                                    color: Color(0xffFCCC3F),
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.w900)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * .09),
            Container(
              height: height * .48,
              width: width,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white.withOpacity(0.15),
              ),
              child: pageType == "M" ? SimpleBord() : AiBord(),
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleBord extends StatelessWidget {
  const SimpleBord({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: 9,
      itemBuilder: (context, index) => Consumer<BrainProvider>(
        builder: (context, value, _) => GestureDetector(
          onTap: () {
            print(index);
            value.tapped(index);
            String win = value.checkWinner();
            if(win!= ' '){
              showDialog(context: context, builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.white,
                  actions: [
                    TextButton(onPressed: () {
                      value.clearBoard();
                      Navigator.pop(ctx);
                    }, child: Text('Ok')),
                  ],
                  content: Text("Player ${win} win's "),
              ),);
            }
            else if(value.filledBoxes == 9){
              showDialog(context: context, builder: (ctx) => AlertDialog(
                backgroundColor: Colors.white,
                actions: [
                  TextButton(onPressed: () {
                    value.clearBoard();
                    Navigator.pop(ctx);
                  }, child: Text('ok')),
                ],
                content: Text('Match Draw'),
              ),);
            }
          },

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 24, 8, 77),
            ),
            child: Text(
              value.displayElement[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
    ),
      
        ),
        
      ),
    );
  }
}

class AiBord extends StatelessWidget {
  const AiBord({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
    
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: 9,
      itemBuilder: (context, index) => Consumer<BrainProvider>(
        builder: (context, value, _) => GestureDetector(
          onTap: () {
            print(index);
            value.tapped(index);
            String win = value.gameAi();
            if(win!= ' '){
              showDialog(context: context, builder: (ctx) => AlertDialog(
                  backgroundColor: Colors.white,
                  actions: [
                    TextButton(onPressed: () {
                      value.clearBoard();
                      Navigator.pop(ctx);
                    }, child: Text('Ok')),
                  ],
                  content: Text("Player ${win} win's "),
              ),);
            }
            else if(value.filledBoxes == 9){
              showDialog(context: context, builder: (ctx) => AlertDialog(
                backgroundColor: Colors.white,
                actions: [
                  TextButton(onPressed: () {
                    value.clearBoard();
                    Navigator.pop(ctx);
                  }, child: Text('ok')),
                ],
                content: Text('Match Draw'),
              ),);
            }
          },

          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 24, 8, 77),
            ),
            child: Text(
              value.displayElement[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 100,
                color: Colors.white,
              ),
            ),
    ),
      
        ),
        
      ),
    );
  }
}





