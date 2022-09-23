import 'package:flutter/material.dart';

class RouterOfflineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Image.asset(
              "assets/18_Router Offline.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.15,
            left: MediaQuery.of(context).size.width * 0.3,
            right: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 13),
                    blurRadius: 25,
                    color: Colors.black.withOpacity(0.17),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style:ButtonStyle(
backgroundColor: MaterialStateProperty.all(Colors.black),
                    elevation: MaterialStateProperty.all(15),
                    shadowColor: MaterialStateProperty.all(Colors.amber),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState>states){
                    if(states.contains(MaterialState.pressed))
                      return Colors.redAccent;
                    else if(states.contains(MaterialState.hovered))
                      return Colors.green;
                  })
    ),
                child: Text(
                  "retry".toUpperCase(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
