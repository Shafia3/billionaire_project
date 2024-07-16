import 'package:flutter/material.dart';

class AddMoneyButton extends StatelessWidget {
  void Function () AddMoneyFunction;
   AddMoneyButton({super.key,required this.AddMoneyFunction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[700],
                      minimumSize: Size(double.infinity,0 )
                    ),
                    onPressed: AddMoneyFunction,
                    child: Text('Add Money'),
                  ),
                );
  }
}