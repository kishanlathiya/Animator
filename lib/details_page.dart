import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
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
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: const Color(0xff004999),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 45,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff004999).withOpacity(0.5),
                side: BorderSide(color:Colors.black.withOpacity(0.5)),
              ),
              child: const Text("◀  Back"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            height: 320,
            decoration: BoxDecoration(
              color: const Color(0xff003d80),
              border: Border.all(color: const Color(0xff00254d), width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: animationController,
                  child: Hero(
                    tag: res['tag'],
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        res['images'],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Text(
                  res['planets'],
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Milky Way Galaxy",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.my_location, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      res['km'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.compare_arrows, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      res['m/s'],
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Overview',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "${res['detail']}",
              style:
                  TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 17),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
