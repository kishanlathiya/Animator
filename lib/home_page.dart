import 'package:flutter/material.dart';
import 'global.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff004999),
      appBar: AppBar(
        backgroundColor: const Color(0xff003d80),
        title: const Text(
          "Galaxy Planets",
          style: TextStyle(
            // color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...Global.planets
                .map(
                  (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('detailsPage', arguments: e);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          left: 20, bottom: 25, top: 25, right: 20),
                      height: 180,
                      decoration: BoxDecoration(
                        color:  const Color(0xff003d80),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(5,8),
                            color: Colors.black54,
                            blurRadius: 10,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          RotationTransition(
                            turns: animationController,
                            child: Hero(
                              tag: e['tag'],
                              child: Container(
                                height: 150,
                                width: 150,
                                margin: const EdgeInsets.all(10),
                                child: Image.asset(
                                  e['images'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              const SizedBox(height: 25),
                              Text(
                                e['planets'],
                                style: const TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Milky Way Galaxy",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(Icons.my_location,
                                      color: Colors.grey),
                                  const SizedBox(width: 5),
                                  Text(
                                    e['km'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.compare_arrows,
                                      color: Colors.grey),
                                  const SizedBox(width: 5),
                                  Text(
                                    e['m/s'],
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
