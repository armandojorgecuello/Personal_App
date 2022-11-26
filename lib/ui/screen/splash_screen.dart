import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:user_app/core/dependencies/initial_load_provider.dart';
import 'package:user_app/ui/screen/logic/get_users_provider.dart';
import 'package:user_app/ui/utils/responsive.dart';

import '../utils/constants/constants.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Route goTo() => MaterialPageRoute(
    builder: (_) => const SplashScreen(),
    settings: const RouteSettings(name: kRouteSplashScreen),
  );

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with TickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: kDimens2.toInt()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    ref.listen<AsyncValue>(initialLoadProvider, (key, value) {
     value.when(
       data: ( _ ) =>
           Future.delayed(const Duration(milliseconds: 2000), () {
             final route = ref.watch(selectRouteProvider);
             if(route != null){
               Navigator.of(context).pushReplacement(route);
             }
           }),
       error: (error, obj) {},
       loading: () {},
     );
    });

    return Scaffold(
      body: SizedBox(
        width: Responsive.of(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Image.asset(
              kIcon,
              width: Responsive.of(context).wp(kDimens80),
              height: Responsive.of(context).wp(kDimens50),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: kDimens30,),
            Lottie.asset(
              kLoaderSplashScreen,
              height: Responsive.of(context).wp(kDimens50),
              width: Responsive.of(context).wp(kDimens50),
              controller: _controller,
              onLoaded: (composition) {
                _controller
                  ..duration = composition.duration
                  ..forward()
                  ..repeat();
              },
            ),
          ],
        ),
      ),
    );
  }
}