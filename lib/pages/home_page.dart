import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_age/provider/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        child: ChangeNotifierProvider<HomePageProvider>(
          create: (_) => HomePageProvider(),
          child: Consumer<HomePageProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.eligibilityMessage.toString(),
                    style: TextStyle(
                      color: provider.isEligible == true
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Enter your Age!",
                    ),
                    onChanged: (val) {
                      provider.checkEligibility(int.parse(val));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    ));
  }
}
