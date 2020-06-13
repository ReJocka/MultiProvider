import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reioapp7/cart.dart';
import 'package:reioapp7/money.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            // ignore: deprecated_member_use
            builder: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            // ignore: deprecated_member_use
            builder: (context) => Cart(),
          )
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) =>  Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: (){
                  if(money.saldo >= 2500) {
                    cart.quantity += 1;
                    money.saldo -= 2500;
                  }
                },
                child: Icon(Icons.shopping_basket),
                backgroundColor: Colors.blue,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Multi Provider by Reio"),
          ),
          body: Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Saldo Anda"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder:(context, money, _)=> Text(
                            money.saldo.toString(),
                            style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:Colors.blue[100],
                          border: Border.all(color: Colors.blue, width: 2)),
                    ),
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder:(context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "ROG Laptop (2.500) x " + cart.quantity.toString(),
                            style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (2500* cart.quantity).toString(),
                            style: TextStyle(
                                color: Colors.black,fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 2)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}