import 'package:flutter_test/flutter_test.dart';

import 'package:nigerian_states_and_lga/src/nigerian_states_and_lga.dart';

void main() {
  test("Checking the full list of local governments is 774", () {
    final allLocalGovernments = NigerianStatesAndLGA.getAllNigerianLGAs();
    expect(allLocalGovernments.length, 774);
  });

  test("Check that all states are 37 (including Abuja)", () {
    const allStates = NigerianStatesAndLGA.allStates;
    expect(allStates.length, 37);
  });
}
