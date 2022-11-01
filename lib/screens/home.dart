import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:hive/hive.dart';
import 'package:outshade/adapters/auth_adapter.dart';
import 'package:outshade/constants/colors.dart';
import 'package:outshade/constants/customroutes.dart';
import 'package:outshade/constants/responsive.dart';
import 'package:outshade/constants/widgets.dart';
import 'package:outshade/screens/profile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

final List<dynamic> _userJson = [
{
 "name": "Krishna",
 "id": "1",
 "atype": "Permanent"
 },
 {
 "name": "Sameera",
 "id": "2",
 "atype": "Permanent"
 },
 {
 "name": "Radhika",
 "id": "3",
 "atype": "Permanent"
 },
 {
 "name": "Yogesh",
 "id": "4",
 "atype": "Permanent"
 },
 {
 "name": "Radhe",
 "id": "5",
 "atype": "Permanent"
 },
 {
 "name": "Anshu",
 "id": "6",
 "atype": "Permanent"
 },
 {
 "name": "Balay",
 "id": "7",
 "atype": "Permanent"
 },
 {
 "name": "Julie",
 "id": "8",
 "atype": "Permanent"
 },
 {
 "name": "Swaminathan",
 "id": "9",
 "atype": "Permanent"
 },
 {
 "name": "Charandeep",
 "id": "10",
 "atype": "Permanent"
 },
 {
 "name": "Sankaran",
 "id": "11",
 "atype": "Permanent"
 },
 {
 "name": "Alpa",
 "id": "12",
 "atype": "Permanent"
 },
 {
 "name": "Sheth",
 "id": "13",
 "atype": "Temproary"
 },
 {
 "name": "Sabina",
 "id": "14",
 "atype": "Temproary"
 }
 
];

 
  late Box<Auth> authBox;
  bool isPopulating = true;
  @override
  void initState() {
    super.initState();
    authBox = Hive.box<Auth>('authBox');
    populateData();
  }

  populateData() async {
      if(authBox.values.isEmpty == true) {        
            for(var i = 0; i <=_userJson.length-1 ; i++){
                Auth _auth = Auth(
                  name: _userJson[i]['name'], 
                  age: "", 
                  gender: "", 
                  id: _userJson[i]['id'], 
                  login:false
                );
                authBox.add(_auth);      
            }
            setState(() {
              isPopulating = false;
            });
      }else{
        setState(() {
          isPopulating = false;
        });
      }
  }

 
  @override
  Widget build(BuildContext context) {
  var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Container(
            margin: screenPads(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                mediumCustomSizedBox(context),
                Text(
                  "Let's sign you up into,",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 27.0 : 32.0,
                      fontWeight: FontWeight.w900,
                     color: kTitleColor,
                      fontFamily: kMuktaRegular),
                ),
                /*Text(
                  "OutShade.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: isMobile(context) ? 23.0 : 28.0,
                      fontWeight: FontWeight.bold,
                     color: kTitleColor,
                      fontFamily: kMuktaRegular),
                ),*/
                Container(
                  height: 60,
                  width: 100,
                  child: Image.network(
                  "https://media-exp1.licdn.com/dms/image/C510BAQGKWQ6xg1YpUg/company-logo_200_200/0/1559715592252?e=2147483647&v=beta&t=-AyzsTE-X52AHLEi_k_m1zjE3mjn8w998bFrmUEL3qE",
                  fit: BoxFit.cover,

                )
                ),
              ],
            ),),
              Container(
                height: isMobile(context) ? 55 : 60,
                width: size.width,
                decoration: const BoxDecoration(color: kWhiteSmoke),
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Outshade Personnels".toUpperCase(),
                      style: mediumLargeTextStyle(context).copyWith(
                          letterSpacing: 0.2,
                          color: kDarkGray,
                          fontFamily: kMuktaBold),
                    ),
                  ],
                ),
              ),
              /*---Delete a DB whole---
              
                           ElevatedButton(onPressed: (){
                 authBox.deleteFromDisk().then((value)async{
                       await Hive.openBox<Auth>('authBox');
                   print("Deleted Database");
                 });
              }, child: Text("Delete DB")),
               */
              mediumCustomSizedBox(context),
              isPopulating == true ?
              const CircularProgressIndicator(
                backgroundColor: kPrimaryColor,
              ) :
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
                            return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                                horizontal:
                                    kDefaultScreenPaddingHorizontal(context) * 2,
                                vertical: kDefaultScreenPaddingVertical(context)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        if(userData!.login == true){
                                           Navigator.push(context, CustomSimplePageRoute(
                                              page: ProfilePage(
                                                age: userData.age,
                                                gender: userData.gender,
                                                name: userData.name,
                                              ), 
                                              routeName: "/profilepage"));
                                        }
                                      },
                                      child: CircleAvatar(
                                          maxRadius: isMobile(context) ? 35 : 50,
                                          backgroundImage: NetworkImage("https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png")),
                                    ),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: mediumCustomSizedBox(context),
                                    ),
                                    RotatedBox(
                                      quarterTurns: 1,
                                      child: smallCustomSizedBox(context),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            isEmptyOrNull(userData!.name) ?
                                            "-" : userData.name,
                                            style: mediumTextStyle(context)
                                                .copyWith(
                                                    fontSize: isMobile(context)
                                                        ? 16.5
                                                        : 18.5),
                                          ),
                                          Text(
                                            isEmptyOrNull(userData.id) ?
                                            "-" : userData.id,
                                            maxLines: 2,
                                            softWrap: true,
                                            style: smallTextStyle(context)
                                                .copyWith(height: 1.7),
                                          ),
                                          mediumCustomSizedBox(context),
                                         userData.login == false ? GestureDetector(
                                            onTap: () async {
                                             var userValue = authBox.getAt(index);

                                             if(isEmptyOrNull(userValue!.age) == true){
                                                bottomDialog(
                                        context: context,
                                        height: 350,
                                        widget: Container(
                                          margin: screenPads(context),
                                          child: ListView(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            // mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                               Text("Please enter your age and gender",
                                                softWrap: true,
                                                style: mediumTextStyle(context).copyWith(fontFamily: kMuktaRegular,height:1.1)),
                                                mediumCustomSizedBox(context),
                                Container(
                        decoration: BoxDecoration(
                          color: kLightLavengerGrayColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:TextFormField(
                        controller: _ageController,
                      keyboardType: TextInputType.number,
                        enableSuggestions: true,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(
                          enabled: true,
                          hintText: 'Your age',
                          hintStyle: const TextStyle(
                            color: kGraycolor,
                            fontSize: 13.0,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: kGraycolor),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: const BorderSide(color: kGraycolor),
                          ),
                        ),

                          ),  
                        ),
                        smallCustomSizedBox(context),
                         Container(
                        //height: 50,
                        decoration: BoxDecoration(
                          color: kLightLavengerGrayColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:TextFormField(
                controller: _genderController,
               keyboardType: TextInputType.text,
                enableSuggestions: true,
                enableInteractiveSelection: true,
                decoration: InputDecoration(
                  enabled: true,
                  hintText: 'Your Gender',
                  hintStyle: const TextStyle(
                    color: kGraycolor,
                    fontSize: 13.0,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kGraycolor),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(color: kGraycolor),
                  ),
                ),
                // maxLength: 10,
                ),  
                        ),
                      mediumCustomSizedBox(context),
                                              GestureDetector(
                                                onTap: () {
                                                  if(_ageController.text.isNotEmpty && _genderController.text.isNotEmpty){
                                                    overlayLoader(context);
                                                    //update age and gender in hive auth box
                                                    var updatedInfo = Auth(
                                                      name: userValue.name, 
                                                      age: _ageController.text, 
                                                      gender: _genderController.text, 
                                                      id: userValue.id, 
                                                      login: true
                                                      );
                                                    authBox.putAt(index, updatedInfo).then((value){
                                                      Loader.hide();
                                                      Navigator.push(context, CustomSimplePageRoute(
                                                          page: ProfilePage(
                                                            age: _ageController.text,
                                                            gender: _genderController.text,
                                                            name: userData.name,
                                                          ), 
                                                          routeName: "/profilepage"));
                                                    });
                                                    
                                                  }else{
                                                    ScaffoldMessenger.of(context).showSnackBar(customsnackErrorBar(context, "Please enter your age and gender"));
                                                  }
                                                   
                                                },
                                                child: Container(
                                                  height: 35, 
                                                  margin:EdgeInsets.symmetric(horizontal: kDefaultScreenPaddingHorizontal(context) * 2,vertical: 5),
                                                  decoration: BoxDecoration(
                                                    color : kPinkRedishColor,
                                                    borderRadius: BorderRadius.circular(3),
                                                  ),
                                                  child: Center(
                                                    child:  Text("Sign In".toUpperCase(),style: mediumTextStyle(context).copyWith(color:Colors.white))
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                             }else{
                                              overlayLoader(context);
                                                    //update age and gender in hive auth box
                                                   var userValue = authBox.getAt(index);

                                                    var updatedInfo = Auth(
                                                      name: userValue!.name, 
                                                      age: userValue.age, 
                                                      gender: userValue.gender, 
                                                      id: userValue.id, 
                                                      login: true
                                                      );
                                                    authBox.putAt(index, updatedInfo).then((value){
                                                      Loader.hide();
                                                           
                                                      Navigator.push(context, CustomSimplePageRoute(
                                                      page: ProfilePage(
                                                        age: userData.age,
                                                        gender: userData.gender,
                                                        name: userData.name,
                                                      ), 
                                                      routeName: "/profilepage"));
                                                    });
                                               
                                             }
                                              },
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: kOrangeColor,
                                                  borderRadius:
                                                      BorderRadius.circular(25)),
                                              child: Center(
                                                child: Text(
                                                  "Sign In".toUpperCase(),
                                                  style: mediumTextStyle(context)
                                                      .copyWith(
                                                          fontFamily: kMuktaBold,
                                                          color: Colors.white,
                                                          letterSpacing: 0.2),
                                                ),
                                              ),
                                            ),
                                          ) : GestureDetector(
                                            onTap: () {
                                              overlayLoader(context);
                                                    //update age and gender in hive auth box
                                                   var userValue = authBox.getAt(index);

                                                    var updatedInfo = Auth(
                                                      name: userValue!.name, 
                                                      age: userValue.age, 
                                                      gender: userValue.gender, 
                                                      id: userValue.id, 
                                                      login: false
                                                      );
                                                    authBox.putAt(index, updatedInfo).then((value){
                                                      Loader.hide();
                                                      
                                                    });
                                            },
                                            child: Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: kOrangeColor,
                                                  borderRadius:
                                                      BorderRadius.circular(25)),
                                              child: Center(
                                                child: Text(
                                                  "Sign Out".toUpperCase(),
                                                  style: mediumTextStyle(context)
                                                      .copyWith(
                                                          fontFamily: kMuktaBold,
                                                          color: Colors.white,
                                                          letterSpacing: 0.2),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          ],
                        ),
                      ),
                                kSmallDivider(context)
                              ],
                            );
                          },
                        );
                     
                      },
                      
                    ),
               
            ],
          ),
        )
      ),
    );
  }
}