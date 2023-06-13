import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  bool _switchValueFour = false;
  final String url = 'https://aimtool.site/get-cod-genuyf56jhf2/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.back,
          centerTitle: true,
          title: Text(
            'AimTool',
            style: GoogleFonts.ibmPlexSans(
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
                      text:   TextSpan(
                        text: 'The Latest Version Of ',
                        style: GoogleFonts.ibmPlexSans(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'AimTool',
                            style: GoogleFonts.ibmPlexSans(
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
                      text:  TextSpan(
                        text: 'Supports All Versions Of  ',
                        style: GoogleFonts.ibmPlexSans(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                            TextSpan(
                            text: '8 Ball Pool.',
                            style: GoogleFonts.ibmPlexSans(
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
                         Text(
                          'Our Officiel Web',
                          style: GoogleFonts.ibmPlexSans(
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
                        child:  Text(
                          'https://aimtool.site/',
                          style: GoogleFonts.ibmPlexSans(
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
                                      child:  Text('Accept',
                                          style: GoogleFonts.ibmPlexSans(
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
                                      child:  Text('Cancel',
                                          style: GoogleFonts.ibmPlexSans(
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
                 SizedBox(
                  width: 250,
                  child: Text(
                    '''Auto-Play Special
Available (Normal Global)''',
                    style: GoogleFonts.ibmPlexSans(
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
                  style:  GoogleFonts.ibmPlexSans(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
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
                 Text(
                  'Global Overlay Draw',
                  style: GoogleFonts.ibmPlexSans(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Switch(
                  value: _switchValueFour,
                  activeColor: AppColors.colorButton,
                  onChanged: (value) {
                    setState(() {
                      _switchValueFour = value;
                    });
                  },
                ),
                Text(
                  _switchValueFour
                      ? 'Facebook Login(App Method)'
                      : 'Facebook Login(Web Method)',
                  style: GoogleFonts.ibmPlexSans(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 15,
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
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Please Enter Your Invitation Code :',
                                    style: GoogleFonts.ibmPlexSans(
                                        fontSize: 30,
                                        color: AppColors.colorButton,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextField(
                                    controller: textEdit,
                                    cursorColor: AppColors.colorButton,
                                    style: GoogleFonts.ibmPlexSans(
                                        color: Colors.white),
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
                                            textEdit.clear();
                                            Navigator.of(context).pop();
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                dialogContext = context;
                                                return Dialog(
                                                  alignment: Alignment.center,
                                                  backgroundColor:
                                                      AppColors.background,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: SizedBox(
                                                      height: 130,
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            'The invitation code is being verified! ',
                                                            style: GoogleFonts
                                                                .ibmPlexSans(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                          const SizedBox(
                                                              height: 10),
                                                          const CircularProgressIndicator(
                                                            color: AppColors
                                                                .colorButton,
                                                          )
                                                        ],
                                                      ),
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
                                        child: Text('Check',
                                            style: GoogleFonts.ibmPlexSans(
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
                                        child: Text('Get Code',
                                            style: GoogleFonts.ibmPlexSans(
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
                  child: Text(
                    'START GAME',
                    style:
                        GoogleFonts.ibmPlexSans(fontWeight: FontWeight.normal),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
