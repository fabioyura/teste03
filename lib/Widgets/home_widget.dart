import 'package:flutter/material.dart';
import 'package:teste03/Components/Home/custom_button.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.redAccent,
              height: 160,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton1(onPressed: () {}, text: 'Filmes'),
                CustomButton1(onPressed: () {}, text: 'Personagens'),
                CustomButton1(onPressed: () {}, text: 'Favoritos'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
