import 'package:flutter/material.dart';
import 'package:party_planner/consts.dart';
import 'dart:io' show Platform;
import 'package:url_launcher/url_launcher.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  launchMap() async {
    String query = Uri.encodeComponent("167 Lynhurst Cres, Uxbridge UB10 9EH");
    String googleMapsUrl = Platform.isIOS
        ? "https://maps.apple.com/?address=$query"
        : "https://www.google.com/maps/search/?api=1&query=$query";
    // For google maps
    // https://www.google.com/maps/search/?api=1&query=$query
    // For apple maps
    // https://maps.apple.com/?address=$query
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw "Could not launch $googleMapsUrl";
    }
  }

  launchPhone(String phoneNumber) async {
    String phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      throw "Could not launch $phoneUrl";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 7.0),
        children: <Widget>[
          // DrawerHeader(
          //   child: Text(
          //     "Useful Information",
          //     style: TextStyle(
          //         fontWeight: FontWeight.w500,
          //         fontSize: 12.0,
          //         color: Colors.white),
          //   ),
          //
          // ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Useful Information",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
            ),
          ),
          const ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: Colors.red,
            ),
            title: Text("Location", style: kSidebarIconTextStyle),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 70.0),
            child: Text(
              "167 Lynhurst Crescent, UB10 9EH",
              style: kSideBarInfoTextStyle,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const ListTile(
            leading: Icon(
              Icons.directions,
              color: Colors.green,
            ),
            title: Text("Directions", style: kSidebarIconTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  setState(() {
                    launchMap();
                  });
                },
                child: const Text("Open in Google Maps",
                    style: kSideBarInfoTextStyle)),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            title: Text("Contact", style: kSidebarIconTextStyle),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  setState(() {
                    launchPhone('07792162988');
                  });
                },
                child: const Text("Prasad", style: kSideBarInfoTextStyle)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.cyan,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                onPressed: () {
                  setState(() {
                    launchPhone('07566832268');
                  });
                },
                child: const Text("Bharath", style: kSideBarInfoTextStyle)),
          ),
        ],
      ),
    );
  }
}
