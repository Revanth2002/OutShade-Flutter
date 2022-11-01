import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:outshade/adapters/auth_adapter.dart';
import 'package:outshade/screens/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(AuthAdapter());
  await Hive.openBox<Auth>('authBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outshade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage()
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({ Key? key }) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  String boxData = "empty";
  late Box<Auth> authBox;
  @override
  void initState(){
    super.initState();
    authBox = Hive.box<Auth>('authBox');
    readData();
    //writeData();
  }

writeData() async{

  Auth _auth = Auth(name: "ram", age: "12", gender: "M", id: "123", login:false);
  authBox.add(_auth);
}

readData()async{
  var data = authBox.get("auth");
  setState(() {
    boxData = data.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title:
            Text("Hive Todo App", style: TextStyle(fontFamily: 'Montserrat')),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Text(boxData, style : TextStyle(fontFamily: 'Montserrat')),
            ),
             ElevatedButton(onPressed: (){
                 authBox.deleteFromDisk().then((value)async{
                       await Hive.openBox<Auth>('authBox');
                   print("Deleted Database");
                 });
              }, child: Text("Delete DB")),
             ValueListenableBuilder(
                      valueListenable: authBox.listenable(),
                      builder: (context, Box<Auth> box, _){
                        if(box.values.isEmpty){
                            return Container(
                              child: Text("No Data"),
                          
                            );
                        }
                      return ListView.builder(
                          itemCount: box.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            Auth? userData = box.getAt(index);
                            return Container(
                              padding: EdgeInsets.only(
                                  left: 14, right: 14, top: 10, bottom: 10),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  userData!.name.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14),
                                ),
                              ),
                            );
                          },
                        );
                     
                      },
                      
                    ),
          ],
        ),
      ),
    );
  }
}
