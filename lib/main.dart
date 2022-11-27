import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BMI(),
  ));
}

class BMI extends StatefulWidget {
  const BMI({Key? key}) : super(key: key);

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> with TickerProviderStateMixin {
  var femaleColor = 0;
  var maleColor = 0;
  var sliderValue = 180;
  var Weight = 60;
  var Age = 28;

  double bmi = 0;
  double bmiHeight = 0;

  var Decor = BoxDecoration(
    color: const Color(0xff1d1e33),
    borderRadius: BorderRadius.circular(15),
  );

  late AnimationController animationController;
  late AnimationController HeightanimationController;

  late Animation<Offset> FemaleAnimation;
  late Animation<Offset> MaleAnimation;
  late Animation<Offset> WeightAnimation;
  late Animation<Offset> AgeAnimation;

  late Animation HeightAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    HeightanimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    FemaleAnimation = Tween<Offset>(
      begin: const Offset(-1, -1),
      end: Offset.zero,
    ).animate(animationController);

    MaleAnimation = Tween<Offset>(
      begin: const Offset(1, -1),
      end: Offset.zero,
    ).animate(animationController);

    WeightAnimation = Tween<Offset>(
      begin: const Offset(-1, 1),
      end: Offset.zero,
    ).animate(animationController);

    AgeAnimation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: Offset.zero,
    ).animate(animationController);

    HeightAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 200, end: 320), weight: 1),
    ]).animate(HeightanimationController);

    animationController.forward();
    HeightanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xff090e21),
      ),
      body: Container(
        color: const Color(0xff090e21),
        child: Column(
          children: [
            Expanded(
              flex: 21,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        femaleColor = 1;
                        maleColor = 0;
                      });
                    },
                    child: Ink(
                      child: Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (femaleColor == 1)
                              ? const Color(0xff3b3c4d)
                              : const Color(0xff1d1e33),
                        ),
                        child: SlideTransition(
                          position: FemaleAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.female,
                                size: 100,
                                color: (femaleColor == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: (femaleColor == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (femaleColor == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        maleColor = 1;
                        femaleColor = 0;
                      });
                    },
                    child: Ink(
                      child: Container(
                        height: 180,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: (maleColor == 1)
                              ? const Color(0xff3b3c4d)
                              : const Color(0xff1d1e33),
                        ),
                        child: SlideTransition(
                          position: MaleAnimation,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: (maleColor == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: (maleColor == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (maleColor == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 26,
              child: Center(
                child: AnimatedBuilder(
                  animation: HeightanimationController,
                  builder: (context, widget) {
                    return Container(
                      height: HeightAnimation.value,
                      width: HeightAnimation.value,
                      decoration: Decor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "$sliderValue",
                                style: const TextStyle(
                                  fontSize: 50,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 7),
                              Container(
                                height: 100,
                                alignment: const Alignment(0, 0.2),
                                child: const Text(
                                  "cm",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Slider(
                            value: sliderValue.toDouble(),
                            onChanged: (val) {
                              setState(() {
                                sliderValue = val.toInt();
                              });
                            },
                            thumbColor: const Color(0xffeb1555),
                            activeColor: const Color(0x0ff5c1d1),
                            inactiveColor: const Color(0xff555555),
                            max: 270,
                            min: 90,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 180,
                    width: 150,
                    decoration: Decor,
                    child: SlideTransition(
                      position: WeightAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$Weight",
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Weight--;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff4c4f5e),
                                    ),
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Weight++;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff6e6f7a),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.red.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 180,
                    width: 150,
                    decoration: Decor,
                    child: SlideTransition(
                      position: AgeAnimation,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "$Age",
                            style: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Age--;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff4c4f5e),
                                    ),
                                    child: const Text(
                                      "-",
                                      style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Age++;
                                  });
                                },
                                child: Ink(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff6e6f7a),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 30,
                                      color: Colors.red.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 9),
            Text(
              "BMI = ${bmi.toStringAsFixed(2)} kg/m²",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 9),
            InkWell(
              onTap: () {
                setState(() {
                  bmiHeight = sliderValue / 100;
                  bmi = Weight / (bmiHeight * bmiHeight);
                });
              },
              child: Ink(
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.9,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffeb1555),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
