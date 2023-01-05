import 'package:flutter/material.dart';
import 'package:yaro_assignment/screens/sample%20data/data.dart';

import '../widgets/widgets.dart';
import 'widgets.dart';

const List<String> buttonText = ['NSE', '1D', '1W', '1M', '1Y', '3Y'];

class StockDetailScreen extends StatefulWidget {
  const StockDetailScreen({super.key});
  @override
  State<StockDetailScreen> createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends State<StockDetailScreen> {
  String currentButton = '1D';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Stock Detail'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios),
      ),
      bottomNavigationBar: BottomBar(buy: buy, sell: sell),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            const StockScreenHeader(
              title: 'Aditya Birla Group',
              points: '1200',
              percentage: '2.78%',
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttonText.map((e) => getTimelineButtom(e)).toList(),
            ),
            const SizedBox(height: 5),
            StockGraph(data: data, labelX: labelX, labelY: labelY),
            const Text('Perofrmance'),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  InformationText(
                      field: 'Today\'s low',
                      value: '480',
                      alignment: CrossAxisAlignment.start),
                  InformationText(
                    field: 'Today\'s high',
                    value: '1490.87',
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ),
            PerformanceSlider(
              width: MediaQuery.of(context).size.width,
              ratio: 0.6,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: InformationText(
                field: '10 Week high',
                value: '1490.87',
                alignment: CrossAxisAlignment.end,
              ),
            ),
            PerformanceSlider(
              width: MediaQuery.of(context).size.width,
              ratio: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  InformationText(
                    field: 'Open',
                    value: '480',
                    alignment: CrossAxisAlignment.start,
                  ),
                  InformationText(
                    field: 'Prev. Close',
                    value: '1660',
                    alignment: CrossAxisAlignment.center,
                  ),
                  InformationText(
                    field: 'Volume',
                    value: '1856700',
                    alignment: CrossAxisAlignment.end,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const Text('Fundamentals')
          ],
        ),
      ),
    );
  }

  TextButton getTimelineButtom(String e) {
    return TextButton(
      onPressed: () {
        setState(() {
          currentButton = e;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          currentButton == e
              ? const Color.fromARGB(255, 195, 113, 1)
              : Colors.black,
        ),
      ),
      child: Text(
        e,
        style: TextStyle(
          color: currentButton == e ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  void buy() {}
  void sell() {}
}
