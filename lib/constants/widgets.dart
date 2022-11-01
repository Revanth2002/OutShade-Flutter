/* ---------------Default Screen Padding--------------------------------*/
//Used in Main Screen Pages
import 'package:flutter/material.dart';
import 'package:outshade/constants/colors.dart';
import 'package:outshade/constants/responsive.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

/* ---------------MediaQuery--------------------------------*/
sizeMedia(BuildContext context) {
  return MediaQuery.of(context).size;
}

const kDefaultPadding = 30.0;
kScreenMarginHorizontal(context) {
  return isMobile(context) ? kDefaultPadding - 15.0 : kDefaultPadding * 1.5;
}


kDefaultScreenPaddingHorizontal(context) {
  return isMobile(context) ? 14.0 : 17.0;
}

kDefaultScreenPaddingVertical(context) {
  return isMobile(context) ? 10.0 : 14.0;
}

screenPads(context) {
  return EdgeInsets.symmetric(
      horizontal: kDefaultScreenPaddingHorizontal(context),
      vertical: kDefaultScreenPaddingVertical(context));
}


/* -------------- Text Style --------------*/
ultraProLargeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 26.0 : 29.0,
  );
}

ultraLargeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 24.0 : 27.0,
  );
}

largeTextStyle(context) {
  return TextStyle(
    color: kBlackTextColor,
    fontFamily: kMuktaBold,
    height: 1.2,
    fontSize: isMobile(context) ? 23.0 : 25.0,
  );
}

mediumLargeTextStyle(context) {
  return TextStyle(
    fontFamily: kMuktaBold,
    fontSize: isMobile(context) ? 17.0 : 19.0,
    color: kBlackTextColor,
  );
}

mediumTextStyle(context) {
  return TextStyle(
    fontFamily: kMuktaRegular,
    fontSize: isMobile(context) ? 15.0 : 17.0,
    color: kBlackTextColor,
  );
}

smallTextStyle(context) {
  return TextStyle(

      fontFamily: kMuktaRegular,
      fontSize: isMobile(context) ? 13.0 : 15.0,
      color: kGraycolor);
}

/* ---------------Custom Divider Gray Box--------------------------------*/
kLargeDivider(context,{Color? dividerClr}) {
  return Container(
      decoration: BoxDecoration(color: dividerClr ?? kLavenderGrayColor),
      height: isMobile(context) ? 11.0 : 13.0);
}

kMediumDivider(context,{Color? dividerClr}) {
  return Container(
      decoration: BoxDecoration(color: dividerClr ?? kLavenderGrayColor),
      height: isMobile(context) ? 6.0 : 9.0);
}

kSmallDivider(context, {Color? lineColor}) {
  return Container(
      decoration: BoxDecoration(color: lineColor ?? kLavenderGrayColor),
      height: isMobile(context) ? 1.5 : 3.0);
}

/* ---------------Custom Line Divider--------------------------------*/
lineDivider(context, {double? thickness, Color? color}) {
  return Divider(
    color: color ?? kLavenderGrayColor,
    thickness: thickness ?? (isMobile(context) ? 0.1 : 0.25),
    endIndent: 2.0,
    indent: 2.0,
    height: 1.0,
  );
}

/* ---------------Custom Sized Box Divider--------------------------------*/
Widget mediumCustomSizedBox(context) {
  return SizedBox(height: isMobile(context) ? 15.0 : 22.0);
}

Widget smallCustomSizedBox(context) {
  return SizedBox(height: isMobile(context) ? 6.0 : 9.0);
}

/* ---------------To check if the value is null or empty--------------------------------*/
isEmptyOrNull(var x) {
  if ((x.toString().isEmpty) || (x == null) || (x.toString() == "null") || (x.toString() == "None")) {
    return true;
  } else {
    return false;
  }
}

Widget titleText(
    {required BuildContext context,
    required String text,
    required Color color}) {
  return Text(text,
      softWrap: true, style: mediumLargeTextStyle(context).copyWith(color: color,fontSize: isMobile(context) ? 18.0 : 21.0,));
}

  Widget tileContent(
      {required BuildContext context,
      required IconData icon,
      required String title,
      required Color bgColor,
      required Color iconColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: isMobile(context) ? 20 : 25,
          width: isMobile(context) ? 20 : 25,
          decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
          child: Icon(
            icon,
            color: iconColor,
            size: 14,
          ),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: smallCustomSizedBox(context),
        ),
        Text(title,
            style: smallTextStyle(context).copyWith(fontFamily: kMuktaBold)),
      ],
    );
  }


/* ------------------ Bottom Dialog Pop Up --------------------------------*/
Future bottomDialog({required context,double? height,required Widget widget}){
  var size = sizeMedia(context);
  return showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 100),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Scaffold(
          backgroundColor:  Colors.black.withOpacity(0.1), 
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height ?? 200,
              width: size.width,
              child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 35,
                                      padding:
                                          const EdgeInsets.only(top: 8, right: 10),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: const Icon(
                                              Icons.cancel,
                                              color: kPrimaryColor,
                                              size: 22,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: widget
                                    )
                                  ],
                                ),
                              ],
                            ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
}


customsnackErrorBar(BuildContext context, String message) {
  return SnackBar(
    content: Row(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.white,
        ), 
        const SizedBox(width: 10),
        Expanded(child: Text("$message" , maxLines: 2)),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.redAccent, 
    padding:const EdgeInsets.all(15),
  );
}

customSnackSuccessBar(BuildContext context, String message) {
  return SnackBar(
    content: Text("$message"),  
    behavior: SnackBarBehavior.floating,
    backgroundColor: kGreenColor, 
    padding:const EdgeInsets.all(15),
  );
}

overlayLoader(BuildContext context){
  return Loader.show(context,
          isAppbarOverlay: true,
          isBottomBarOverlay: true,
          overlayColor: Colors.black38,
          progressIndicator:customCircularProgress(),
      );
}

/* --------------Circular Progress Indicator -------------- */
customCircularProgress() {
  return CircularProgressIndicator(
    //backgroundColor: kPrimaryColor,
    color: kPrimaryColor,
    strokeWidth: 3,
  );
}