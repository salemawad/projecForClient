import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/screens/colors.dart';
import 'package:untitled/widget/snack.dart';
import 'package:url_launcher/url_launcher.dart';

class DirectScreen extends StatefulWidget {
  const DirectScreen({Key? key}) : super(key: key);

  @override
  State<DirectScreen> createState() => _DirectScreenState();
}

class _DirectScreenState extends State<DirectScreen> with Helpers {
  late BuildContext dialogContext;
  late BuildContext dialogContext2;
  final List<String> imageUrls = [
    'images/slider.jpg',
    'images/sliderone.jpg',
    'images/slidertow.jpg',
    'images/sliderthree.jpg',
    'images/sliderfour.jpg',
    'images/sliderfive.jpg',

    // قم بإضافة المزيد من عناوين URL للصور هنا
  ];
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  final Duration _duration =
      const Duration(seconds: 3); // زمن الانتقال بين الشرائح

  late TextEditingController textEdit;

  @override
  void initState() {
    super.initState();
    startAutoSlide();
    textEdit = TextEditingController();
  }

  void startAutoSlide() {
    Future.delayed(_duration, () {
      if (_currentIndex == imageUrls.length - 1) {
        _currentIndex = 0;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      } else {
        _currentIndex++;
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      }
      startAutoSlide();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    textEdit.dispose();
    super.dispose();
  }

  bool _switchValue = false;
  bool _switchValueTow = true;
  bool _switchValueThree = true;
  final String url = 'https://aimtool.site/get-cod-genuyf56jhf2/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'AimTool',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.colorButton),
          )),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 7),
              height: 400,
              decoration: BoxDecoration(
                color: AppColors.back,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: imageUrls.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'The Latest Version Of ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'AimTool',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                color: AppColors.colorButton,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Supports All Versions Of  ',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: '8 Ball Pool.',
                            style: TextStyle(
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                color: AppColors.colorButton,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Our Officiel Web',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Container(
                          color: Colors.blue,
                          child: Image.asset('images/right.png'),
                        )
                      ],
                    ),
                    TextButton(
                        onPressed: () async {
                          final Uri url = Uri.parse('https://aimtool.site/');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url,
                                mode: LaunchMode.externalApplication);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: const Text(
                          'https://aimtool.site/',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              color: AppColors.colorButton,
                              fontWeight: FontWeight.bold),
                        ))
                  ]),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Switch(
                  value: _switchValue,
                  activeColor: AppColors.colorButton,
                  onChanged: (value) {
                    if (_switchValue == true) {
                      setState(() {
                        _switchValue = false;
                      });
                    } else {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: Colors.black,
                            child: SizedBox(
                              width: 500,
                              height: 450,
                              child: Column(children: [
                                Expanded(
                                    child: Image.asset(
                                  'images/dialog.jpg',
                                  height: 250,
                                )),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _switchValue = true;
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: const Text('Accept',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel',
                                          style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  width: 250,
                  child: Text(
                    '''Auto-Play Special
Available (Normal Global)''',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Switch(
                  value: _switchValueTow,
                  activeColor: AppColors.colorButton,
                  onChanged: (value) {
                    setState(() {
                      _switchValueTow = value;
                    });
                  },
                ),
                Text(
                  _switchValueTow
                      ? 'Accelerated Record'
                      : 'Compatibility Record',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Switch(
                  value: _switchValueThree,
                  activeColor: AppColors.colorButton,
                  onChanged: (value) {
                    setState(() {
                      _switchValueThree = value;
                    });
                  },
                ),
                const Text(
                  'Global Overlay Draw',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 320,
              height: 45,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.colorButton)),
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: AppColors.background,
                          child: SizedBox(
                            width: 200,
                            height: 250,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    textAlign: TextAlign.center,
                                    'Please Enter Your Invitation Code :',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: AppColors.colorButton,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    controller: textEdit,
                                    cursorColor: AppColors.colorButton,
                                    decoration: const InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors
                                                .red), // تعيين لون الخط العادي
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: AppColors
                                                .colorButton), // تعيين لون الخط عند التركيز
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          if (textEdit.text.isEmpty) {
                                            ShowSnackBar(context,
                                                content:
                                                    'Enter The Code Please!');
                                          } else {
                                            Navigator.of(context).pop();
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                dialogContext = context;
                                                return const Dialog(
                                                  alignment: Alignment.center,
                                                  insetPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 155),
                                                  backgroundColor:
                                                      AppColors.background,
                                                  child: SizedBox(
                                                    height: 200,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          'The invitation code is being verified! ',
                                                          style: TextStyle(
                                                              fontSize: 17,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        SizedBox(height: 10),
                                                        CircularProgressIndicator(
                                                          color: AppColors
                                                              .colorButton,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                            Future.delayed(
                                              const Duration(
                                                seconds: 2,
                                              ),
                                              () {
                                                Navigator.pop(dialogContext);
                                                ShowSnackBar(dialogContext,
                                                    content:
                                                        'The code is wrong or used!');
                                                showDialog(
                                                  barrierDismissible: false,
                                                  context: dialogContext,
                                                  builder:
                                                      (BuildContext context) {
                                                    dialogContext2 = context;
                                                    return Dialog(
                                                      insetPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              horizontal: 160),
                                                      backgroundColor:
                                                          AppColors.background,
                                                      child: SizedBox(
                                                        height: 70,
                                                        width: 40,
                                                        child: Center(
                                                            child: Lottie.asset(
                                                                'images/error.json')),
                                                      ),
                                                    );
                                                  },
                                                );
                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  Navigator.of(dialogContext2)
                                                      .pop(); // إغلاق الديالوق الثالث
                                                });
                                              },
                                            );
                                          }
                                        },
                                        child: const Text('Check',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          final Uri url = Uri.parse(
                                              'https://aimtool.site/get-cod-genuyf56jhf2/');
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: const Text('Get Code',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white70,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'START GAME',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
