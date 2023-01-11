import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Color primaryColor = const Color(0xffC42127);
getIcon(String icon) {
  if (icon == "fa fa-home") {
    return FontAwesomeIcons.house;
  } else if (icon == "fa fa-barcode") {
    return FontAwesomeIcons.barcode;
  } else if (icon == "fa fa-briefcase") {
    return FontAwesomeIcons.briefcase;
  } else if (icon == "fa fa-truck") {
    return FontAwesomeIcons.truck;
  } else if (icon == "fa fa-globe") {
    return FontAwesomeIcons.globe;
  } else if (icon == "fa fa-graduation-cap") {
    return FontAwesomeIcons.graduationCap;
  } else if (icon == "fa fa-rocket") {
    return FontAwesomeIcons.rocket;
  } else if (icon == "fa fa-users") {
    return FontAwesomeIcons.users;
  } else {
    return FontAwesomeIcons.cartShopping;
  }
}
