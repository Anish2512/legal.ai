import 'package:flutter/material.dart';

class Temp2Page extends StatelessWidget {
  const Temp2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "legal.ai",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 32),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text("Document Generator", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 24),),
                const SizedBox(
                  height: 60,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      //padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 27.0),
                      child: const Text(
                        "Simplified Text",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'See your simplified text',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLines: 10,
                      minLines: 5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      //padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.symmetric(horizontal: 27.0),
                      child: const Text(
                        "Original Text",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                    ),
                  ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    width: 350,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Paste your text here',
                        filled: true,
                        fillColor: Colors.white
                      ),
                      maxLines: 10,
                      minLines: 5,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) {
                    //     return const Temp2Page();
                    // }));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ), // Background color
                  ),
                  child: const Text(
                    'Simpilfy',
                    style: TextStyle(color:Colors.black, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}