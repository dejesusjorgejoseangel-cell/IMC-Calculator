import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final int weight;
  final double height;

  const ImcResultScreen({
    super.key,
    required this.weight,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    final fixedresult = height / 100;
    double imcResult = weight / (fixedresult * fixedresult);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            "Resultado",
            style: TextStyle(
              fontSize: 38,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      getTitleByimc(imcResult),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: getColorByimc(imcResult),
                      ),
                    ),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        getDescripcionByimc(imcResult),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

              },
              child: Text("Finalizar", style: TextStyles.Bodytext),
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar AppbarResult() {
    return AppBar(
      title: Text("Resultado"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }

  Color getColorByimc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, //IMC bajo
      < 24.9 => Colors.green, // IMC Normal
      < 29.99 => Colors.amber, // Sobrepeso
      _ => Colors.red, //Obesidad
    };
  }

  String getTitleByimc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "Bajo", //IMC bajo
      < 24.9 => "Normal", // IMC Normal
      < 29.99 => "Sobrepeso", // Sobrepeso
      _ => "Obesidad", //Obesidad
    };
  }

  String getDescripcionByimc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => "tu peso esta por de bajo de recomendado", //IMC bajo
      < 24.9 => "tu peso esta normal", // IMC Normal
      < 29.99 => "Tienes sobre peso cuida tu salud", // Sobrepeso
      _ => "Tienes obesidad consulta un especialista ", //Obesidad
    };
  }
}
