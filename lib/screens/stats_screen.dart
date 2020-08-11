import 'package:flutter/material.dart';
import 'package:covid19/utilities/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:covid19/services/location_service.dart';
import 'package:covid19/services/coronavirus_service.dart';
import 'package:covid19/models/coronavirus_data.dart';
import 'package:covid19/components/stack_pie.dart';
import 'package:covid19/components/stats.dart';
import 'package:covid19/components/action_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19/screens/search_screen.dart';
import 'package:covid19/components/error_alert.dart';
import 'package:covid19/screens/stateswise.dart';

enum LocationSource { Global, Local, Search }

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  Future<CoronavirusData> futureCoronavirusData;
  LocationSource locationSource = LocationSource.Global;

  @override
  void initState() {
    super.initState();
    futureCoronavirusData= CoronavirusService().getLatestData();
  }

  void getData({String countryCode}) async {
    switch (locationSource) {
      case LocationSource.Global:
        futureCoronavirusData = CoronavirusService().getLatestData();
        break;
      case LocationSource.Local:
        Placemark placemark = await LocationService().getPlacemark();
        setState(() {
          futureCoronavirusData =
              CoronavirusService().getLocationDataFromPlacemark(placemark);
        });
        break;
      case LocationSource.Search:
        if (countryCode != null) {
          futureCoronavirusData =
              CoronavirusService().getLocationDataFromCountryCode(countryCode);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppBarMainTitle, style: kTextStyleAppBar,textAlign: TextAlign.center),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: FutureBuilder<CoronavirusData>(
            future: futureCoronavirusData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return SpinKitPulse(color: kColourPrimary, size: 80);
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return dataColumn(coronavirusData: snapshot.data);
                  } else if (snapshot.hasError) {
                    return ErrorAlert(
                      errorMessage: snapshot.error.toString(),
                      onRetryButtonPressed: () {
                        setState(() {
                          getData();
                        });
                      },
                    );
                  }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  Column dataColumn({CoronavirusData coronavirusData}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          coronavirusData.date,
          style: kTextStyleDate,
          textAlign: TextAlign.center,
        ),
        Text(
          coronavirusData.locationLabel,
          style: kTextStyleLocationLabel,
          textAlign: TextAlign.center,
        ),
        StackPie(
          totalNumber: coronavirusData.totalNumber,
          sickNumber: coronavirusData.sickNumber,
          recoveredNumber: coronavirusData.recoveredNumber,
          deadNumber: coronavirusData.deadNumber,
        ),
        Stats(
          sickNumber: coronavirusData.sickNumber,
          recoveredNumber: coronavirusData.recoveredNumber,
          deadNumber: coronavirusData.deadNumber,
          sickPercentage: coronavirusData.sickPercentage,
          recoveredPercentage: coronavirusData.recoveredPercentage,
          deadPercentage: coronavirusData.deadPercentage,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

//            ActionButton(
//              icon: Icons.near_me,
//              onPressed: () {
//                setState(() {
//                  locationSource = LocationSource.Local;
//                  getData();
//                });
//              },
//            ),
            ActionButton(
              icon: Icons.language,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserList()));
              },
            ),
          ],
        ),
      ],
    );
  }
}