import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class StockScreenHeader extends StatelessWidget {
  const StockScreenHeader({
    Key? key,
    required this.title,
    required this.points,
    required this.percentage,
  }) : super(key: key);

  final String title, points, percentage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      leading: Container(
        // width: 50,
        // height: 50,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Image.asset(
          'assets/logo-abg.png',
          fit: BoxFit.cover,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.signal_cellular_alt,
            color: Color.fromARGB(255, 195, 113, 1),
            size: 18,
          ),
          Text(
            points,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.arrow_drop_up,
            color: Colors.green,
            size: 18,
          ),
          Text(
            percentage,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              Icons.favorite_outline,
              size: 25,
              color: Color.fromARGB(255, 195, 113, 1),
            ),
            Icon(
              Icons.share_outlined,
              size: 25,
              color: Color.fromARGB(255, 195, 113, 1),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key? key,
    required this.buy,
    required this.sell,
  }) : super(key: key);
  final Function() buy, sell;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width / 2,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                  ),
                ),
              ),
            ),
            onPressed: sell,
            child: const Text(
              'SELL',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width / 2,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
            onPressed: buy,
            child: const Text(
              'BUY',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class StockGraph extends StatelessWidget {
  const StockGraph({
    Key? key,
    required this.data,
    required this.labelX,
    required this.labelY,
  }) : super(key: key);
  final List<double> data;
  final List<String> labelX, labelY;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 400,
          height: 350,
          child: LineGraph(
            features: [
              Feature(
                title: "Stock Status",
                color: const Color.fromARGB(255, 0, 255, 204),
                data: data,
              ),
            ],
            size: const Size(320, 400),
            labelX: labelX,
            labelY: labelY,
            graphColor: Colors.white,
            verticalFeatureDirection: true,
          ),
        ),
        Positioned(
          top: 50,
          right: 50,
          child: Card(
            color: const Color.fromARGB(255, 0, 255, 204).withOpacity(0.7),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 2, 12, 2),
              child: Column(children: const [Text('678.5'), Text('+7%')]),
            ),
          ),
        )
      ],
    );
  }
}

class PerformanceSlider extends StatelessWidget {
  const PerformanceSlider({
    Key? key,
    required this.width,
    required this.ratio,
  }) : super(key: key);
  final double width, ratio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
      child: Stack(
        children: [
          Divider(
            color: const Color.fromARGB(255, 0, 255, 204).withOpacity(0.5),
            thickness: 3,
          ),
          Positioned(
            left: (width - 20) * ratio,
            child: const CircleAvatar(
              backgroundColor: Color.fromARGB(255, 195, 113, 1),
              maxRadius: 7,
            ),
          ),
        ],
      ),
    );
  }
}