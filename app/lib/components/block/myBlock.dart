import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyBlock extends StatelessWidget {
  const MyBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/college.png'),
            alignment: Alignment.topCenter,
            fit: BoxFit.fill
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10.0,
              left: 10.0,
              child: Container(
                width: 40.0,
                height: 40.0,
                child: Center(
                  child: Image.asset('assets/images/logo.png',
                      width: 30.0, height: 30.0),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 50.0,
              child: Text(
                AppLocalizations.of(context)!.college, // * MSCDT | МГКЦТ
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 155.0,
              left: 20.0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about');
                  },
                  child: Text(AppLocalizations.of(context)!.collegeInfo), // * About college | О колледже
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
