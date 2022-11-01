import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';
import 'package:outshade/constants/responsive.dart';
import 'package:outshade/constants/widgets.dart';

class ProfilePage extends StatefulWidget {
  final String name;
  final String age;
  final String gender;
  const ProfilePage({ Key? key, required this.name, required this.age, required this.gender}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = sizeMedia(context);
    return SafeArea(
      child: Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    //Top Bar with name and notification icon
                    Container(
                      height: isMobile(context) ? 90 : 120,
                      width: size.width,
                      padding: EdgeInsets.only(
                          left: kScreenMarginHorizontal(context),
                          right: kScreenMarginHorizontal(context),
                          top: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Hello", style: mediumTextStyle(context)),
                                    Text(widget.name,
                                      style: largeTextStyle(context),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kWhiteSmoke,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(Icons.notifications, color: kDimGray),
                                ),
                              ),
                              mediumCustomSizedBox(context),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                          Container(
                      height: isMobile(context) ? 140 : 180,
                      width: isMobile(context) ? 140 : 180,
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(100),
                           child:Image.network(
                            "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png"
                            ,fit: BoxFit.cover,
                            ),
                         ),
                       ),    
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultScreenPaddingHorizontal(context),
                    vertical: kDefaultScreenPaddingVertical(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    titleText(
                        context: context,
                        text: "Personal Information",
                        color: Colors.black),
                    smallCustomSizedBox(context),
                                        //Personal Information and Data not editable
                    personalInfoStaticTitle(
                        title: "Name*", initialValue: "${widget.name}"),
                    personalInfoStaticTitle(
                        title: "Age", initialValue: "${widget.age}"),
                    personalInfoStaticTitle(
                        title: "Gender", initialValue: "${widget.gender}"),
                  ]))
             
            ],
          ),
        )
      ),
    );
  }

  Widget personalInfoStaticTitle(
      {required String title, required String initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        mediumCustomSizedBox(context),
        Text(
          title,
          style: mediumTextStyle(context).copyWith(letterSpacing: 0.2),
        ),
        smallCustomSizedBox(context),
        Container(
          height: 45,
          decoration: BoxDecoration(
            color: kLightLavengerGrayColor,
            //border: Border.all(color: kPrimaryColor, width: 1),
            borderRadius: BorderRadius.circular(9),
          ),
          child: TextFormField(
            style: const TextStyle(color: kBlackTextColor, fontSize: 17),
            keyboardType: TextInputType.text,
            readOnly: true,
            initialValue: initialValue,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 8),
            ),
          ),
        )
      ],
    );
  }

}