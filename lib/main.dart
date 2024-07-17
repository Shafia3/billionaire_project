import 'package:billionaire_project/add_money_button.dart';
import 'package:billionaire_project/balance_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
double balance=0;

  void addMoney() async {
     setState(() {
      balance = balance+500;
    });
    // Obtain shared preferences
final SharedPreferences prefs = await  
 SharedPreferences.getInstance();
await prefs.setDouble('balance', balance);
    print(balance);
      }
      @override
  void initState() {
    // TODO: implement initState
    loadBalance();
    super.initState();
  }

      void loadBalance()async{
        final SharedPreferences prefs = await  
 SharedPreferences.getInstance();

setState(() {
  balance = prefs.getDouble('balance') ?? 0;
});
      }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Billionaire App!'),
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            color: Colors.blueGrey[700],
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BalanceView(balance: balance,),
                AddMoneyButton(AddMoneyFunction: addMoney),
              ],
            ),
          )),
    );
  }
}
