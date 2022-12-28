import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:vape_track/cubit/home_cubit/home_cubit_cubit.dart';

import '../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
        return SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 30, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, Tommaso.',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: SizedBox(
                                height: 300,
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: LayoutBuilder(
                                  builder: (context, state) {
                                    return SfRadialGauge(
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          startAngle: 110,
                                          endAngle: 70,
                                          minimum: 0,
                                          radiusFactor: 1,
                                          maximum: 300,
                                          showLabels: false,
                                          showTicks: false,
                                          axisLineStyle: AxisLineStyle(
                                            thickness: 0.2,
                                            cornerStyle: CornerStyle.bothCurve,
                                            color: Constants.gaugeBackground,
                                            thicknessUnit: GaugeSizeUnit.factor,
                                          ),
                                          annotations: [
                                            GaugeAnnotation(
                                              widget: Text('Puffs'),
                                              positionFactor: 0.1,
                                              angle: 90,
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 1,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Constants.gaugeBackground),
                            ),
                            Text('test')
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
