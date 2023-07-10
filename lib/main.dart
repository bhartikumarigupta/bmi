import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 192, 44, 25)),
        useMaterial3: true,
      ),
      home: homepage(),
    );
  }
  
}
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
   var kgweight=TextEditingController();
  var ftheight=TextEditingController();
  var inchheight=TextEditingController();
 var result="";
 var bgcolor=Colors.red[200];
  @override
 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('BMI',style: TextStyle(fontSize: 34,fontWeight: FontWeight.bold),)),backgroundColor: Colors.red[400],),
      body: Container(
        color:bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(fontSize:34 ,fontWeight:FontWeight.w700 ),),SizedBox(height: 21,),
                TextField(controller: kgweight,decoration: InputDecoration(label:Text('enter your weight in kg'),prefixIcon: Icon(Icons.line_weight_rounded), ),keyboardType: TextInputType.number,),SizedBox(height: 11,), TextField(controller: ftheight,decoration: InputDecoration(label:Text('enter your height in ft'),prefixIcon: Icon(Icons.height_outlined), ),keyboardType: TextInputType.number,),SizedBox(height: 11,), TextField(controller: inchheight,decoration: InputDecoration(label:Text('enter your height in inch'),prefixIcon: Icon(Icons.height_rounded), ),keyboardType: TextInputType.number,),SizedBox(height: 11,),
                ElevatedButton(onPressed: (){
                var wt=kgweight.text.toString();
                var htft=ftheight.text.toString();
                var inchht=inchheight.text.toString();
                if(wt!="" && htft!="" && inchht!=""){
                   var iwt=int.parse(wt);
                   var ihtft=int.parse(htft);
                   var iinch=int.parse(inchht);
                   var tinch=(ihtft*12)+iinch;
                   var tcm=tinch*2.54;
                   var tm=tcm/100;
                   var bmi=iwt/(tm*tm);
                   var msg="";
                   if(bmi>25){
                    msg="you are over weight";
                     bgcolor=Colors.amber[400];
                   }
                   else if(bmi<18){
                    bgcolor= Colors.amber[100];
                    msg="you are under weight";
                   }
                   else{
bgcolor=Colors.amber[200];
msg="you are healthy";
                   }
                   setState(() {
                     result="your bmi is ${bmi.toStringAsFixed(2)}\n $msg";
                   });
                }
                else{
                
                setState(() {
                  result="please fill all  required value";
                });
                }
                }, child: Text('calculate')),SizedBox(height: 11,),Text(result,style: TextStyle(fontSize: 21),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}