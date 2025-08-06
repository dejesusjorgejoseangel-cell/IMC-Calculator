import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedage = 20;
  int selectedweight = 80;
  double selectedHeight = 180;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          selectedHeight: selectedHeight,
          onHeightChanged: (newheight) {
            setState(() {
              selectedHeight = newheight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Peso",
                  value: selectedweight,
                  onIncrement: () {
                    setState(() {
                      selectedweight++;
                    });
                  },
                  ondecrement: () {
                    setState(() {
                      selectedweight--;
                    });
                  },
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: NumberSelector(
                  title: "Edad",
                  value: selectedage,
                  onIncrement: () {
                    setState(() {
                      selectedage++;
                    });
                  },
                  ondecrement: () {
                    setState(() {
                      selectedage--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreen(
                      weight: selectedweight,
                      height: selectedHeight,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text("Calcular", style: TextStyles.Bodytext),
            ),
          ),
        ),
      ],
    );
  }
}
