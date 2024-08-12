import 'package:flutter/material.dart';

import 'call_page/ui/call_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calling App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150.0,
              height: 150.0,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: idController,
              decoration: InputDecoration(
                hintText: 'User ID',
                labelText: 'User ID',
                contentPadding: const EdgeInsets.all(20.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () {if(idController.text.isEmpty) return;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CallPage(
                              callID: idController.text,
                            )));
              },
              style: ButtonStyle(
                  /*backgroundColor: MaterialStateProperty.all(onPressed != null
                      ? bgColor ?? ThemeConfig.colorPrimary
                      : ThemeConfig.colorSecondary),*/
                  textStyle: WidgetStateProperty.all(
                      Theme.of(context).textTheme.headlineMedium!.copyWith(
                            color: Colors.white,
                          )),
                  padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 20.0)),
                  elevation: WidgetStateProperty.all(1),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  foregroundColor: WidgetStateProperty.all(Colors.white)),
              child: Text(
                'Join a Call',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
