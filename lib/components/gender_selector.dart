import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedgender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Hombre
        Expanded(
          child: GestureDetector(
            onTap: () {
            setState(() {
             selectedgender = "Hombre"; 
            });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedgender == "Hombre"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/male.png", height: 100),
                      SizedBox(height: 8),
                      Text("Hombre".toUpperCase(), style: TextStyles.Bodytext),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //Mujer
        Expanded(
          child: GestureDetector(
             onTap: () {
             setState(() {
             selectedgender = "Mujer"; 
            });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 16, top: 16, right: 16),
              child: Container(
                   decoration: BoxDecoration(
                  color: selectedgender == "Mujer"
                      ? AppColors.backgroundComponentSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset("assets/images/female.png", height: 100),
                      SizedBox(height: 8),
                      Text("Mujer".toUpperCase(), style: TextStyles.Bodytext),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
