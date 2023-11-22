import 'package:dio/dio.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo_impl.dart';
import 'package:epic_minds/core/utils/api_service.dart';
import 'package:epic_minds/core/utils/app_router.dart';
import 'package:epic_minds/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final ApiService apiService = ApiService(Dio());
final HomeRepo homeRepoImpl = HomeRepoImpl(apiService);
void getDATA() {
  print("hellllllllllllllll");
  homeRepoImpl.fetchBestSellerBooks();
}

class SplashBody extends StatefulWidget {
  SplashBody({
    super.key,
  });

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    getDATA();
    // navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  "Epic Minds",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                AssetsData.logo,
                color: Colors.white,
              ),
            ],
          ),
          SlidingText(slidingAnimation: _slidingAnimation),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    _slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2.5), end: Offset.zero)
            .animate(_animationController);
    _animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(
        //   HomeView(),
        //   transition: Transition.fade,
        //   duration: kTransitionDuration,
        // );
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}

class SlidingText extends StatelessWidget {
  const SlidingText({
    Key? key,
    required Animation<Offset> slidingAnimation,
  })  : _slidingAnimation = slidingAnimation,
        super(key: key);

  final Animation<Offset> _slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slidingAnimation,
      builder: (context, child) {
        return SlideTransition(
          position: _slidingAnimation,
          child: const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "Free Books at Your Fingertips",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}
