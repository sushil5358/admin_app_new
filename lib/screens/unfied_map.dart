// // // unified_survey_wrapper.dart
// // import 'package:flutter/material.dart';
// // import 'package:solarkits_new/view/survey_map2.dart';
// //
// // import 'package:solarkits_new/view/surveymap3.dart';
// // import 'package:solarkits_new/view/surveymap_screen.dart';
// //
// // class UnifiedSurveyWrapper extends StatefulWidget {
// //   String? willQuote;
// //    UnifiedSurveyWrapper({super.key,required this.willQuote});
// //
// //   @override
// //   State<UnifiedSurveyWrapper> createState() => _UnifiedSurveyWrapperState();
// // }
// //
// // class _UnifiedSurveyWrapperState extends State<UnifiedSurveyWrapper> {
// //   int _selectedMode = 1; // 1 = SurveyMap (Per Panels), 2 = SurveyMap2 (Per Space)
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title:    Container(
// //           margin: const EdgeInsets.symmetric(horizontal: 8),
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.orange, width: 1),
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //           child: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               InkWell(
// //                 onTap: () {
// //                   if (_selectedMode != 1) {
// //                     setState(() {
// //                       _selectedMode = 1;
// //                     });
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       const SnackBar(
// //                         content: Text("Mode changed to Per Panels. Please create a new building."),
// //                         backgroundColor: Colors.orange,
// //                         duration: Duration(seconds: 2),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: _selectedMode == 1 ? Colors.orange : Colors.transparent,
// //                     borderRadius: BorderRadius.circular(7),
// //                   ),
// //                   child: const Text("As Per KW", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
// //                 ),
// //               ),
// //               InkWell(
// //                 onTap: () {
// //                   if (_selectedMode != 2) {
// //                     setState(() {
// //                       _selectedMode = 2;
// //                     });
// //                     ScaffoldMessenger.of(context).showSnackBar(
// //                       const SnackBar(
// //                         content: Text("Mode changed to Per Space. Please create a new building."),
// //                         backgroundColor: Colors.orange,
// //                         duration: Duration(seconds: 2),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: _selectedMode == 2 ? Colors.orange : Colors.transparent,
// //                     borderRadius: BorderRadius.circular(7),
// //                   ),
// //                   child: const Text("As Per Space", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //         backgroundColor: Colors.white,
// //
// //       ),
// //       body: _selectedMode == 1
// //           ?  SurveyMap(willQuote: widget.willQuote,)
// //           :  SurveyMap2(willQuote: widget.willQuote,),
// //     );
// //   }
// // }
//
//
// //
// // import 'dart:async';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:get/get.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// //
// // import '../constants.dart';
// // import '../controller/unfied_map_controller.dart';
// //
// // class UnifiedSurveyWrapper extends StatefulWidget {
// //   final String? willQuote;
// //   const UnifiedSurveyWrapper({super.key, this.willQuote});
// //
// //   @override
// //   State<UnifiedSurveyWrapper> createState() => _UnifiedSurveyWrapperState();
// // }
// //
// // class _UnifiedSurveyWrapperState extends State<UnifiedSurveyWrapper> {
// //   final UnifiedSurveyController controller = Get.put(UnifiedSurveyController());
// //   final TextEditingController buildingNameController = TextEditingController();
// //   final TextEditingController customerNameController = TextEditingController();
// //   final TextEditingController customerMobileController = TextEditingController();
// //
// //   double screenWidth = 0.0;
// //   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
// //
// //   // Dialog local state variables
// //   String _tempTerraceType = "Rcc Roof";
// //   String _tempStructureType = "Hot dig Gi(Galvanised iron)";
// //   String _tempInverterPosition = "Ground Floor";
// //   bool _tempIsMeterOrFeet = true;
// //   int _tempFrontLegHeight = 0;
// //   int _tempBackLegHeight = 0;
// //
// //   String _tempProjectType = "";
// //   String _tempTechnology = "";
// //   String _tempPanelWatt = "545";
// //   String _tempKilowatt = "";
// //   int _tempPanelCount = 0;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     screenWidth = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       key: scaffoldKey,
// //       drawer: _buildDrawer(),
// //       appBar: _buildAppBar(),
// //       body: _buildBody(),
// //       floatingActionButton: _buildFAB(),
// //     );
// //   }
// //
// //   PreferredSizeWidget _buildAppBar() {
// //     return AppBar(
// //       backgroundColor: AppColors.primaryBlue,
// //       elevation: 1,
// //       title: const Text("Solar Survey", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
// //       actions: [
// //         Obx(() => Container(
// //           margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.white, width: 1),
// //             borderRadius: BorderRadius.circular(8),
// //           ),
// //           child: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               InkWell(
// //                 onTap: () => controller.switchMode(1),
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: controller.currentMode.value == 1 ? Colors.white : Colors.transparent,
// //                     borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
// //                   ),
// //                   child: Text(
// //                     "As Per KW",
// //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: controller.currentMode.value == 1 ? AppColors.primaryBlue : Colors.white),
// //                   ),
// //                 ),
// //               ),
// //               InkWell(
// //                 onTap: () => controller.switchMode(2),
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: controller.currentMode.value == 2 ? Colors.white : Colors.transparent,
// //                     borderRadius: const BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
// //                   ),
// //                   child: Text(
// //                     "As Per Space",
// //                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: controller.currentMode.value == 2 ? AppColors.primaryBlue : Colors.white),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         )),
// //         IconButton(
// //           icon: Obx(() => Icon(controller.showStreetView.value ? Icons.map : Icons.streetview, color: Colors.white)),
// //           onPressed: () => controller.showStreetView.toggle(),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildBody() {
// //     return Obx(() => controller.showStreetView.value ? const Center(child: Text("Street View Coming Soon")) : _buildMapView());
// //   }
// //
// //   Widget _buildMapView() {
// //     return Column(
// //       children: [
// //         Expanded(
// //           child: Stack(
// //             children: [
// //               GoogleMap(
// //                 zoomGesturesEnabled: true,
// //                 zoomControlsEnabled: false,
// //                 mapType: MapType.satellite,
// //                 initialCameraPosition: CameraPosition(target: controller.pickedLocation.value, zoom: 18),
// //                 onMapCreated: (mapCtrl) => controller.mapController = mapCtrl,
// //                 onTap: (argument) {
// //                   if (controller.isDrawingHandRail.value) {
// //                     // Hand rail drawing logic if needed
// //                   } else if (controller.isSelectingArea.value && controller.isDrawingTerrace.value) {
// //                     controller.addPolygonPoint(argument);
// //                   }
// //                   controller.pickedLocation.value = argument;
// //                 },
// //                 markers: _buildMarkers(),
// //                 polygons: _buildPolygons(),
// //                 polylines: _buildPolylines(),
// //               ),
// //               if (controller.isSelectingArea.value && controller.isDrawingTerrace.value) _buildDrawingControls(),
// //               if (controller.isSelectingArea.value && controller.isEditingTerrace.value) _buildTerraceEditControls(),
// //               if (controller.hasPanels.value && !controller.isSaved.value && controller.currentBuilding != null) _buildSaveEditControls(),
// //               if (controller.hasPanels.value && controller.isSaved.value && controller.currentBuilding != null && !controller.isSelectingArea.value && !controller.isEditingTerrace.value) _buildSavedEditControls(),
// //               // Edit card – only shown when editing terrace shape (terrace point editing mode)
// //               Positioned(
// //                 top: 10,
// //                 right: 10,
// //                 child: Obx(() => controller.isEditingTerraceLayout.value ? _buildEditCard() : const SizedBox()),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   // ==================== Edit Card (only for terrace shape editing) ====================
// //   // Widget _buildEditCard() {
// //   //   return Container(
// //   //     width: MediaQuery.of(context).size.width * 0.42,
// //   //     child: Card(
// //   //       elevation: 4,
// //   //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //   //       child: Padding(
// //   //         padding: const EdgeInsets.all(8),
// //   //         child: Column(
// //   //           mainAxisSize: MainAxisSize.min,
// //   //           crossAxisAlignment: CrossAxisAlignment.end,
// //   //           children: [
// //   //             Row(
// //   //               mainAxisAlignment: MainAxisAlignment.start,
// //   //               children: [
// //   //                 const Text("Panel Layout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
// //   //               ],
// //   //             ),
// //   //             const Divider(height: 8, thickness: 1),
// //   //             // Orientation toggle
// //   //             Row(
// //   //               children: [
// //   //                 const Text("Orient: ", style: TextStyle(fontSize: 12)),
// //   //                 CupertinoSlidingSegmentedControl(
// //   //                   groupValue: controller.isHorizontal.value ? "H" : "V",
// //   //                   thumbColor: AppColors.primaryBlue,
// //   //                   children: const {"H": Text("H"), "V": Text("V")},
// //   //                   onValueChanged: (value) {
// //   //                     if (value != null) {
// //   //                       controller.isHorizontal.value = value == "H";
// //   //                       controller.updatePanelsFromEditCard();
// //   //                       controller.updateAvailableRowsForEdit();
// //   //                     }
// //   //                   },
// //   //                 ),
// //   //               ],
// //   //             ),
// //   //             const SizedBox(height: 6),
// //   //             // Number of Rows (for As Per KW mode)
// //   //             if (controller.currentMode.value == 1)
// //   //               Column(
// //   //                 children: [
// //   //                   DropdownButtonFormField<int>(
// //   //                     decoration: const InputDecoration(labelText: "Rows", border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
// //   //                     value: controller.availableRowsForEdit.contains(controller.selectedRows.value)
// //   //                         ? controller.selectedRows.value
// //   //                         : (controller.availableRowsForEdit.isNotEmpty ? controller.availableRowsForEdit.first : 1),
// //   //                     items: controller.availableRowsForEdit.map((rows) => DropdownMenuItem(value: rows, child: Text("$rows Row${rows > 1 ? 's' : ''}"))).toList(),
// //   //                     onChanged: (value) {
// //   //                       if (value != null) {
// //   //                         controller.selectedRows.value = value;
// //   //                         controller.updatePanelsFromEditCard();
// //   //                       }
// //   //                     },
// //   //                   ),
// //   //                   const SizedBox(height: 6),
// //   //                 ],
// //   //               ),
// //   //             // Padding slider (both modes)
// //   //             Row(
// //   //               mainAxisAlignment: MainAxisAlignment.start,
// //   //               children: [
// //   //                 Text("Padding: ${controller.paddingValue.value.toStringAsFixed(1)} m", style: const TextStyle(fontSize: 11)),
// //   //               ],
// //   //             ),
// //   //             SizedBox(
// //   //               height: 30,
// //   //               width: MediaQuery.of(context).size.width * 0.4,
// //   //               child: Slider(
// //   //                 label: '${controller.paddingValue.value.toStringAsFixed(1)}',
// //   //                 value: controller.paddingValue.value,
// //   //                 min: 0,
// //   //                 max: 5,
// //   //                 divisions: 50,
// //   //                 activeColor: AppColors.primaryBlue,
// //   //                 onChanged: (value) {
// //   //                   controller.paddingValue.value = value;
// //   //                   controller.updatePanelsFromEditCard();
// //   //                 },
// //   //               ),
// //   //             ),
// //   //             // Row spacing slider (both modes – now added for As Per Space as well)
// //   //             Row(
// //   //               mainAxisAlignment: MainAxisAlignment.start,
// //   //               children: [
// //   //                 Text("Row Spacing: ${controller.rowSpacingValue.value.toStringAsFixed(1)} m", style: const TextStyle(fontSize: 11)),
// //   //               ],
// //   //             ),
// //   //             SizedBox(
// //   //               height: 30,
// //   //               width: MediaQuery.of(context).size.width * 0.4,
// //   //               child: Slider(
// //   //                 label: '${controller.rowSpacingValue.value.toStringAsFixed(1)}',
// //   //                 value: controller.rowSpacingValue.value,
// //   //                 min: 0,
// //   //                 max: 5,
// //   //                 divisions: 50,
// //   //                 activeColor: AppColors.primaryBlue,
// //   //                 onChanged: (value) {
// //   //                   controller.rowSpacingValue.value = value;
// //   //                   controller.updatePanelsFromEditCard();
// //   //                 },
// //   //               ),
// //   //             ),
// //   //             const Divider(height: 8, thickness: 1),
// //   //             Text("Solar Panels :${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontSize: 11)),
// //   //             Text("KW :${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(1)}", style: const TextStyle(fontSize: 11)),
// //   //
// //   //           ],
// //   //         ),
// //   //       ),
// //   //     ),
// //   //   );
// //   // }
// //
// //   // ==================== Drawing controls ====================
// //
// //
// //   Widget _buildEditCard() {
// //     return Container(
// //       width: MediaQuery.of(context).size.width * 0.42,
// //       child: Card(
// //         elevation: 4,
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //         child: Padding(
// //           padding: const EdgeInsets.all(8),
// //           child: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   const Text("Panel Layout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
// //                 ],
// //               ),
// //               const Divider(height: 8, thickness: 1),
// //               // Orientation toggle
// //               Row(
// //                 children: [
// //                   const Text("Orient: ", style: TextStyle(fontSize: 12)),
// //                   CupertinoSlidingSegmentedControl(
// //                     groupValue: controller.isHorizontal.value ? "H" : "V",
// //                     thumbColor: AppColors.primaryBlue,
// //                     children: const {"H": Text("H"), "V": Text("V")},
// //                     onValueChanged: (value) {
// //                       if (value != null) {
// //                         controller.isHorizontal.value = value == "H";
// //                         controller.updatePanelsFromEditCard();
// //                         controller.updateAvailableRowsForEdit();
// //                       }
// //                     },
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 6),
// //               // Row / Group Row selection
// //               if (controller.currentMode.value == 1)
// //               // As Per KW – individual rows
// //                 Column(
// //                   children: [
// //                     DropdownButtonFormField<int>(
// //                       decoration: const InputDecoration(
// //                         labelText: "Rows",
// //                         border: OutlineInputBorder(),
// //                         contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                       ),
// //                       value: controller.availableRowsForEdit.contains(controller.selectedRows.value)
// //                           ? controller.selectedRows.value
// //                           : (controller.availableRowsForEdit.isNotEmpty ? controller.availableRowsForEdit.first : 1),
// //                       items: controller.availableRowsForEdit.map((rows) => DropdownMenuItem(value: rows, child: Text("$rows Row${rows > 1 ? 's' : ''}"))).toList(),
// //                       onChanged: (value) {
// //                         if (value != null) {
// //                           controller.selectedRows.value = value;
// //                           controller.updatePanelsFromEditCard();
// //                         }
// //                       },
// //                     ),
// //                     const SizedBox(height: 6),
// //                   ],
// //                 )
// //               else
// //               // As Per Space – rows per group
// //                 Column(
// //                   children: [
// //                     DropdownButtonFormField<int>(
// //                       decoration: const InputDecoration(
// //                         labelText: "Rows per Table",
// //                         border: OutlineInputBorder(),
// //                         contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
// //                       ),
// //                       value: controller.groupRowsForSpace.value,
// //                       items: [1, 2, 3, 4, 5, 6].map((rows) => DropdownMenuItem(value: rows, child: Text("$rows Row${rows > 1 ? 's' : ''}"))).toList(),
// //                       onChanged: (value) {
// //                         if (value != null) {
// //                           controller.groupRowsForSpace.value = value;
// //                           controller.updatePanelsFromEditCard();
// //                         }
// //                       },
// //                     ),
// //                     const SizedBox(height: 6),
// //                   ],
// //                 ),
// //               // Padding slider
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Text("Padding: ${controller.paddingValue.value.toStringAsFixed(1)} m", style: const TextStyle(fontSize: 11)),
// //                 ],
// //               ),
// //               SizedBox(
// //                 height: 30,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: Slider(
// //                   label: '${controller.paddingValue.value.toStringAsFixed(1)}',
// //                   value: controller.paddingValue.value,
// //                   min: 0,
// //                   max: 5,
// //                   divisions: 50,
// //                   activeColor: AppColors.primaryBlue,
// //                   onChanged: (value) {
// //                     controller.paddingValue.value = value;
// //                     controller.updatePanelsFromEditCard();
// //                   },
// //                 ),
// //               ),
// //               // Row spacing slider (both modes)
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Text("Row Spacing: ${controller.rowSpacingValue.value.toStringAsFixed(1)} m", style: const TextStyle(fontSize: 11)),
// //                 ],
// //               ),
// //               //
// //               SizedBox(
// //                 height: 30,
// //                 width: MediaQuery.of(context).size.width * 0.4,
// //                 child: Slider(
// //                   label: '${controller.rowSpacingValue.value.toStringAsFixed(1)}',
// //                   value: controller.rowSpacingValue.value,
// //                   min: 0,
// //                   max: 5,
// //                   divisions: 50,
// //                   activeColor: AppColors.primaryBlue,
// //                   onChanged: (value) {
// //                     controller.rowSpacingValue.value = value;
// //                     controller.updatePanelsFromEditCard();
// //                   },
// //                 ),
// //               ),
// //               const Divider(height: 8, thickness: 1),
// //               Text("Solar Panels : ${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontSize: 11)),
// //               Text("KW : ${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(1)}", style: const TextStyle(fontSize: 11)),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //   Widget _buildDrawingControls() {
// //     return Positioned(
// //       bottom: 20,
// //       left: 0,
// //       right: 0,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Card(
// //               elevation: 4,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Obx(() => Text(
// //                       'Area: ${controller.showInMeters.value ? '${controller.polygonArea.toStringAsFixed(2)} m²' : '${(controller.polygonArea.value * 10.764).toStringAsFixed(2)} ft²'}',
// //                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
// //                     )),
// //                     const SizedBox(width: 16),
// //                     Container(height: 30, width: 1, color: Colors.grey.shade300),
// //                     IconButton(
// //                       icon: const Icon(Icons.undo, size: 22, color: AppColors.primaryBlue),
// //                       onPressed: controller.undoLastPoint,
// //                       tooltip: "Undo last point",
// //                     ),
// //                     Container(height: 30, width: 1, color: Colors.grey.shade300),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         if (controller.completeTerraceDrawing()) {
// //                           _showStructureTableDialog();
// //                         } else {
// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             const SnackBar(content: Text("Invalid polygon! Lines cannot cross each other."), backgroundColor: Colors.red),
// //                           );
// //                         }
// //                       },
// //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //                       child: const Text("Done", style: TextStyle(color: Colors.white)),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTerraceEditControls() {
// //     return Positioned(
// //       bottom: 20,
// //       left: 0,
// //       right: 0,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Card(
// //               elevation: 4,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Obx(() => Text(
// //                       'Area: ${controller.showInMeters.value ? '${controller.polygonArea.toStringAsFixed(2)} m²' : '${(controller.polygonArea.value * 10.764).toStringAsFixed(2)} ft²'}',
// //                       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
// //                     )),
// //                     const SizedBox(width: 16),
// //                     Container(height: 30, width: 1, color: Colors.grey.shade300),
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         if (controller.saveEditedTerrace()) {
// //                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Terrace updated"), backgroundColor: Colors.green));
// //                         } else {
// //                           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid polygon! Lines cannot cross."), backgroundColor: Colors.red));
// //                         }
// //                       },
// //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //                       child: const Text("Save", style: TextStyle(color: Colors.white)),
// //                     ),
// //                     const SizedBox(width: 8),
// //                     OutlinedButton(
// //                       onPressed: () => controller.cancelEditingTerrace(),
// //                       style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //                       child: const Text("Cancel", style: TextStyle(color: Colors.red)),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildSaveEditControls() {
// //     return Positioned(
// //       bottom: 20,
// //       left: 0,
// //       right: 0,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Card(
// //               elevation: 4,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Obx(() => Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text("Panels: ${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
// //                         Text("KW: ${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(2)}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
// //                       ],
// //                     )),
// //                     const SizedBox(width: 16),
// //                     Container(height: 40, width: 1, color: Colors.grey.shade300),
// //                     ElevatedButton.icon(
// //                       onPressed: () => _showEditChoiceDialog(),
// //                       icon: const Icon(Icons.edit, size: 18),
// //                       label: const Text("Edit"),
// //                       style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //                     ),
// //                     const SizedBox(width: 8),
// //                     ElevatedButton.icon(
// //                       onPressed: () {
// //                         controller.saveTerrace();
// //                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Building saved successfully"), backgroundColor: Colors.green));
// //                       },
// //                       icon: const Icon(Icons.save, size: 18),
// //                       label: const Text("Save"),
// //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildSavedEditControls() {
// //     return Positioned(
// //       bottom: 20,
// //       left: 0,
// //       right: 0,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 16),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Card(
// //               elevation: 4,
// //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //               child: Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     Obx(() => Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text("Panels: ${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
// //                         Text("KW: ${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(2)}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
// //                       ],
// //                     )),
// //                     const SizedBox(width: 16),
// //                     Container(height: 40, width: 1, color: Colors.grey.shade300),
// //                     ElevatedButton.icon(
// //                       onPressed: () => _showEditChoiceDialog(),
// //                       icon: const Icon(Icons.edit, size: 18),
// //                       label: const Text("Edit"),
// //                       style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _showEditChoiceDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: const Text("Edit Options"),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             ListTile(
// //               leading: const Icon(Icons.solar_power, color: AppColors.primaryBlue),
// //               title: const Text("Edit Panel Configuration"),
// //               subtitle: const Text("Change panel count, watt, etc."),
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 // Re‑show structure table + panel configuration dialogs
// //                 _showStructureTableDialog();
// //               },
// //             ),
// //             const Divider(),
// //             ListTile(
// //               leading: const Icon(Icons.edit_location, color: Colors.orange),
// //               title: const Text("Edit Terrace Shape"),
// //               subtitle: const Text("Move terrace boundary points and adjust layout"),
// //               onTap: () {
// //                 Navigator.pop(context);
// //                 controller.startEditingTerrace();
// //               },
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildFAB() {
// //     return Obx(() {
// //       if ((controller.isSelectingArea.value && controller.isDrawingTerrace.value) || (controller.isSelectingArea.value && controller.isEditingTerrace.value)) {
// //         return const SizedBox();
// //       }
// //       if (controller.hasPanels.value && !controller.isSaved.value) return const SizedBox();
// //       if (controller.hasPanels.value && controller.isSaved.value) return const SizedBox();
// //       return FloatingActionButton.extended(
// //         heroTag: "select_area",
// //         foregroundColor: Colors.white,
// //         backgroundColor: AppColors.primaryBlue,
// //         onPressed: () {
// //           if (controller.buildings.isEmpty) {
// //             _showCreateBuildingDialog();
// //           } else if (controller.currentBuilding == null || controller.currentBuilding!.terracePoints.isEmpty) {
// //             controller.isSelectingArea.value = true;
// //             controller.isDrawingTerrace.value = true;
// //           } else {
// //             _showBuildingSelectionDialog();
// //           }
// //         },
// //         icon: const Icon(Icons.draw),
// //         label: const Text("Select Area"),
// //       );
// //     });
// //   }
// //
// //   // ==================== Dialogs ====================
// //   void _showCreateBuildingDialog() {
// //     buildingNameController.clear();
// //     customerNameController.clear();
// //     customerMobileController.clear();
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //         title: const Text("Create New Building", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             TextFormField(controller: customerNameController, decoration: const InputDecoration(labelText: "Customer Name", border: OutlineInputBorder(), prefixIcon: Icon(Icons.person))),
// //             const SizedBox(height: 12),
// //             TextFormField(controller: customerMobileController, keyboardType: TextInputType.phone, inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly], decoration: const InputDecoration(labelText: "Mobile Number", border: OutlineInputBorder(), prefixIcon: Icon(Icons.phone))),
// //             const SizedBox(height: 12),
// //             TextFormField(controller: buildingNameController, decoration: const InputDecoration(labelText: "Building Name", border: OutlineInputBorder(), prefixIcon: Icon(Icons.business))),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
// //           ElevatedButton(
// //             onPressed: () {
// //               if (buildingNameController.text.isEmpty) {
// //                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter building name"), backgroundColor: Colors.red));
// //                 return;
// //               }
// //               controller.createNewBuilding(buildingNameController.text, customerNameController.text, customerMobileController.text);
// //               Navigator.pop(context);
// //             },
// //             style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
// //             child: const Text("Create"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void _showBuildingSelectionDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //         title: const Text("Select Building", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             ...controller.buildings.map((building) => ListTile(
// //               leading: const Icon(Icons.business, color: AppColors.primaryBlue),
// //               title: Text(building.name, style: const TextStyle(fontWeight: FontWeight.w500)),
// //               subtitle: Text("${building.customerName} | ${building.customerMobile}"),
// //               trailing: building.terracePoints.isNotEmpty ? const Icon(Icons.check_circle, color: Colors.green, size: 20) : null,
// //               onTap: () {
// //                 controller.selectBuilding(building.id);
// //                 Navigator.pop(context);
// //                 if (building.terracePoints.isEmpty) {
// //                   controller.isSelectingArea.value = true;
// //                   controller.isDrawingTerrace.value = true;
// //                 }
// //               },
// //             )),
// //             const Divider(),
// //             TextButton.icon(onPressed: () { Navigator.pop(context); _showCreateBuildingDialog(); }, icon: const Icon(Icons.add), label: const Text("Create New Building")),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _showStructureTableDialog() {
// //     _tempTerraceType = controller.terraceType.value;
// //     _tempStructureType = controller.structureType.value;
// //     _tempInverterPosition = controller.inverterPosition.value;
// //     _tempIsMeterOrFeet = controller.isMeterOrFeet.value;
// //     _tempFrontLegHeight = controller.frontLegHeight.value;
// //     _tempBackLegHeight = controller.backLegHeight.value;
// //
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (context) => StatefulBuilder(
// //         builder: (context, setState) {
// //           return AlertDialog(
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //             title: const Text("Structure Table", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //             content: SingleChildScrollView(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: "Terrace Type", border: OutlineInputBorder()),
// //                     value: _tempTerraceType,
// //                     items: controller.terraceTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
// //                     onChanged: (value) => setState(() { if (value != null) _tempTerraceType = value; }),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: "Type of Structure", border: OutlineInputBorder()),
// //                     value: _tempStructureType,
// //                     items: controller.structureTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
// //                     onChanged: (value) => setState(() { if (value != null) _tempStructureType = value; }),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: "Inverter Position", border: OutlineInputBorder()),
// //                     value: _tempInverterPosition,
// //                     items: controller.inverterPositions.map((pos) => DropdownMenuItem(value: pos, child: Text(pos))).toList(),
// //                     onChanged: (value) => setState(() { if (value != null) _tempInverterPosition = value; }),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   Row(children: [const Text("Meter"), Switch(value: _tempIsMeterOrFeet, onChanged: (value) => setState(() { _tempIsMeterOrFeet = value; }), activeColor: AppColors.primaryBlue), const Text("Feet")]),
// //                   const SizedBox(height: 12),
// //                   Row(children: [
// //                     Expanded(child: TextFormField(
// //                       readOnly: true,
// //                       controller: TextEditingController(text: _tempFrontLegHeight.toString()),
// //                       decoration: InputDecoration(
// //                         labelText: _tempIsMeterOrFeet ? "Front Leg Height (Feet)" : "Front Leg Height (Meter)",
// //                         border: const OutlineInputBorder(),
// //                         suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
// //                           IconButton(icon: const Icon(Icons.arrow_drop_up, size: 24), onPressed: () => setState(() { _tempFrontLegHeight++; })),
// //                           IconButton(icon: const Icon(Icons.arrow_drop_down, size: 24), onPressed: () => setState(() { if (_tempFrontLegHeight > 0) _tempFrontLegHeight--; })),
// //                         ]),
// //                       ),
// //                     )),
// //                   ]),
// //                   const SizedBox(height: 12),
// //                   Row(children: [
// //                     Expanded(child: TextFormField(
// //                       readOnly: true,
// //                       controller: TextEditingController(text: _tempBackLegHeight.toString()),
// //                       decoration: InputDecoration(
// //                         labelText: _tempIsMeterOrFeet ? "Back Leg Height (Feet)" : "Back Leg Height (Meter)",
// //                         border: const OutlineInputBorder(),
// //                         suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
// //                           IconButton(icon: const Icon(Icons.arrow_drop_up, size: 24), onPressed: () => setState(() { _tempBackLegHeight++; })),
// //                           IconButton(icon: const Icon(Icons.arrow_drop_down, size: 24), onPressed: () => setState(() { if (_tempBackLegHeight > 0) _tempBackLegHeight--; })),
// //                         ]),
// //                       ),
// //                     )),
// //                   ]),
// //                 ],
// //               ),
// //             ),
// //             actions: [
// //               TextButton(onPressed: () { Navigator.pop(context); controller.isSelectingArea.value = true; controller.isDrawingTerrace.value = true; }, child: const Text("Back")),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   controller.saveStructureDetails(
// //                     terraceTypeVal: _tempTerraceType,
// //                     structureTypeVal: _tempStructureType,
// //                     inverterPositionVal: _tempInverterPosition,
// //                     isMeterOrFeetVal: _tempIsMeterOrFeet,
// //                     frontLegHeightVal: _tempFrontLegHeight,
// //                     backLegHeightVal: _tempBackLegHeight,
// //                   );
// //                   Navigator.pop(context);
// //                   _showPanelConfigurationDialog();
// //                 },
// //                 style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
// //                 child: const Text("Next"),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   void _showPanelConfigurationDialog() {
// //     _tempProjectType = controller.selectedProjectType.value;
// //     _tempTechnology = controller.selectedTechnology.value;
// //     _tempPanelWatt = controller.selectedPanelWatt.value;
// //     _tempKilowatt = controller.selectedKilowatt.value;
// //     _tempPanelCount = controller.selectedPanelCount.value;
// //
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false,
// //       builder: (context) => StatefulBuilder(
// //         builder: (context, setState) {
// //           return AlertDialog(
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //             title: const Text("Configure Solar Panels", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //             content: SingleChildScrollView(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: "Project Type", border: OutlineInputBorder()),
// //                     value: _tempProjectType.isEmpty ? null : _tempProjectType,
// //                     items: controller.projectTypes.map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
// //                     onChanged: (value) => setState(() { if (value != null) _tempProjectType = value; }),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: "Technology", border: OutlineInputBorder()),
// //                     value: _tempTechnology.isEmpty ? null : _tempTechnology,
// //                     items: controller.technologies.map((tech) => DropdownMenuItem(value: tech, child: Text(tech))).toList(),
// //                     onChanged: (value) => setState(() { if (value != null) _tempTechnology = value; }),
// //                   ),
// //                   const SizedBox(height: 12),
// //                   DropdownButtonFormField<String>(
// //                     decoration: const InputDecoration(labelText: "Panel Watt", border: OutlineInputBorder()),
// //                     value: _tempPanelWatt,
// //                     items: controller.panelWatts.map((watt) => DropdownMenuItem(value: watt, child: Text("$watt W"))).toList(),
// //                     onChanged: (value) {
// //                       if (value != null) {
// //                         setState(() { _tempPanelWatt = value; });
// //                         if (_tempKilowatt.isNotEmpty) {
// //                           double kw = double.parse(_tempKilowatt);
// //                           int watt = int.parse(value);
// //                           setState(() { _tempPanelCount = ((kw * 1000) / watt).ceil(); });
// //                         }
// //                       }
// //                     },
// //                   ),
// //                   const SizedBox(height: 12),
// //                   if (controller.currentMode.value == 1) ...[
// //                     DropdownButtonFormField<String>(
// //                       decoration: const InputDecoration(labelText: "Select Kilowatt", border: OutlineInputBorder()),
// //                       value: _tempKilowatt.isEmpty ? null : _tempKilowatt,
// //                       items: controller.kilowattOptions.map((kw) => DropdownMenuItem(value: kw, child: Text("$kw KW"))).toList(),
// //                       onChanged: (value) {
// //                         if (value != null) {
// //                           setState(() { _tempKilowatt = value; });
// //                           double kw = double.parse(value);
// //                           int watt = int.parse(_tempPanelWatt);
// //                           setState(() { _tempPanelCount = ((kw * 1000) / watt).ceil(); });
// //                         }
// //                       },
// //                     ),
// //                     const SizedBox(height: 12),
// //                     TextFormField(readOnly: true, decoration: const InputDecoration(labelText: "Number of Panels", border: OutlineInputBorder()), controller: TextEditingController(text: _tempPanelCount.toString())),
// //                   ] else if (controller.currentMode.value == 2) ...[
// //                     Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)), child: const Text("Panels will fill the entire terrace area", style: TextStyle(color: Colors.blue))),
// //                   ],
// //                 ],
// //               ),
// //             ),
// //             actions: [
// //               TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   controller.savePanelConfiguration(
// //                     projectType: _tempProjectType,
// //                     technology: _tempTechnology,
// //                     panelWatt: _tempPanelWatt,
// //                     kilowatt: _tempKilowatt,
// //                     panelCount: _tempPanelCount,
// //                   );
// //                   Navigator.pop(context);
// //                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_tempPanelCount} panels placed"), backgroundColor: Colors.green));
// //                 },
// //                 style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
// //                 child: const Text("Show Panels"),
// //               ),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   void _showBOMDialog() {
// //     controller.calculateBOM();
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         final building = controller.currentBuilding!;
// //         return Dialog(
// //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //           child: Container(
// //             width: MediaQuery.of(context).size.width * 0.9,
// //             constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
// //             padding: const EdgeInsets.all(16),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.min,
// //               children: [
// //                 const Text("Bill of Materials", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //                 const SizedBox(height: 16),
// //                 Expanded(
// //                   child: SingleChildScrollView(
// //                     child: Column(
// //                       children: [
// //                         _buildBOMSection("Standard Pipes", [
// //                           {"item": "60 x 40", "qty": building.f6040, "unit": "Pipes"},
// //                           {"item": "40 x 40", "qty": building.f4040, "unit": "Pipes"},
// //                           {"item": "Extra Pipes", "qty": building.extraPipes, "unit": "Pipes"},
// //                         ]),
// //                         const SizedBox(height: 16),
// //                         _buildBOMSection("Accessories", [
// //                           {"item": "L - Angle", "qty": building.lAngle_qty, "unit": "Pcs"},
// //                           {"item": "American Bolt", "qty": building.americanBolt_qty, "unit": "Pcs"},
// //                           {"item": "Zink Spray", "qty": building.zink_qty, "unit": "Pcs"},
// //                           {"item": "J Bolt", "qty": building.jBolt_qty, "unit": "Pcs"},
// //                           {"item": "Foundation", "qty": building.foundation_qty, "unit": "Pcs"},
// //                         ]),
// //                         const SizedBox(height: 16),
// //                         _buildBOMSection("Wires", [
// //                           {"item": "DC Wire", "qty": building.dcWire_meter, "unit": "Meter"},
// //                           {"item": "AC Wire", "qty": building.acWire_meter, "unit": "Meter"},
// //                         ]),
// //                         const SizedBox(height: 16),
// //                         Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.orange.shade50, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.orange)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text("Total KG:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text("${building.totalKg.toStringAsFixed(2)} KG", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange))])),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 16),
// //                 ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue), child: const Text("Close")),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// //
// //   Widget _buildBOMSection(String title, List<Map<String, dynamic>> items) {
// //     return Container(
// //       decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(8)),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))), child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14))),
// //           ...items.map((item) => Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(item["item"]), Text("${item["qty"]} ${item["unit"]}")]))),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // ==================== Map markers, polygons, polylines ====================
// //   Set<Marker> _buildMarkers() {
// //     final markers = <Marker>{};
// //     if (!controller.isSelectingArea.value) {
// //       markers.add(Marker(markerId: const MarkerId("PickLocation"), position: controller.pickedLocation.value, icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
// //     }
// //     markers.addAll(controller.distanceMarkers);
// //     if ((controller.isSelectingArea.value && controller.isDrawingTerrace.value) || (controller.isSelectingArea.value && controller.isEditingTerrace.value)) {
// //       markers.addAll(controller.polygonPoints.asMap().entries.map((entry) {
// //         final idx = entry.key;
// //         final point = entry.value;
// //         return Marker(
// //           draggable: controller.isEditingTerrace.value,
// //           onDragEnd: (newPos) => controller.isEditingTerrace.value ? controller.updatePolygonPoint(idx, newPos) : controller.polygonPoints[idx] = newPos,
// //           markerId: MarkerId('polygon_point_$idx'),
// //           position: point,
// //           icon: controller.boundaryIcon.value,
// //           infoWindow: InfoWindow(
// //             title: 'Point ${idx + 1}',
// //             snippet: controller.isEditingTerrace.value ? "Drag to move" : "Tap to delete",
// //             onTap: () => !controller.isEditingTerrace.value ? controller.removePolygonPoint(idx) : null,
// //           ),
// //         );
// //       }));
// //     }
// //     // Panel drag handle – only in As Per KW mode
// //     if (controller.currentMode.value == 1 && controller.hasPanels.value && controller.currentBuilding != null && controller.currentBuilding!.panels.isNotEmpty && controller.isEditingTerrace.value) {
// //       markers.add(Marker(
// //         markerId: const MarkerId('drag_handle'),
// //         position: controller.dragHandlePosition.value,
// //         icon: controller.panelDragIcon.value,
// //         draggable: true,
// //         onDragStart: (position) {
// //           HapticFeedback.vibrate();
// //           controller.originalPanelCenters.value = List<LatLng>.from(controller.currentBuilding!.panels);
// //           controller.isDraggingPanels.value = true;
// //           controller.dragStartPoint = position;
// //           controller.dragHandlePosition.value = position;
// //         },
// //         onDrag: (position) {
// //           if (controller.editingTerraceIndex.value != -1 && controller.isDraggingPanels.value) {
// //             final latDelta = position.latitude - controller.dragHandlePosition.value.latitude;
// //             final lngDelta = position.longitude - controller.dragHandlePosition.value.longitude;
// //             controller.dragHandlePosition.value = position;
// //             controller.moveAllPanels(latDelta, lngDelta);
// //           }
// //         },
// //         onDragEnd: (position) {
// //           controller.isDraggingPanels.value = false;
// //           controller.originalPanelCenters.clear();
// //           if (controller.currentBuilding != null && controller.currentBuilding!.panels.isNotEmpty) {
// //             final newCenter = controller.getPanelsCenter(controller.currentBuilding!.panels);
// //             controller.dragHandlePosition.value = newCenter;
// //           }
// //         },
// //       ));
// //     }
// //     return markers;
// //   }
// //
// //   Set<Polygon> _buildPolygons() {
// //     final polygons = <Polygon>{};
// //     if ((controller.isSelectingArea.value && controller.isDrawingTerrace.value) || (controller.isSelectingArea.value && controller.isEditingTerrace.value)) {
// //       if (controller.polygonPoints.length >= 3) {
// //         polygons.add(Polygon(
// //           polygonId: const PolygonId('current_area'),
// //           points: List<LatLng>.from(controller.polygonPoints),
// //           strokeWidth: 3,
// //           strokeColor: controller.isEditingTerrace.value ? Colors.blue : Colors.yellow,
// //           fillColor: (controller.isEditingTerrace.value ? Colors.blue : Colors.yellow).withOpacity(0.15),
// //         ));
// //       }
// //     }
// //     if (controller.currentBuilding != null && controller.currentBuilding!.terracePoints.isNotEmpty) {
// //       final isSelected = controller.selectedBuildingId.value == controller.currentBuilding!.id;
// //       polygons.add(Polygon(
// //         polygonId: const PolygonId('saved_terrace'),
// //         points: List<LatLng>.from(controller.currentBuilding!.terracePoints),
// //         strokeWidth: isSelected ? 4 : 2,
// //         strokeColor: isSelected ? Colors.green : Colors.blue,
// //         fillColor: (isSelected ? Colors.green : Colors.blue).withOpacity(0.1),
// //       ));
// //     }
// //     polygons.addAll(controller.solarPanelsPolygons);
// //     if (controller.currentWalkways.isNotEmpty) polygons.addAll(controller.currentWalkways.map((w) => w.toPolygon()));
// //     return polygons;
// //   }
// //
// //   Set<Polyline> _buildPolylines() {
// //     final polylines = <Polyline>{};
// //     for (int i = 0; i < controller.currentHandRailPoints.length; i += 2) {
// //       if (i + 1 < controller.currentHandRailPoints.length) polylines.add(Polyline(polylineId: PolylineId('handrail_${i ~/ 2}'), points: [controller.currentHandRailPoints[i], controller.currentHandRailPoints[i + 1]], color: Colors.black, width: 5));
// //     }
// //     return polylines;
// //   }
// //
// //   // ==================== Drawer ====================
// //   Widget _buildDrawer() {
// //     return Drawer(
// //       width: screenWidth * 0.7,
// //       backgroundColor: Colors.white,
// //       child: SafeArea(
// //         child: Column(
// //           children: [
// //             Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(gradient: LinearGradient(colors: [AppColors.primaryBlue, AppColors.primaryBlue.withOpacity(0.8)])), child: Row(children: [const CircleAvatar(backgroundColor: Colors.white, radius: 24, child: Icon(Icons.business, color: AppColors.primaryBlue, size: 28)), const SizedBox(width: 16), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text("Buildings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)), Obx(() => Text("${controller.buildings.length} Building${controller.buildings.length != 1 ? 's' : ''}", style: const TextStyle(color: Colors.white70, fontSize: 14)))])), ])),
// //             Expanded(
// //               child: Obx(() {
// //                 if (controller.buildings.isEmpty) return const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.business_outlined, size: 64, color: Colors.grey), SizedBox(height: 16), Text("No buildings yet.", style: TextStyle(color: Colors.grey, fontSize: 16)), SizedBox(height: 8), Text("Tap + to add one.", style: TextStyle(color: Colors.grey))]));
// //                 return ListView.builder(
// //                   padding: const EdgeInsets.all(12),
// //                   itemCount: controller.buildings.length,
// //                   itemBuilder: (context, index) {
// //                     final building = controller.buildings[index];
// //                     final isSelected = controller.selectedBuildingId.value == building.id;
// //                     return Card(
// //                       elevation: isSelected ? 4 : 1,
// //                       margin: const EdgeInsets.only(bottom: 12),
// //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: isSelected ? BorderSide(color: AppColors.primaryBlue, width: 2) : BorderSide.none),
// //                       child: InkWell(
// //                         onTap: () => controller.selectBuilding(building.id),
// //                         borderRadius: BorderRadius.circular(12),
// //                         child: Padding(
// //                           padding: const EdgeInsets.all(16),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Row(children: [Expanded(child: Text(building.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isSelected ? AppColors.primaryBlue : Colors.black87))), if (building.terracePoints.isNotEmpty && building.panels.isNotEmpty) Container(margin: const EdgeInsets.only(right: 8), child: InkWell(onTap: () { controller.selectBuilding(building.id); _showBOMDialog(); }, child: Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(20)), child: const Text("BOM", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))))), IconButton(icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red), onPressed: () { showDialog(context: context, builder: (context) => AlertDialog(title: const Text("Delete Building"), content: Text("Are you sure you want to delete '${building.name}'?"), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")), TextButton(onPressed: () { controller.deleteBuilding(building.id); Navigator.pop(context); }, style: TextButton.styleFrom(foregroundColor: Colors.red), child: const Text("Delete"))])); }) ]),
// //                               const SizedBox(height: 8),
// //                               Row(children: [Icon(Icons.person, size: 14, color: isSelected ? AppColors.primaryBlue : Colors.grey), const SizedBox(width: 4), Text(building.customerName, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.primaryBlue : Colors.grey[600]))]),
// //                               const SizedBox(height: 4),
// //                               Row(children: [Icon(Icons.phone, size: 14, color: isSelected ? AppColors.primaryBlue : Colors.grey), const SizedBox(width: 4), Text(building.customerMobile, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.primaryBlue : Colors.grey[600]))]),
// //                               const SizedBox(height: 12),
// //                               Wrap(spacing: 8, runSpacing: 8, children: [
// //                                 if (building.terracePoints.isNotEmpty) _buildStatusChip("Terrace", Icons.draw, isSelected ? AppColors.primaryBlue : Colors.green),
// //                                 if (building.panels.isNotEmpty) _buildStatusChip("${building.panels.length} Panels", Icons.solar_power, isSelected ? AppColors.primaryBlue : Colors.blue),
// //                                 if (building.isSaved) _buildStatusChip("Saved", Icons.check_circle, isSelected ? AppColors.primaryBlue : Colors.green),
// //                               ]),
// //                               if (building.totalKw > 0) Padding(padding: const EdgeInsets.only(top: 8), child: Text("${building.totalKw.toStringAsFixed(2)} KW", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isSelected ? AppColors.primaryBlue : AppColors.primaryBlue.withOpacity(0.7)))),
// //                             ],
// //                           ),
// //                         ),
// //                       ),
// //                     );
// //                   },
// //                 );
// //               }),
// //             ),
// //             Padding(padding: const EdgeInsets.all(16), child: ElevatedButton.icon(onPressed: _showCreateBuildingDialog, icon: const Icon(Icons.add, size: 20), label: const Text("New Building", style: TextStyle(fontSize: 14)), style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue, foregroundColor: Colors.white, minimumSize: const Size(double.infinity, 48), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))))),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildStatusChip(String label, IconData icon, Color color) {
// //     return Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(16)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 12, color: color), const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500))]));
// //   }
// // }
//
//
// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:solarkits_new/models/comanItem_model.dart';
// import '../../controller/unfied_map_controller.dart';
//
// import '../../constants.dart';
//
// class UnifiedSurveyScreen extends StatefulWidget {
//   final String? willQuote;
//
//   const UnifiedSurveyScreen({super.key, this.willQuote});
//
//   @override
//   State<UnifiedSurveyScreen> createState() => _UnifiedSurveyScreenState();
// }
//
// class _UnifiedSurveyScreenState extends State<UnifiedSurveyScreen> {
//
//
//   final UnifiedSurveyController controller = Get.put(UnifiedSurveyController());
//   final TextEditingController customerNameController = TextEditingController();
//   final TextEditingController customerMobileController = TextEditingController();
//
//   double screenWidth = 0.0;
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // Dialog local state variables
//   String _tempTerraceType = "Rcc Roof";
//   String _tempStructureType = "Hot dig Gi(Galvanised iron)";
//   String _tempInverterPosition = "Ground Floor";
//   bool _tempIsMeterOrFeet = true;
//   int _tempFrontLegHeight = 0;
//   int _tempBackLegHeight = 0;
//
//   String _tempProjectType = "";
//   String _tempTechnology = "";
//   String _tempPanelWatt = "545";
//   String _tempKilowatt = "";
//   int _tempPanelCount = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     screenWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: _buildDrawer(),
//       appBar: _buildAppBar(),
//       body: _buildBody(),
//       floatingActionButton: _buildFAB(),
//     );
//   }
//
//   @override
//   void dispose() {
//     Get.delete<UnifiedSurveyController>();
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   PreferredSizeWidget _buildAppBar() {
//     return AppBar(
//       backgroundColor: AppColors.primaryBlue,
//       elevation: 1,
//       title: const Text("Solar Survey",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//       actions: [
//         Obx(() =>
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.white, width: 1),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   InkWell(
//                     onTap: () => controller.switchMode(1),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: controller.currentMode.value == 1
//                             ? Colors.white
//                             : Colors.transparent,
//                         borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(7),
//                             bottomLeft: Radius.circular(7)),
//                       ),
//                       child: Text(
//                         "As Per KW",
//                         style: TextStyle(fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                             color: controller.currentMode.value == 1 ? AppColors
//                                 .primaryBlue : Colors.white),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () => controller.switchMode(2),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       decoration: BoxDecoration(
//                         color: controller.currentMode.value == 2
//                             ? Colors.white
//                             : Colors.transparent,
//                         borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(7),
//                             bottomRight: Radius.circular(7)),
//                       ),
//                       child: Text(
//                         "As Per Space",
//                         style: TextStyle(fontWeight: FontWeight.bold,
//                             fontSize: 12,
//                             color: controller.currentMode.value == 2 ? AppColors
//                                 .primaryBlue : Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )),
//         IconButton(
//           icon: Obx(() =>
//               Icon(controller.showStreetView.value ? Icons.map : Icons
//                   .streetview, color: Colors.white)),
//           onPressed: () => controller.showStreetView.toggle(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBody() {
//     return Obx(() =>
//     controller.showStreetView.value ? const Center(
//         child: Text("Street View Coming Soon")) : _buildMapView());
//   }
//
//   Widget _buildMapView() {
//     return Column(
//       children: [
//         Expanded(
//           child: Stack(
//             children: [
//               GoogleMap(
//                 zoomGesturesEnabled: true,
//                 zoomControlsEnabled: false,
//                 mapType: MapType.satellite,
//                 initialCameraPosition: CameraPosition(
//                     target: controller.pickedLocation.value, zoom: 18),
//                 onMapCreated: (mapCtrl) => controller.mapController = mapCtrl,
//                 onTap: (argument) {
//                   if (controller.isDrawingHandRail.value) {
//                     // Hand rail drawing logic if needed
//                   } else if (controller.isSelectingArea.value &&
//                       controller.isDrawingTerrace.value) {
//                     controller.addPolygonPoint(argument);
//                   }
//                   controller.pickedLocation.value = argument;
//                 },
//                 markers: _buildMarkers(),
//                 polygons: _buildPolygons(),
//                 polylines: _buildPolylines(),
//               ),
//               if (controller.isSelectingArea.value &&
//                   controller.isDrawingTerrace.value) _buildDrawingControls(),
//               if (controller.isSelectingArea.value &&
//                   controller.isEditingTerrace
//                       .value) _buildTerraceEditControls(),
//               if (controller.hasPanels.value && !controller.isSaved.value &&
//                   controller.currentBuilding != null) _buildSaveEditControls(),
//               if (controller.hasPanels.value && controller.isSaved.value &&
//                   controller.currentBuilding != null &&
//                   !controller.isSelectingArea.value &&
//                   !controller.isEditingTerrace.value) _buildSavedEditControls(),
//               // Panel edit card (top-right)
//               Positioned(
//                 top: 10,
//                 right: 10,
//                 child: Obx(() =>
//                 controller.isEditingTerraceLayout.value
//                     ? _buildEditCard()
//                     : const SizedBox()),
//               ),
//               // Walkway edit card (top-left)
//               Positioned(
//                 top: 10,
//                 left: 10,
//                 child: Obx(() =>
//                 controller.isEditingTerraceLayout.value &&
//                     controller.isEditingWalkway.value
//                     ? _buildWalkwayEditCard()
//                     : const SizedBox()),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   // ==================== Panel Edit Card (top-right) ====================
//   Widget _buildEditCard() {
//     return Container(
//       width: MediaQuery
//           .of(context)
//           .size
//           .width * 0.42,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Text("Panel Layout", style: TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 13)),
//                 ],
//               ),
//               const Divider(height: 8, thickness: 1),
//               Row(
//                 children: [
//                   const Text("Orient: ", style: TextStyle(fontSize: 12)),
//                   CupertinoSlidingSegmentedControl(
//                     groupValue: controller.isHorizontal.value ? "H" : "V",
//                     thumbColor: AppColors.primaryBlue,
//                     children: const {"H": Text("H"), "V": Text("V")},
//                     onValueChanged: (value) {
//                       if (value != null) {
//                         controller.isHorizontal.value = value == "H";
//                         controller.updatePanelsFromEditCard();
//                         controller.updateAvailableRowsForEdit();
//                       }
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 6),
//               if (controller.currentMode.value == 1) ...[
//                 // Rows dropdown
//                 DropdownButtonFormField<int>(
//                   decoration: const InputDecoration(labelText: "Rows",
//                       border: OutlineInputBorder(),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4)),
//                   value: controller.availableRowsForEdit.contains(
//                       controller.selectedRows.value)
//                       ? controller.selectedRows.value
//                       : (controller.availableRowsForEdit.isNotEmpty ? controller
//                       .availableRowsForEdit.first : 1),
//                   items: controller.availableRowsForEdit.map((rows) =>
//                       DropdownMenuItem(
//                           value: rows, child: Text("$rows Row${rows > 1
//                           ? 's'
//                           : ''}"))).toList(),
//                   onChanged: (value) {
//                     if (value != null) {
//                       controller.selectedRows.value = value;
//                       controller.updatePanelsFromEditCard();
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 6),
//                 // Rows per Table dropdown (affects grouping)
//                 DropdownButtonFormField<int>(
//                   decoration: const InputDecoration(labelText: "Rows per Table",
//                       border: OutlineInputBorder(),
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4)),
//                   value: controller.groupRowsForKW.value,
//                   items: [1, 2, 3, 4, 5, 6].map((rows) =>
//                       DropdownMenuItem(
//                           value: rows, child: Text("$rows Row${rows > 1
//                           ? 's'
//                           : ''}"))).toList(),
//                   onChanged: (value) {
//                     if (value != null) {
//                       controller.groupRowsForKW.value = value;
//                       controller.updatePanelsFromEditCard();
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 6),
//               ] else
//                 ...[
//                   // As Per Space: Rows per Table dropdown
//                   DropdownButtonFormField<int>(
//                     decoration: const InputDecoration(
//                         labelText: "Rows per Table",
//                         border: OutlineInputBorder(),
//                         contentPadding: EdgeInsets.symmetric(
//                             horizontal: 8, vertical: 4)),
//                     value: controller.groupRowsForSpace.value,
//                     items: [1, 2, 3, 4, 5, 6].map((rows) =>
//                         DropdownMenuItem(
//                             value: rows, child: Text("$rows Row${rows > 1
//                             ? 's'
//                             : ''}"))).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         controller.groupRowsForSpace.value = value;
//                         controller.updatePanelsFromEditCard();
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 6),
//                 ],
//               // Padding slider
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                       "Padding: ${controller.paddingValue.value.toStringAsFixed(
//                           1)} m", style: const TextStyle(fontSize: 11)),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width * 0.4,
//                 child: Slider(
//                   label: '${controller.paddingValue.value.toStringAsFixed(1)}',
//                   value: controller.paddingValue.value,
//                   min: 0,
//                   max: 5,
//                   divisions: 50,
//                   activeColor: AppColors.primaryBlue,
//                   onChanged: (value) {
//                     controller.paddingValue.value = value;
//                     controller.updatePanelsFromEditCard();
//                   },
//                 ),
//               ),
//               // Row spacing slider
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text("Row Spacing: ${controller.rowSpacingValue.value
//                       .toStringAsFixed(1)} m",
//                       style: const TextStyle(fontSize: 11)),
//                 ],
//               ),
//               SizedBox(
//                 height: 30,
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width * 0.4,
//                 child: Slider(
//                   label: '${controller.rowSpacingValue.value.toStringAsFixed(
//                       1)}',
//                   value: controller.rowSpacingValue.value,
//                   min: 0,
//                   max: 5,
//                   divisions: 50,
//                   activeColor: AppColors.primaryBlue,
//                   onChanged: (value) {
//                     controller.rowSpacingValue.value = value;
//                     controller.updatePanelsFromEditCard();
//                   },
//                 ),
//               ),
//               const Divider(height: 8, thickness: 1),
//               Text(
//                   "Solar Panels : ${controller.currentBuilding?.panels.length ??
//                       0}", style: const TextStyle(fontSize: 11)),
//               Text("KW : ${(controller.currentBuilding?.totalKw ?? 0)
//                   .toStringAsFixed(1)}", style: const TextStyle(fontSize: 11)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ==================== Walkway Edit Card (top-left) ====================
//   Widget _buildWalkwayEditCard() {
//     if (controller.selectedWalkwayIndex.value < 0 ||
//         controller.selectedWalkwayIndex.value >=
//             controller.currentWalkways.length) {
//       return const SizedBox();
//     }
//     final walkway = controller.currentWalkways[controller.selectedWalkwayIndex
//         .value];
//     return Container(
//       width: MediaQuery
//           .of(context)
//           .size
//           .width * 0.42,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         child: Padding(
//           padding: const EdgeInsets.all(8),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Edit Walkway", style: TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 13)),
//                   IconButton(
//                     icon: const Icon(Icons.close, size: 16),
//                     padding: EdgeInsets.zero,
//                     constraints: const BoxConstraints(),
//                     onPressed: () => controller.stopEditingWalkway(),
//                   ),
//                 ],
//               ),
//               const Divider(height: 8, thickness: 1),
//               Row(
//                 children: [
//                   const Text("Orient: ", style: TextStyle(fontSize: 12)),
//                   CupertinoSlidingSegmentedControl(
//                     groupValue: walkway.isHorizontal ? "H" : "V",
//                     thumbColor: AppColors.primaryBlue,
//                     children: const {"H": Text("H"), "V": Text("V")},
//                     onValueChanged: (value) {
//                       if (value != null) {
//                         controller.toggleWalkwayOrientation(
//                             controller.selectedWalkwayIndex.value);
//                       }
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ==================== Drawing controls ====================
//   Widget _buildDrawingControls() {
//     return Positioned(
//       bottom: 20,
//       left: 0,
//       right: 0,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 16, vertical: 10),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Obx(() =>
//                         Text(
//                           'Area: ${controller.showInMeters.value
//                               ? '${controller.polygonArea.toStringAsFixed(
//                               2)} m²'
//                               : '${(controller.polygonArea.value * 10.764)
//                               .toStringAsFixed(2)} ft²'}',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 14),
//                         )),
//                     const SizedBox(width: 16),
//                     Container(
//                         height: 30, width: 1, color: Colors.grey.shade300),
//                     IconButton(
//                       icon: const Icon(
//                           Icons.undo, size: 22, color: AppColors.primaryBlue),
//                       onPressed: controller.undoLastPoint,
//                       tooltip: "Undo last point",
//                     ),
//                     Container(
//                         height: 30, width: 1, color: Colors.grey.shade300),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (controller.completeTerraceDrawing()) {
//                           _showStructureTableDialog();
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text(
//                                 "Invalid polygon! Lines cannot cross each other."),
//                                 backgroundColor: Colors.red),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                       child: const Text(
//                           "Done", style: TextStyle(color: Colors.white)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTerraceEditControls() {
//     return Positioned(
//       bottom: 20,
//       left: 0,
//       right: 0,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 16, vertical: 10),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Obx(() =>
//                         Text(
//                           'Area: ${controller.showInMeters.value
//                               ? '${controller.polygonArea.toStringAsFixed(
//                               2)} m²'
//                               : '${(controller.polygonArea.value * 10.764)
//                               .toStringAsFixed(2)} ft²'}',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 14),
//                         )),
//                     const SizedBox(width: 16),
//                     Container(
//                         height: 30, width: 1, color: Colors.grey.shade300),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (controller.saveEditedTerrace()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text("Terrace updated"),
//                                   backgroundColor: Colors.green));
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(content: Text(
//                                   "Invalid polygon! Lines cannot cross."),
//                                   backgroundColor: Colors.red));
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                       child: const Text(
//                           "Save", style: TextStyle(color: Colors.white)),
//                     ),
//                     const SizedBox(width: 8),
//                     OutlinedButton(
//                       onPressed: controller.cancelEditingTerrace,
//                       style: OutlinedButton.styleFrom(
//                           side: const BorderSide(color: Colors.red),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                       child: const Text(
//                           "Cancel", style: TextStyle(color: Colors.red)),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSaveEditControls() {
//     return Positioned(
//       bottom: 20,
//       left: 0,
//       right: 0,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 16, vertical: 10),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Obx(() =>
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Panels: ${controller.currentBuilding?.panels
//                                 .length ?? 0}", style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14)),
//                             Text("KW: ${(controller.currentBuilding?.totalKw ??
//                                 0).toStringAsFixed(2)}", style: TextStyle(
//                                 fontSize: 12, color: Colors.grey[600])),
//                           ],
//                         )),
//                     const SizedBox(width: 16),
//                     Container(
//                         height: 40, width: 1, color: Colors.grey.shade300),
//                     ElevatedButton.icon(
//                       onPressed: () => _showEditChoiceDialog(),
//                       icon: const Icon(Icons.edit, size: 18),
//                       label: const Text("Edit"),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryBlue,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                     ),
//                     const SizedBox(width: 8),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         controller.saveTerrace();
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text(
//                                 "Building saved successfully"),
//                                 backgroundColor: Colors.green));
//                       },
//                       icon: const Icon(Icons.save, size: 18),
//                       label: const Text("Save"),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSavedEditControls() {
//     return Positioned(
//       bottom: 20,
//       left: 0,
//       right: 0,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Card(
//               elevation: 4,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                     horizontal: 16, vertical: 10),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Obx(() =>
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Panels: ${controller.currentBuilding?.panels
//                                 .length ?? 0}", style: const TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 14)),
//                             Text("KW: ${(controller.currentBuilding?.totalKw ??
//                                 0).toStringAsFixed(2)}", style: TextStyle(
//                                 fontSize: 12, color: Colors.grey[600])),
//                           ],
//                         )),
//                     const SizedBox(width: 16),
//                     Container(
//                         height: 40, width: 1, color: Colors.grey.shade300),
//                     ElevatedButton.icon(
//                       onPressed: () => _showEditChoiceDialog(),
//                       icon: const Icon(Icons.edit, size: 18),
//                       label: const Text("Edit"),
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primaryBlue,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showEditChoiceDialog() {
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             title: const Text("Edit Options"),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   leading: const Icon(
//                       Icons.solar_power, color: AppColors.primaryBlue),
//                   title: const Text("Edit Panel Configuration"),
//                   subtitle: const Text(
//                       "Change panel count, orientation, spacing"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     _showStructureTableDialog();
//                   },
//                 ),
//                 const Divider(),
//                 ListTile(
//                   leading: const Icon(
//                       Icons.edit_location, color: Colors.orange),
//                   title: const Text("Edit Terrace Shape"),
//                   subtitle: const Text("Move terrace boundary points"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     controller.startEditingTerrace();
//                   },
//                 ),
//                 const Divider(),
//                 ListTile(
//                   leading: const Icon(Icons.timeline, color: Colors.green),
//                   title: const Text("Add Walkway"),
//                   subtitle: const Text("Add a walkway to the terrace"),
//                   onTap: () {
//                     Navigator.pop(context);
//                     controller.startAddingWalkway();
//                   },
//                 ),
//               ],
//             ),
//             actions: [
//               TextButton(onPressed: () => Navigator.pop(context),
//                   child: const Text("Cancel")),
//             ],
//           ),
//     );
//   }
//
//   Widget _buildFAB() {
//     return Obx(() {
//       if ((controller.isSelectingArea.value &&
//           controller.isDrawingTerrace.value) ||
//           (controller.isSelectingArea.value &&
//               controller.isEditingTerrace.value)) {
//         return const SizedBox();
//       }
//       if (controller.hasPanels.value && !controller.isSaved.value)
//         return const SizedBox();
//       if (controller.hasPanels.value && controller.isSaved.value)
//         return const SizedBox();
//       return FloatingActionButton.extended(
//         heroTag: "select_area",
//         foregroundColor: Colors.white,
//         backgroundColor: AppColors.primaryBlue,
//         onPressed: () {
//           if (controller.buildings.isEmpty) {
//             _showCreateBuildingDialog();
//           } else if (controller.currentBuilding == null ||
//               controller.currentBuilding!.terracePoints.isEmpty) {
//             controller.isSelectingArea.value = true;
//             controller.isDrawingTerrace.value = true;
//           } else {
//             _showBuildingSelectionDialog();
//           }
//         },
//         icon: const Icon(Icons.draw),
//         label: const Text("Select Area"),
//       );
//     });
//   }
//
//   // ==================== Dialogs ====================
//   void _showCreateBuildingDialog() {
//     customerNameController.clear();
//     customerMobileController.clear();
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16)),
//             title: const Text("Create New Building",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   TextFormField(controller: customerNameController,
//                       decoration: const InputDecoration(
//                           labelText: "Customer Name",
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.person))),
//                   const SizedBox(height: 12),
//                   TextFormField(controller: customerMobileController,
//                       keyboardType: TextInputType.phone,
//                       inputFormatters: [
//                         LengthLimitingTextInputFormatter(10),
//                         FilteringTextInputFormatter.digitsOnly
//                       ],
//                       decoration: const InputDecoration(
//                           labelText: "Mobile Number",
//                           border: OutlineInputBorder(),
//                           prefixIcon: Icon(Icons.phone))),
//                   const SizedBox(height: 12),
//                   Obx(() {
//                     return DropdownButtonFormField<CommonItemModel>(
//                       decoration: const InputDecoration(
//                           labelText: "Building Types",
//                           border: OutlineInputBorder()),
//                       items: controller.buildingTypes.map((type) =>
//                           DropdownMenuItem(value: type, child: Text(type.name)))
//                           .toList(),
//                       onChanged: (value) {
//                         if(value != null){
//                           controller.selectedBuildingType.value = value.id;
//                         }
//
//
//                       },
//                     );
//                   }),
//                   const SizedBox(height: 12),
//                   Obx(() {
//                     return DropdownButtonFormField<CommonItemModel>(
//                       decoration: const InputDecoration(
//                           labelText: "Select Category",
//                           border: OutlineInputBorder()),
//                       items: controller.categoryList
//                           .map((type) =>
//                           DropdownMenuItem(
//                               value: type, child: Text(type.name)))
//                           .toList(),
//                       onChanged: (value) {
//                         if (value != null) {
//                           controller.selectedCategoryId.value = value.id;
//                           controller.getSubCategory();
//                         }
//                       },
//                     );
//                   }),
//                   const SizedBox(height: 12),
//
//
//                   Obx(() {
//                     return DropdownButtonFormField<CommonItemModel>(
//                       decoration: const InputDecoration(
//                           labelText: "Select Sub Category",
//                           border: OutlineInputBorder()),
//                       items: controller.subCategoryList
//                           .map((type) =>
//                           DropdownMenuItem(
//                               value: type, child: Text(type.name)))
//                           .toList(),
//                       onChanged: (value) {
//                         if (value != null) {
//                           controller.selectedSubCategoryId.value = value.id;
//                           controller.getProjectTypes();
//                         }
//                       },
//                     );
//                   }),
//                   const SizedBox(height: 12),
//                   Obx(() {
//                     return DropdownButtonFormField<CommonItemModel>(
//                       decoration: const InputDecoration(
//                           labelText: "Selected Project Type",
//                           border: OutlineInputBorder()),
//                       items: controller.projectTypeList
//                           .map((type) =>
//                           DropdownMenuItem(value: type, child: Text(
//                               type.name)))
//                           .toList(),
//                       onChanged: (value) {
//                         if (value != null) {
//                           controller.selectedProjectTypeId.value = value.id;
//                           controller.selectedProjectType.value = value.name;
//                           controller.getSubProjectTypes();
//                         }
//                       },
//                     );
//                   }),
//
//                   const SizedBox(height: 12),
//                   Obx(() {
//                     return DropdownButtonFormField<CommonItemModel>(
//                       decoration: const InputDecoration(
//                           labelText: "Select Sub Project Type",
//                           border: OutlineInputBorder()),
//                       items: controller.subprojectTypeList
//                           .map((type) =>
//                           DropdownMenuItem(value: type, child: Text(
//                               type.name)))
//                           .toList(),
//                       onChanged: (value) {
//                         if (value != null) {
//                           controller.selectedSubprojectTypeId.value = value.id;
//                           controller.getSolarBrands();
//                         }
//                       },
//                     );
//                   }),
//                 ],
//               ),
//             ),
//             actions: [
//               TextButton(onPressed: () => Navigator.pop(context),
//                   child: const Text("Cancel")),
//               ElevatedButton(
//                 onPressed: () {
//                   if (customerNameController.text.isEmpty) {
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text("Please enter building name"),
//                         backgroundColor: Colors.red));
//                     return;
//                   }
//                   controller.createNewBuilding(
//                       customerNameController.text, customerNameController.text,
//                       customerMobileController.text,
//                       controller.selectedProjectType.value);
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.primaryBlue),
//                 child: const Text("Create"),
//               ),
//             ],
//           ),
//     );
//   }
//
//   void _showBuildingSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (context) =>
//           AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16)),
//             title: const Text("Select Building",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ...controller.buildings.map((building) =>
//                     ListTile(
//                       leading: const Icon(
//                           Icons.business, color: AppColors.primaryBlue),
//                       title: Text(building.name,
//                           style: const TextStyle(fontWeight: FontWeight.w500)),
//                       subtitle: Text("${building.customerName} | ${building
//                           .customerMobile}"),
//                       trailing: building.terracePoints.isNotEmpty
//                           ? const Icon(
//                           Icons.check_circle, color: Colors.green, size: 20)
//                           : null,
//                       onTap: () {
//                         controller.selectBuilding(building.id);
//                         Navigator.pop(context);
//                         if (building.terracePoints.isEmpty) {
//                           controller.isSelectingArea.value = true;
//                           controller.isDrawingTerrace.value = true;
//                         }
//                       },
//                     )),
//                 const Divider(),
//                 TextButton.icon(onPressed: () {
//                   Navigator.pop(context);
//                   _showCreateBuildingDialog();
//                 },
//                     icon: const Icon(Icons.add),
//                     label: const Text("Create New Building")),
//               ],
//             ),
//           ),
//     );
//   }
//
//   void _showStructureTableDialog() {
//     _tempTerraceType = controller.terraceType.value;
//     _tempStructureType = controller.structureType.value;
//     _tempInverterPosition = controller.inverterPosition.value;
//     _tempIsMeterOrFeet = controller.isMeterOrFeet.value;
//     _tempFrontLegHeight = controller.frontLegHeight.value;
//     _tempBackLegHeight = controller.backLegHeight.value;
//
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) =>
//           StatefulBuilder(
//             builder: (context, setState) {
//               return AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 title: const Text("Structure Table", style: TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold)),
//                 content: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Obx(() {
//                         return DropdownButtonFormField<CommonItemModel>(
//                           decoration: const InputDecoration(
//                               labelText: "Terrace Type",
//                               border: OutlineInputBorder()),
//                           // value: _tempTerraceType,
//                           items: controller.terraceTypesList
//                               .map((type) =>
//                               DropdownMenuItem(
//                                   value: type, child: Text(type.name)))
//                               .toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedTerraceTypeId.value = value.id;
//                             }
//                           },
//                         );
//                       }),
//                       const SizedBox(height: 12),
//                       Obx(() {
//                         return DropdownButtonFormField<CommonItemModel>(
//                           decoration: const InputDecoration(
//                               labelText: "Type of Structure",
//                               border: OutlineInputBorder()),
//                           items: controller.structureTypeList
//                               .map((type) =>
//                               DropdownMenuItem(
//                                   value: type, child: Text(type.name)))
//                               .toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedStructureTypeId.value =
//                                   value.id;
//                             }
//                           },
//                         );
//                       }),
//                       const SizedBox(height: 12),
//                       DropdownButtonFormField<CommonItemModel>(
//                         decoration: const InputDecoration(
//                             labelText: "Inverter Position",
//                             border: OutlineInputBorder()),
//                         items: controller.inverterPositionList
//                             .map((pos) =>
//                             DropdownMenuItem(value: pos, child: Text(pos.name)))
//                             .toList(),
//                         onChanged: (value) {
//                           if (value != null) {
//                             controller.selectedInverterPositionId.value =
//                                 value.id;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 12),
//                       Row(children: [
//                         const Text("Meter"),
//                         Switch(value: _tempIsMeterOrFeet,
//                             onChanged: (value) =>
//                                 setState(() {
//                                   _tempIsMeterOrFeet = value;
//                                 }),
//                             activeColor: AppColors.primaryBlue),
//                         const Text("Feet")
//                       ]),
//                       const SizedBox(height: 12),
//                       Row(children: [
//                         Expanded(child: TextFormField(
//                           readOnly: true,
//                           controller: TextEditingController(
//                               text: _tempFrontLegHeight.toString()),
//                           decoration: InputDecoration(
//                             labelText: _tempIsMeterOrFeet
//                                 ? "Front Leg Height (Feet)"
//                                 : "Front Leg Height (Meter)",
//                             border: const OutlineInputBorder(),
//                             suffixIcon: Row(
//                                 mainAxisSize: MainAxisSize.min, children: [
//                               IconButton(icon: const Icon(
//                                   Icons.arrow_drop_up, size: 24),
//                                   onPressed: () =>
//                                       setState(() {
//                                         _tempFrontLegHeight++;
//                                       })),
//                               IconButton(icon: const Icon(
//                                   Icons.arrow_drop_down, size: 24),
//                                   onPressed: () =>
//                                       setState(() {
//                                         if (_tempFrontLegHeight >
//                                             0) _tempFrontLegHeight--;
//                                       })),
//                             ]),
//                           ),
//                         )),
//                       ]),
//                       const SizedBox(height: 12),
//                       Row(children: [
//                         Expanded(child: TextFormField(
//                           readOnly: true,
//                           controller: TextEditingController(
//                               text: _tempBackLegHeight.toString()),
//                           decoration: InputDecoration(
//                             labelText: _tempIsMeterOrFeet
//                                 ? "Back Leg Height (Feet)"
//                                 : "Back Leg Height (Meter)",
//                             border: const OutlineInputBorder(),
//                             suffixIcon: Row(
//                                 mainAxisSize: MainAxisSize.min, children: [
//                               IconButton(icon: const Icon(
//                                   Icons.arrow_drop_up, size: 24),
//                                   onPressed: () =>
//                                       setState(() {
//                                         _tempBackLegHeight++;
//                                       })),
//                               IconButton(icon: const Icon(
//                                   Icons.arrow_drop_down, size: 24),
//                                   onPressed: () =>
//                                       setState(() {
//                                         if (_tempBackLegHeight >
//                                             0) _tempBackLegHeight--;
//                                       })),
//                             ]),
//                           ),
//                         )),
//                       ]),
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   TextButton(onPressed: () {
//                     Navigator.pop(context);
//                     controller.isSelectingArea.value = true;
//                     controller.isDrawingTerrace.value = true;
//                   }, child: const Text("Back")),
//                   ElevatedButton(
//                     onPressed: () {
//                       controller.saveStructureDetails(
//                         terraceTypeVal: _tempTerraceType,
//                         structureTypeVal: _tempStructureType,
//                         inverterPositionVal: _tempInverterPosition,
//                         isMeterOrFeetVal: _tempIsMeterOrFeet,
//                         frontLegHeightVal: _tempFrontLegHeight,
//                         backLegHeightVal: _tempBackLegHeight,
//                       );
//                       Navigator.pop(context);
//                       _showPanelConfigurationDialog();
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryBlue),
//                     child: const Text("Next"),
//                   ),
//                 ],
//               );
//             },
//           ),
//     );
//   }
//
//   void _showPanelConfigurationDialog() {
//     _tempProjectType = controller.selectedProjectTypeId.value;
//     _tempTechnology = controller.selectedTechnologyId.value;
//     _tempPanelWatt = controller.selectedPanelWatt.value;
//     _tempKilowatt = controller.selectedKilowattId.value;
//     _tempPanelCount = controller.selectedPanelCount.value;
//
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) =>
//           StatefulBuilder(
//             builder: (context, setState) {
//               return AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16)),
//                 title: const Text("Configure Solar Panels", style: TextStyle(
//                     fontSize: 20, fontWeight: FontWeight.bold)),
//                 content: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       // Obx(() {
//                       //   return DropdownButtonFormField<CommonItemModel>(
//                       //     decoration: const InputDecoration(
//                       //         labelText: "Select Category",
//                       //         border: OutlineInputBorder()),
//                       //     items: controller.categoryList
//                       //         .map((type) =>
//                       //         DropdownMenuItem(
//                       //             value: type, child: Text(type.name)))
//                       //         .toList(),
//                       //     onChanged: (value) {
//                       //       if (value != null) {
//                       //         controller.selectedCategoryId.value = value.id;
//                       //         controller.getSubCategory();
//                       //       }
//                       //     },
//                       //   );
//                       // }),
//                       // const SizedBox(height: 12),
//                       //
//                       //
//                       // Obx(() {
//                       //   return DropdownButtonFormField<CommonItemModel>(
//                       //     decoration: const InputDecoration(
//                       //         labelText: "Select Sub Category",
//                       //         border: OutlineInputBorder()),
//                       //     items: controller.subCategoryList
//                       //         .map((type) =>
//                       //         DropdownMenuItem(
//                       //             value: type, child: Text(type.name)))
//                       //         .toList(),
//                       //     onChanged: (value) {
//                       //       if (value != null) {
//                       //         controller.selectedSubCategoryId.value = value.id;
//                       //         controller.getProjectTypes();
//                       //       }
//                       //     },
//                       //   );
//                       // }),
//                       // const SizedBox(height: 12),
//                       // Obx(() {
//                       //   return DropdownButtonFormField<CommonItemModel>(
//                       //     decoration: const InputDecoration(
//                       //         labelText: "Selected Project Type",
//                       //         border: OutlineInputBorder()),
//                       //     items: controller.projectTypeList
//                       //         .map((type) =>
//                       //         DropdownMenuItem(value: type, child: Text(
//                       //             type.name)))
//                       //         .toList(),
//                       //     onChanged: (value) {
//                       //       if(value != null){
//                       //         controller.selectedProjectTypeId.value = value.id;
//                       //         controller.getSubProjectTypes();
//                       //       }
//                       //     },
//                       //   );
//                       // }),
//                       //
//                       // const SizedBox(height: 12),
//                       // Obx(() {
//                       //   return DropdownButtonFormField<CommonItemModel>(
//                       //     decoration: const InputDecoration(
//                       //         labelText: "Select Sub Project Type",
//                       //         border: OutlineInputBorder()),
//                       //     items: controller.subprojectTypeList
//                       //         .map((type) =>
//                       //         DropdownMenuItem(value: type, child: Text(
//                       //             type.name)))
//                       //         .toList(),
//                       //     onChanged: (value) {
//                       //       if(value != null){
//                       //         controller.selectedSubprojectTypeId.value = value.id;
//                       //         controller.getSolarBrands();
//                       //       }
//                       //
//                       //     },
//                       //   );
//                       // }),
//                       //
//
//                       const SizedBox(height: 12),
//                       Obx(() {
//                         return DropdownButtonFormField<CommonItemModel>(
//                           decoration: const InputDecoration(
//                               labelText: "Select Brand",
//                               border: OutlineInputBorder()),
//                           items: controller.brandList
//                               .map((type) =>
//                               DropdownMenuItem(value: type, child: Text(
//                                   type.name)))
//                               .toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedBrand.value = value.id;
//                               controller.getTechnology();
//                             }
//                           },
//                         );
//                       }),
//
//                       const SizedBox(height: 12),
//                       Obx(() {
//                         return DropdownButtonFormField<CommonItemModel>(
//                           decoration: const InputDecoration(
//                               labelText: "Select Technology",
//                               border: OutlineInputBorder()),
//                           items: controller.technologyList
//                               .map((type) =>
//                               DropdownMenuItem(value: type, child: Text(
//                                   type.name)))
//                               .toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedTechnologyId.value = value.id;
//                               controller.getSolarPanelWatt();
//                             }
//                           },
//                         );
//                       }),
//                       const SizedBox(height: 12),
//
//                       Obx(() {
//                         return DropdownButtonFormField<CommonItemModel>(
//                           decoration: const InputDecoration(
//                               labelText: "Select Panel Watt",
//                               border: OutlineInputBorder()),
//                           items: controller.panelWattList
//                               .map((type) =>
//                               DropdownMenuItem(value: type, child: Text(
//                                   type.name)))
//                               .toList(),
//                           onChanged: (value) {
//                             if (value != null) {
//                               controller.selectedPanelWattId.value = value.id;
//                               String cleaned = value.name.replaceAll(
//                                   RegExp(r'\s*[Kk]?[Ww]\s*$'), '').trim();
//                               print('cleaned $cleaned');
//                               controller.selectedPanelWatt.value = cleaned;
//                               controller.getNoOfPanels();
//                             }
//                           },
//                         );
//                       }),
//
//
//                       const SizedBox(height: 12),
//                       if (controller.currentMode.value == 1) ...[
//                         Obx(() {
//                           return DropdownButtonFormField<CommonItemModel>(
//                             decoration: const InputDecoration(
//                                 labelText: "Select Number Of Panels",
//                                 border: OutlineInputBorder()),
//                             items: controller.noOfPanelList
//                                 .map((type) =>
//                                 DropdownMenuItem(value: type, child: Text(
//                                     type.name)))
//                                 .toList(),
//                             onChanged: (value) {
//                               if (value != null) {
//                                 controller.selectedNoOfPanels.value = value.id;
//                                 controller.getKilowatt();
//                                 _tempPanelCount = int.tryParse(
//                                     controller.selectedNoOfPanels.value) ?? 0;
//                               }
//                             },
//                           );
//                         }),
//                         const SizedBox(height: 12),
//                         Obx(() {
//                           return DropdownButtonFormField<CommonItemModel>(
//                             decoration: const InputDecoration(
//                                 labelText: "Select Kilowatt",
//                                 border: OutlineInputBorder()),
//                             items: controller.kilowattList.map((kw) =>
//                                 DropdownMenuItem(
//                                     value: kw, child: Text(kw.name))).toList(),
//                             onChanged: (value) {
//                               if (value != null) {
//                                 String cleaned = value.name.replaceAll(
//                                     RegExp(r'\s*[Kk]?[Ww]\s*$'), '').trim();
//                                 controller.selectedKilowattId.value = value.id;
//                                 _tempKilowatt = cleaned;
//
//                                 double kw = double.parse(cleaned);
//                                 print('_tempPanelWatt $_tempPanelWatt');
//                                 int watt = int.parse(_tempPanelWatt);
//                                 print('watt $watt');
//                                 print('kw $kw');
//                               }
//                             },
//                           );
//                         }),
//                         const SizedBox(height: 12),
//                       ] else
//                         if (controller.currentMode.value == 2) ...[
//                           Container(padding: const EdgeInsets.all(12),
//                               decoration: BoxDecoration(color: Colors.blue
//                                   .shade50, borderRadius: BorderRadius.circular(
//                                   8)),
//                               child: const Text(
//                                   "Panels will fill the entire terrace area",
//                                   style: TextStyle(color: Colors.blue))),
//                         ],
//                     ],
//                   ),
//                 ),
//                 actions: [
//                   TextButton(onPressed: () => Navigator.pop(context),
//                       child: const Text("Cancel")),
//                   ElevatedButton(
//                     onPressed: () {
//                       controller.savePanelConfiguration(
//                         projectType: _tempProjectType,
//                         technology: _tempTechnology,
//                         panelWatt: _tempPanelWatt,
//                         kilowatt: _tempKilowatt,
//                         panelCount: _tempPanelCount,
//                       );
//                       Navigator.pop(context);
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("${_tempPanelCount} panels placed"),
//                           backgroundColor: Colors.green));
//                     },
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryBlue),
//                     child: const Text("Show Panels"),
//                   ),
//                 ],
//               );
//             },
//           ),
//     );
//   }
//
//   void _showBOMDialog() {
//     controller.calculateBOM();
//     showDialog(
//       context: context,
//       builder: (context) {
//         final building = controller.currentBuilding!;
//         return Dialog(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12)),
//           child: Container(
//             width: MediaQuery
//                 .of(context)
//                 .size
//                 .width * 0.9,
//             constraints: BoxConstraints(maxHeight: MediaQuery
//                 .of(context)
//                 .size
//                 .height * 0.8),
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text("Bill of Materials", style: TextStyle(
//                     fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 16),
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         _buildBOMSection("Standard Pipes", [
//                           {
//                             "item": "60 x 40",
//                             "qty": building.f6040,
//                             "unit": "Pipes"
//                           },
//                           {
//                             "item": "40 x 40",
//                             "qty": building.f4040,
//                             "unit": "Pipes"
//                           },
//                           {
//                             "item": "Extra Pipes",
//                             "qty": building.extraPipes,
//                             "unit": "Pipes"
//                           },
//                         ]),
//                         const SizedBox(height: 16),
//                         _buildBOMSection("Accessories", [
//                           {
//                             "item": "L - Angle",
//                             "qty": building.lAngle_qty,
//                             "unit": "Pcs"
//                           },
//                           {"item": "American Bolt", "qty": building
//                               .americanBolt_qty, "unit": "Pcs"},
//                           {
//                             "item": "Zink Spray",
//                             "qty": building.zink_qty,
//                             "unit": "Pcs"
//                           },
//                           {
//                             "item": "J Bolt",
//                             "qty": building.jBolt_qty,
//                             "unit": "Pcs"
//                           },
//                           {
//                             "item": "Foundation",
//                             "qty": building.foundation_qty,
//                             "unit": "Pcs"
//                           },
//                         ]),
//                         const SizedBox(height: 16),
//                         _buildBOMSection("Wires", [
//                           {
//                             "item": "DC Wire",
//                             "qty": building.dcWire_meter,
//                             "unit": "Meter"
//                           },
//                           {
//                             "item": "AC Wire",
//                             "qty": building.acWire_meter,
//                             "unit": "Meter"
//                           },
//                         ]),
//                         const SizedBox(height: 16),
//                         Container(padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(color: Colors.orange
//                                 .shade50,
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(color: Colors.orange)),
//                             child: Row(mainAxisAlignment: MainAxisAlignment
//                                 .spaceBetween,
//                                 children: [
//                                   const Text("Total KG:", style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16)),
//                                   Text("${building.totalKg.toStringAsFixed(
//                                       2)} KG", style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: Colors.orange))
//                                 ])),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 ElevatedButton(onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryBlue),
//                     child: const Text("Close")),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildBOMSection(String title, List<Map<String, dynamic>> items) {
//     return Container(
//       decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300),
//           borderRadius: BorderRadius.circular(8)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(color: Colors.grey.shade100,
//                   borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(8),
//                       topRight: Radius.circular(8))),
//               child: Text(title, style: const TextStyle(
//                   fontWeight: FontWeight.bold, fontSize: 14))),
//           ...items.map((item) =>
//               Padding(padding: const EdgeInsets.symmetric(
//                   horizontal: 12, vertical: 8),
//                   child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(item["item"]),
//                         Text("${item["qty"]} ${item["unit"]}")
//                       ]))),
//         ],
//       ),
//     );
//   }
//
//   // ==================== Markers ====================
//   Set<Marker> _buildMarkers() {
//     final markers = <Marker>{};
//     if (!controller.isSelectingArea.value) {
//       markers.add(Marker(markerId: const MarkerId("PickLocation"),
//           position: controller.pickedLocation.value,
//           icon: BitmapDescriptor.defaultMarkerWithHue(
//               BitmapDescriptor.hueRed)));
//     }
//     markers.addAll(controller.distanceMarkers);
//
//     if ((controller.isSelectingArea.value &&
//         controller.isDrawingTerrace.value) ||
//         (controller.isSelectingArea.value &&
//             controller.isEditingTerrace.value)) {
//       markers.addAll(controller.polygonPoints
//           .asMap()
//           .entries
//           .map((entry) {
//         final idx = entry.key;
//         final point = entry.value;
//         return Marker(
//           draggable: controller.isEditingTerrace.value,
//           onDragEnd: (newPos) =>
//           controller.isEditingTerrace.value ? controller.updatePolygonPoint(
//               idx, newPos) : controller.polygonPoints[idx] = newPos,
//           markerId: MarkerId('polygon_point_$idx'),
//           position: point,
//           icon: controller.boundaryIcon.value,
//           infoWindow: InfoWindow(
//             title: 'Point ${idx + 1}',
//             snippet: controller.isEditingTerrace.value
//                 ? "Drag to move"
//                 : "Tap to delete",
//             onTap: () =>
//             !controller.isEditingTerrace.value ? controller.removePolygonPoint(
//                 idx) : null,
//           ),
//         );
//       }));
//     }
//
//     if (controller.currentMode.value == 1 &&
//         controller.hasPanels.value &&
//         controller.currentBuilding != null &&
//         controller.currentBuilding!.panels.isNotEmpty) {
//       markers.add(Marker(
//         markerId: const MarkerId('drag_handle'),
//         position: controller.dragHandlePosition.value,
//         icon: controller.panelDragIcon.value,
//         draggable: true,
//         onDragStart: (position) {
//           HapticFeedback.vibrate();
//           controller.originalPanelCenters.value =
//           List<LatLng>.from(controller.currentBuilding!.panels);
//           controller.isDraggingPanels.value = true;
//           controller.dragStartPoint = position;
//           controller.dragHandlePosition.value = position;
//         },
//         onDrag: (position) {
//           if (controller.editingTerraceIndex.value != -1 &&
//               controller.isDraggingPanels.value) {
//             final latDelta = position.latitude -
//                 controller.dragHandlePosition.value.latitude;
//             final lngDelta = position.longitude -
//                 controller.dragHandlePosition.value.longitude;
//             controller.dragHandlePosition.value = position;
//             controller.moveAllPanels(latDelta, lngDelta);
//           }
//         },
//         onDragEnd: (position) {
//           controller.isDraggingPanels.value = false;
//           controller.originalPanelCenters.clear();
//           if (controller.currentBuilding != null &&
//               controller.currentBuilding!.panels.isNotEmpty) {
//             final newCenter = controller.getPanelsCenter(
//                 controller.currentBuilding!.panels);
//             controller.dragHandlePosition.value = newCenter;
//           }
//         },
//       ));
//     }
//
//     if (controller.isEditingTerraceLayout.value &&
//         controller.isEditingWalkway.value) {
//       for (int i = 0; i < controller.currentWalkways.length; i++) {
//         final walkway = controller.currentWalkways[i];
//         final endPoint = controller.getWalkwayEndPoint(walkway);
//         markers.add(Marker(
//           markerId: MarkerId('walkway_${walkway.id}'),
//           position: endPoint,
//           icon: controller.walkWayIcon.value,
//           draggable: true,
//           onDragStart: (_) => HapticFeedback.vibrate(),
//           onDrag: (newPosition) {
//             controller.dragWalkway(i, newPosition);
//           },
//           infoWindow: InfoWindow(
//             snippet: 'Delete',
//             title: 'Tap to Delete',
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (context) =>
//                     AlertDialog(
//                       title: const Text("Delete Walkway"),
//                       content: const Text(
//                           "Are you sure you want to delete this walkway?"),
//                       actions: [
//                         TextButton(onPressed: () => Navigator.pop(context),
//                             child: const Text("Cancel")),
//                         TextButton(
//                           onPressed: () {
//                             controller.removeWalkway(i);
//                             Navigator.pop(context);
//                           },
//                           style: TextButton.styleFrom(
//                               foregroundColor: Colors.red),
//                           child: const Text("Delete"),
//                         ),
//                       ],
//                     ),
//               );
//             },
//           ),
//           onTap: () {
//
//           },
//         ));
//       }
//     }
//     return markers;
//   }
//
//   // ==================== Polygons ====================
//   Set<Polygon> _buildPolygons() {
//     final polygons = <Polygon>{};
//     if ((controller.isSelectingArea.value &&
//         controller.isDrawingTerrace.value) ||
//         (controller.isSelectingArea.value &&
//             controller.isEditingTerrace.value)) {
//       if (controller.polygonPoints.length >= 3) {
//         polygons.add(Polygon(
//           polygonId: const PolygonId('current_area'),
//           points: List<LatLng>.from(controller.polygonPoints),
//           strokeWidth: 3,
//           strokeColor: controller.isEditingTerrace.value ? Colors.blue : Colors
//               .yellow,
//           fillColor: (controller.isEditingTerrace.value ? Colors.blue : Colors
//               .yellow).withOpacity(0.15),
//         ));
//       }
//     }
//     if (controller.currentBuilding != null &&
//         controller.currentBuilding!.terracePoints.isNotEmpty) {
//       final isSelected = controller.selectedBuildingId.value ==
//           controller.currentBuilding!.id;
//       polygons.add(Polygon(
//         polygonId: const PolygonId('saved_terrace'),
//         points: List<LatLng>.from(controller.currentBuilding!.terracePoints),
//         strokeWidth: isSelected ? 4 : 2,
//         strokeColor: isSelected ? Colors.green : Colors.blue,
//         fillColor: (isSelected ? Colors.green : Colors.blue).withOpacity(0.1),
//       ));
//     }
//     polygons.addAll(controller.solarPanelsPolygons);
//     if (controller.currentWalkways.isNotEmpty) {
//       polygons.addAll(controller.currentWalkways.map((w) => w.toPolygon()));
//     }
//     return polygons;
//   }
//
//   Set<Polyline> _buildPolylines() {
//     final polylines = <Polyline>{};
//     for (int i = 0; i < controller.currentHandRailPoints.length; i += 2) {
//       if (i + 1 < controller.currentHandRailPoints.length) polylines.add(
//           Polyline(polylineId: PolylineId('handrail_${i ~/ 2}'),
//               points: [
//                 controller.currentHandRailPoints[i],
//                 controller.currentHandRailPoints[i + 1]
//               ],
//               color: Colors.black,
//               width: 5));
//     }
//     return polylines;
//   }
//
//   // ==================== Drawer ====================
//   Widget _buildDrawer() {
//     return Drawer(
//       width: screenWidth * 0.7,
//       backgroundColor: Colors.white,
//       child: SafeArea(
//         child: Column(
//           children: [
//             Container(padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(gradient: LinearGradient(colors: [
//                   AppColors.primaryBlue,
//                   AppColors.primaryBlue.withOpacity(0.8)
//                 ])),
//                 child: Row(children: [
//                   const CircleAvatar(backgroundColor: Colors.white,
//                       radius: 24,
//                       child: Icon(Icons.business, color: AppColors.primaryBlue,
//                           size: 28)),
//                   const SizedBox(width: 16),
//                   Expanded(child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("Buildings", style: TextStyle(color: Colors
//                             .white, fontWeight: FontWeight.bold, fontSize: 20)),
//                         Obx(() =>
//                             Text("${controller.buildings
//                                 .length} Building${controller.buildings
//                                 .length != 1
//                                 ? 's'
//                                 : ''}", style: const TextStyle(
//                                 color: Colors.white70, fontSize: 14)))
//                       ])),
//                 ])),
//             Expanded(
//               child: Obx(() {
//                 if (controller.buildings.isEmpty) return const Center(
//                     child: Column(mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.business_outlined, size: 64,
//                               color: Colors.grey),
//                           SizedBox(height: 16),
//                           Text("No buildings yet.", style: TextStyle(
//                               color: Colors.grey, fontSize: 16)),
//                           SizedBox(height: 8),
//                           Text("Tap + to add one.", style: TextStyle(
//                               color: Colors.grey))
//                         ]));
//                 return ListView.builder(
//                   padding: const EdgeInsets.all(12),
//                   itemCount: controller.buildings.length,
//                   itemBuilder: (context, index) {
//                     final building = controller.buildings[index];
//                     final isSelected = controller.selectedBuildingId.value ==
//                         building.id;
//                     return Card(
//                       elevation: isSelected ? 4 : 1,
//                       margin: const EdgeInsets.only(bottom: 12),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius
//                           .circular(12), side: isSelected ? BorderSide(
//                           color: AppColors.primaryBlue, width: 2) : BorderSide
//                           .none),
//                       child: InkWell(
//                         onTap: () => controller.selectBuilding(building.id),
//                         borderRadius: BorderRadius.circular(12),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(children: [
//                                 Expanded(child: Text(building.name,
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                         color: isSelected ? AppColors
//                                             .primaryBlue : Colors.black87))),
//                                 if (building.terracePoints.isNotEmpty &&
//                                     building.panels.isNotEmpty) Container(
//                                     margin: const EdgeInsets.only(right: 8),
//                                     child: InkWell(onTap: () {
//                                       controller.selectBuilding(building.id);
//                                       _showBOMDialog();
//                                     },
//                                         child: Container(
//                                             padding: const EdgeInsets.symmetric(
//                                                 horizontal: 12, vertical: 6),
//                                             decoration: BoxDecoration(
//                                                 color: AppColors.primaryBlue,
//                                                 borderRadius: BorderRadius
//                                                     .circular(20)),
//                                             child: const Text("BOM",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight
//                                                         .bold))))),
//                                 IconButton(icon: const Icon(
//                                     Icons.delete_outline, size: 20,
//                                     color: Colors.red), onPressed: () {
//                                   showDialog(context: context,
//                                       builder: (context) =>
//                                           AlertDialog(title: const Text(
//                                               "Delete Building"),
//                                               content: Text(
//                                                   "Are you sure you want to delete '${building
//                                                       .name}'?"),
//                                               actions: [
//                                                 TextButton(onPressed: () =>
//                                                     Navigator.pop(context),
//                                                     child: const Text(
//                                                         "Cancel")),
//                                                 TextButton(onPressed: () {
//                                                   controller.deleteBuilding(
//                                                       building.id);
//                                                   Navigator.pop(context);
//                                                 },
//                                                     style: TextButton.styleFrom(
//                                                         foregroundColor: Colors
//                                                             .red),
//                                                     child: const Text("Delete"))
//                                               ]));
//                                 })
//                               ]),
//                               const SizedBox(height: 8),
//                               Row(children: [
//                                 Icon(Icons.article_outlined, size: 14,
//                                     color: isSelected
//                                         ? AppColors.primaryBlue
//                                         : Colors.grey),
//                                 const SizedBox(width: 4),
//                                 Text(building.projectType, style: TextStyle(
//                                     fontSize: 12,
//                                     color: isSelected
//                                         ? AppColors.primaryBlue
//                                         : Colors.grey[600]))
//                               ]),
//                               Row(children: [
//                                 Icon(Icons.person, size: 14,
//                                     color: isSelected
//                                         ? AppColors.primaryBlue
//                                         : Colors.grey),
//                                 const SizedBox(width: 4),
//                                 Text(building.customerName, style: TextStyle(
//                                     fontSize: 12,
//                                     color: isSelected
//                                         ? AppColors.primaryBlue
//                                         : Colors.grey[600]))
//                               ]),
//                               const SizedBox(height: 4),
//                               Row(children: [
//                                 Icon(Icons.phone, size: 14,
//                                     color: isSelected
//                                         ? AppColors.primaryBlue
//                                         : Colors.grey),
//                                 const SizedBox(width: 4),
//                                 Text(building.customerMobile, style: TextStyle(
//                                     fontSize: 12,
//                                     color: isSelected
//                                         ? AppColors.primaryBlue
//                                         : Colors.grey[600]))
//                               ]),
//                               const SizedBox(height: 12),
//                               Wrap(spacing: 8, runSpacing: 8, children: [
//                                 if (building.terracePoints
//                                     .isNotEmpty) _buildStatusChip(
//                                     "Terrace", Icons.draw,
//                                     isSelected ? AppColors.primaryBlue : Colors
//                                         .green),
//                                 if (building.panels
//                                     .isNotEmpty) _buildStatusChip(
//                                     "${building.panels.length} Panels",
//                                     Icons.solar_power,
//                                     isSelected ? AppColors.primaryBlue : Colors
//                                         .blue),
//                                 if (building.isSaved) _buildStatusChip(
//                                     "Saved", Icons.check_circle,
//                                     isSelected ? AppColors.primaryBlue : Colors
//                                         .green),
//                               ]),
//                               if (building.totalKw > 0) Padding(
//                                   padding: const EdgeInsets.only(top: 8),
//                                   child: Text(
//                                       "${building.totalKw.toStringAsFixed(
//                                           2)} KW", style: TextStyle(
//                                       fontSize: 12,
//                                       fontWeight: FontWeight.bold,
//                                       color: isSelected
//                                           ? AppColors.primaryBlue
//                                           : AppColors.primaryBlue.withOpacity(
//                                           0.7)))),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//             Padding(padding: const EdgeInsets.all(16),
//                 child: ElevatedButton.icon(onPressed: _showCreateBuildingDialog,
//                     icon: const Icon(Icons.add, size: 20),
//                     label: const Text(
//                         "New Building", style: TextStyle(fontSize: 14)),
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primaryBlue,
//                         foregroundColor: Colors.white,
//                         minimumSize: const Size(double.infinity, 48),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12))))),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildStatusChip(String label, IconData icon, Color color) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         decoration: BoxDecoration(color: color.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(16)),
//         child: Row(mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(icon, size: 12, color: color),
//               const SizedBox(width: 4),
//               Text(label, style: TextStyle(
//                   fontSize: 11, color: color, fontWeight: FontWeight.w500))
//             ]));
//   }
// }




import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:admin_app_new/custome_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' hide Uint8List, ByteData;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../controller/unfied_map_controller.dart';
import '../appColors.dart';
import '../models/comanItem_model.dart';
import 'package:image/image.dart' as img;

class UnifiedSurveyScreen extends StatefulWidget {
  final String? willQuote;

  const UnifiedSurveyScreen({super.key, this.willQuote});

  @override
  State<UnifiedSurveyScreen> createState() => _UnifiedSurveyScreenState();
}

class _UnifiedSurveyScreenState extends State<UnifiedSurveyScreen> {
  late UnifiedSurveyController controller;
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerMobileController = TextEditingController();

  double screenWidth = 0.0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Dialog local state variables
  String _tempTerraceType = "Rcc Roof";
  String _tempStructureType = "Hot dig Gi(Galvanised iron)";
  String _tempInverterPosition = "Ground Floor";
  bool _tempIsMeterOrFeet = true;
  int _tempFrontLegHeight = 0;
  int _tempBackLegHeight = 0;

  String _tempProjectType = "";
  String _tempTechnology = "";
  String _tempPanelWatt = "545";
  String _tempKilowatt = "";
  int _tempPanelCount = 0;

  final GlobalKey _screenshotKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFAB(),
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = Get.put(UnifiedSurveyController());
    // ever(controller.isLoading, (loading) {
    //   if (loading) {
    //     showLoadingDialog();
    //   } else {
    //     if (Navigator.of(context, rootNavigator: true).canPop()) {
    //       Navigator.of(context, rootNavigator: true).pop();
    //     }
    //   }
    // });
  }



  void showLoadingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ),
    );
  }

  @override
  void dispose() {
    Get.delete<UnifiedSurveyController>();
    super.dispose();
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.primaryBlue,
      elevation: 1,
      title: const Text("Solar Survey",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      actions: [
        // Mode toggle (As Per KW / As Per Space)
        Obx(() => Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => controller.switchMode(1),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: controller.currentMode.value == 1 ? Colors.white : Colors.transparent,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                  ),
                  child: Text(
                    "As Per KW",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: controller.currentMode.value == 1 ? AppColors.primaryBlue : Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => controller.switchMode(2),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: controller.currentMode.value == 2 ? Colors.white : Colors.transparent,
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                  ),
                  child: Text(
                    "As Per Space",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: controller.currentMode.value == 2 ? AppColors.primaryBlue : Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),

        // Complete Survey Button
        Obx(() {
          final building = controller.currentBuilding;
          final canComplete = building != null &&
              building.terracePoints.isNotEmpty &&
              building.panels.isNotEmpty &&
              !controller.isLoading.value;

          return IconButton(
            icon: Icon(
              controller.isSaved.value ? Icons.check_circle : Icons.check_circle_outline,
              color: Colors.white,
            ),
            onPressed: canComplete
                ? () async{
              final screenshot = await _captureScreenshot();
                  controller.completeSurvey(screenshot);
                }
                : null,
            tooltip: controller.isSaved.value ? 'Survey Completed' : 'Complete Survey',
          );
        }),

        // Street View toggle
        IconButton(
          icon: Obx(() => Icon(controller.showStreetView.value ? Icons.map : Icons.streetview, color: Colors.white)),
          onPressed: () => controller.showStreetView.toggle(),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Obx(() => controller.showStreetView.value
        ? const Center(child: Text("Street View Coming Soon"))
        : _buildMapView());
  }




  Future<Uint8List?> _captureScreenshot() async {
    try {
      final boundary = _screenshotKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;

      // Lower resolution reduces PNG size drastically
      final ui.Image image = await boundary.toImage(pixelRatio: 0.5);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List();
    } catch (e) {
      print('Screenshot capture failed: $e');
      return null;
    }
  }

  Widget _buildMapView() {
    return Column(
      children: [
        Expanded(
          child: RepaintBoundary(
            key: _screenshotKey,
            child: Stack(
              children: [
                GoogleMap(
                  zoomGesturesEnabled: true,
                  zoomControlsEnabled: false,
                  mapType: MapType.satellite,
                  initialCameraPosition: CameraPosition(target: controller.pickedLocation.value, zoom: 18),
                  onMapCreated: (mapCtrl) => controller.mapController = mapCtrl,
                  onTap: (argument) {
                    if (controller.isDrawingHandRail.value) {
                      // Hand rail drawing logic if needed
                    } else if (controller.isSelectingArea.value && controller.isDrawingTerrace.value) {
                      controller.addPolygonPoint(argument);
                    }
                    controller.pickedLocation.value = argument;
                  },
                  markers: _buildMarkers(),
                  polygons: _buildPolygons(),
                  polylines: _buildPolylines(),
                ),
                if (controller.isSelectingArea.value && controller.isDrawingTerrace.value) _buildDrawingControls(),
                if (controller.isSelectingArea.value && controller.isEditingTerrace.value) _buildTerraceEditControls(),
                if (controller.hasPanels.value && !controller.isSaved.value && controller.currentBuilding != null) _buildSaveEditControls(),
                if (controller.hasPanels.value && controller.isSaved.value && controller.currentBuilding != null && !controller.isSelectingArea.value && !controller.isEditingTerrace.value) _buildSavedEditControls(),
                // Panel edit card (top-right)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Obx(() => controller.isEditingTerraceLayout.value ? _buildEditCard() : const SizedBox()),
                ),
                // Walkway edit card (top-left)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Obx(() => controller.isEditingTerraceLayout.value && controller.isEditingWalkway.value ? _buildWalkwayEditCard() : const SizedBox()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ==================== Panel Edit Card (top-right) ====================
  Widget _buildEditCard() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Panel Layout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
              const Divider(height: 8, thickness: 1),
              Row(
                children: [
                  const Text("Orient: ", style: TextStyle(fontSize: 12)),
                  CupertinoSlidingSegmentedControl(
                    groupValue: controller.isHorizontal.value ? "H" : "V",
                    thumbColor: AppColors.primaryBlue,
                    children: const {"H": Text("H"), "V": Text("V")},
                    onValueChanged: (value) {
                      if (value != null) {
                        controller.isHorizontal.value = value == "H";
                        controller.updatePanelsFromEditCard();
                        controller.updateAvailableRowsForEdit();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 6),
              if (controller.currentMode.value == 1) ...[
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: "Rows",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  value: controller.availableRowsForEdit.contains(controller.selectedRows.value)
                      ? controller.selectedRows.value
                      : (controller.availableRowsForEdit.isNotEmpty ? controller.availableRowsForEdit.first : 1),
                  items: controller.availableRowsForEdit.map((rows) => DropdownMenuItem(value: rows, child: Text("$rows Row${rows > 1 ? 's' : ''}"))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedRows.value = value;
                      controller.updatePanelsFromEditCard();
                    }
                  },
                ),
                const SizedBox(height: 6),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: "Rows per Table",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  value: controller.groupRowsForKW.value,
                  items: [1, 2, 3, 4, 5, 6].map((rows) => DropdownMenuItem(value: rows, child: Text("$rows Row${rows > 1 ? 's' : ''}"))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.groupRowsForKW.value = value;
                      controller.updatePanelsFromEditCard();
                    }
                  },
                ),
                const SizedBox(height: 6),
              ] else ...[
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(
                    labelText: "Rows per Table",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  value: controller.groupRowsForSpace.value,
                  items: [1, 2, 3, 4, 5, 6].map((rows) => DropdownMenuItem(value: rows, child: Text("$rows Row${rows > 1 ? 's' : ''}"))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.groupRowsForSpace.value = value;
                      controller.updatePanelsFromEditCard();
                    }
                  },
                ),
                const SizedBox(height: 6),
              ],
              // Padding slider
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Padding: ${controller.paddingValue.value.toStringAsFixed(1)} m", style: const TextStyle(fontSize: 11)),
                ],
              ),
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Slider(
                  label: '${controller.paddingValue.value.toStringAsFixed(1)}',
                  value: controller.paddingValue.value,
                  min: 0,
                  max: 5,
                  divisions: 50,
                  activeColor: AppColors.primaryBlue,
                  onChanged: (value) {
                    controller.paddingValue.value = value;
                    controller.updatePanelsFromEditCard();
                  },
                ),
              ),
              // Row spacing slider
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Row Spacing: ${controller.rowSpacingValue.value.toStringAsFixed(1)} m", style: const TextStyle(fontSize: 11)),
                ],
              ),
              SizedBox(
                height: 30,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Slider(
                  label: '${controller.rowSpacingValue.value.toStringAsFixed(1)}',
                  value: controller.rowSpacingValue.value,
                  min: 0,
                  max: 5,
                  divisions: 50,
                  activeColor: AppColors.primaryBlue,
                  onChanged: (value) {
                    controller.rowSpacingValue.value = value;
                    controller.updatePanelsFromEditCard();
                  },
                ),
              ),
              const Divider(height: 8, thickness: 1),
              Text("Solar Panels : ${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontSize: 11)),
              Text("KW : ${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(1)}", style: const TextStyle(fontSize: 11)),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== Walkway Edit Card (top-left) ====================
  Widget _buildWalkwayEditCard() {
    if (controller.selectedWalkwayIndex.value < 0 || controller.selectedWalkwayIndex.value >= controller.currentWalkways.length) {
      return const SizedBox();
    }
    final walkway = controller.currentWalkways[controller.selectedWalkwayIndex.value];
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Edit Walkway", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  IconButton(
                    icon: const Icon(Icons.close, size: 16),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () => controller.stopEditingWalkway(),
                  ),
                ],
              ),
              const Divider(height: 8, thickness: 1),
              Row(
                children: [
                  const Text("Orient: ", style: TextStyle(fontSize: 12)),
                  CupertinoSlidingSegmentedControl(
                    groupValue: walkway.isHorizontal ? "H" : "V",
                    thumbColor: AppColors.primaryBlue,
                    children: const {"H": Text("H"), "V": Text("V")},
                    onValueChanged: (value) {
                      if (value != null) {
                        controller.toggleWalkwayOrientation(controller.selectedWalkwayIndex.value);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==================== Drawing controls ====================
  Widget _buildDrawingControls() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Text(
                      'Area: ${controller.showInMeters.value ? '${controller.polygonArea.toStringAsFixed(2)} m²' : '${(controller.polygonArea.value * 10.764).toStringAsFixed(2)} ft²'}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                    const SizedBox(width: 16),
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    IconButton(
                      icon: const Icon(Icons.undo, size: 22, color: AppColors.primaryBlue),
                      onPressed: controller.undoLastPoint,
                      tooltip: "Undo last point",
                    ),
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.completeTerraceDrawing()) {
                          _showStructureTableDialog();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Invalid polygon! Lines cannot cross each other."), backgroundColor: Colors.red),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Done", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTerraceEditControls() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Text(
                      'Area: ${controller.showInMeters.value ? '${controller.polygonArea.toStringAsFixed(2)} m²' : '${(controller.polygonArea.value * 10.764).toStringAsFixed(2)} ft²'}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    )),
                    const SizedBox(width: 16),
                    Container(height: 30, width: 1, color: Colors.grey.shade300),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.saveEditedTerrace()) {
                          showCustomSnackBar(context, message: 'Terrace updated', backgroundColor: Colors.green);

                        } else {
                          showCustomSnackBar(context, message: 'Terrace updated', backgroundColor: Colors.green);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid polygon! Lines cannot cross."), backgroundColor: Colors.red));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Save", style: TextStyle(color: Colors.white)),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: controller.cancelEditingTerrace,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Cancel", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveEditControls() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Panels: ${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text("KW: ${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(2)}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      ],
                    )),
                    const SizedBox(width: 16),
                    Container(height: 40, width: 1, color: Colors.grey.shade300),
                    ElevatedButton.icon(
                      onPressed: () => _showEditChoiceDialog(),
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text("Edit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.saveTerrace();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Building saved successfully"), backgroundColor: Colors.green));
                      },
                      icon: const Icon(Icons.save, size: 18),
                      label: const Text("Save"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedEditControls() {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Panels: ${controller.currentBuilding?.panels.length ?? 0}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        Text("KW: ${(controller.currentBuilding?.totalKw ?? 0).toStringAsFixed(2)}", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                      ],
                    )),
                    const SizedBox(width: 16),
                    Container(height: 40, width: 1, color: Colors.grey.shade300),
                    ElevatedButton.icon(
                      onPressed: () => _showEditChoiceDialog(),
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text("Edit"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditChoiceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Options"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.solar_power, color: AppColors.primaryBlue),
              title: const Text("Edit Panel Configuration"),
              subtitle: const Text("Change panel count, orientation, spacing"),
              onTap: () {
                Navigator.pop(context);
                _showStructureTableDialog();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit_location, color: Colors.orange),
              title: const Text("Edit Terrace Shape"),
              subtitle: const Text("Move terrace boundary points"),
              onTap: () {
                Navigator.pop(context);
                controller.startEditingTerrace();
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.timeline, color: Colors.green),
              title: const Text("Add Walkway"),
              subtitle: const Text("Add a walkway to the terrace"),
              onTap: () {
                Navigator.pop(context);
                controller.startAddingWalkway();
              },
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return Obx(() {
      if ((controller.isSelectingArea.value && controller.isDrawingTerrace.value) ||
          (controller.isSelectingArea.value && controller.isEditingTerrace.value)) {
        return const SizedBox();
      }
      if (controller.hasPanels.value && !controller.isSaved.value) return const SizedBox();
      if (controller.hasPanels.value && controller.isSaved.value) return const SizedBox();
      return FloatingActionButton.extended(
        heroTag: "select_area",
        foregroundColor: Colors.white,
        backgroundColor: AppColors.primaryBlue,
        onPressed: () {
          if (controller.buildings.isEmpty) {
            _showCreateBuildingDialog();
          } else if (controller.currentBuilding == null || controller.currentBuilding!.terracePoints.isEmpty) {
            controller.isSelectingArea.value = true;
            controller.isDrawingTerrace.value = true;
          } else {
            _showBuildingSelectionDialog();
          }
        },
        icon: const Icon(Icons.draw),
        label: const Text("Select Area"),
      );
    });
  }

  // ==================== Dialogs ====================
  void _showCreateBuildingDialog() {
    customerNameController.clear();
    customerMobileController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Create New Building", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(controller: customerNameController, decoration: const InputDecoration(
                labelText: "Customer Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              )),
              const SizedBox(height: 12),
              TextFormField(controller: customerMobileController, keyboardType: TextInputType.phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    labelText: "Mobile Number",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  )),
              const SizedBox(height: 12),
              Obx(() {
                return DropdownButtonFormField<CommonItemModel>(
                  decoration: const InputDecoration(labelText: "Building Types", border: OutlineInputBorder()),
                  items: controller.buildingTypes.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedBuildingType.value = value.id;
                    }
                  },
                );
              }),
              const SizedBox(height: 12),
              Obx(() {
                return DropdownButtonFormField<CommonItemModel>(
                  decoration: const InputDecoration(labelText: "Select District", border: OutlineInputBorder()),
                  items: controller.distictList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedDistrict.value = value.id;

                    }
                  },
                );
              }),
              const SizedBox(height: 12),
              Obx(() {
                return DropdownButtonFormField<CommonItemModel>(
                  decoration: const InputDecoration(labelText: "Select Category", border: OutlineInputBorder()),
                  items: controller.categoryList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCategoryId.value = value.id;
                      controller.getSubCategory();
                    }
                  },
                );
              }),
              const SizedBox(height: 12),
              Obx(() {
                return DropdownButtonFormField<CommonItemModel>(
                  decoration: const InputDecoration(labelText: "Select Sub Category", border: OutlineInputBorder()),
                  items: controller.subCategoryList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedSubCategoryId.value = value.id;
                      controller.getProjectTypes();
                    }
                  },
                );
              }),
              const SizedBox(height: 12),
              Obx(() {
                return DropdownButtonFormField<CommonItemModel>(
                  decoration: const InputDecoration(labelText: "Selected Project Type", border: OutlineInputBorder()),
                  items: controller.projectTypeList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedProjectTypeId.value = value.id;
                      controller.selectedProjectType.value = value.name;
                      controller.getSubProjectTypes();
                    }
                  },
                );
              }),
              const SizedBox(height: 12),
              Obx(() {
                return DropdownButtonFormField<CommonItemModel>(
                  decoration: const InputDecoration(labelText: "Select Sub Project Type", border: OutlineInputBorder()),
                  items: controller.subprojectTypeList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedSubprojectTypeId.value = value.id;
                      controller.getSolarBrands();
                    }
                  },
                );
              }),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          ElevatedButton(
            onPressed: () {
              if (customerNameController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please enter customer name"), backgroundColor: Colors.red));
                return;
              }
              controller.createNewBuilding(
                customerNameController.text,
                customerNameController.text,
                customerMobileController.text,
                controller.selectedProjectType.value,
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
            child: const Text("Create"),
          ),
        ],
      ),
    );
  }

  void _showBuildingSelectionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Select Building", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...controller.buildings.map((building) => ListTile(
              leading: const Icon(Icons.business, color: AppColors.primaryBlue),
              title: Text(building.name, style: const TextStyle(fontWeight: FontWeight.w500)),
              subtitle: Text("${building.customerName} | ${building.customerMobile}"),
              trailing: building.terracePoints.isNotEmpty ? const Icon(Icons.check_circle, color: Colors.green, size: 20) : null,
              onTap: () {
                controller.selectBuilding(building.id);
                Navigator.pop(context);
                if (building.terracePoints.isEmpty) {
                  controller.isSelectingArea.value = true;
                  controller.isDrawingTerrace.value = true;
                }
              },
            )),
            const Divider(),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                _showCreateBuildingDialog();
              },
              icon: const Icon(Icons.add),
              label: const Text("Create New Building"),
            ),
          ],
        ),
      ),
    );
  }

  void _showStructureTableDialog() {
    _tempTerraceType = controller.terraceType.value;
    _tempStructureType = controller.structureType.value;
    _tempInverterPosition = controller.inverterPosition.value;
    _tempIsMeterOrFeet = controller.isMeterOrFeet.value;
    _tempFrontLegHeight = controller.frontLegHeight.value;
    _tempBackLegHeight = controller.backLegHeight.value;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text("Structure Table", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(() {
                    return DropdownButtonFormField<CommonItemModel>(
                      decoration: const InputDecoration(labelText: "Terrace Type", border: OutlineInputBorder()),
                      items: controller.terraceTypesList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedTerraceTypeId.value = value.id;
                          _tempTerraceType = value.name;
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  Obx(() {
                    return DropdownButtonFormField<CommonItemModel>(
                      decoration: const InputDecoration(labelText: "Type of Structure", border: OutlineInputBorder()),
                      items: controller.structureTypeList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedStructureTypeId.value = value.id;
                          _tempStructureType = value.name;
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  Obx(() {
                    return DropdownButtonFormField<CommonItemModel>(
                      decoration: const InputDecoration(labelText: "Inverter Position", border: OutlineInputBorder()),
                      items: controller.inverterPositionList.map((pos) => DropdownMenuItem(value: pos, child: Text(pos.name))).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedInverterPositionId.value = value.id;
                          _tempInverterPosition = value.name;
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  Row(children: [
                    const Text("Meter"),
                    Switch(
                      value: _tempIsMeterOrFeet,
                      onChanged: (value) => setState(() { _tempIsMeterOrFeet = value; }),
                      activeColor: AppColors.primaryBlue,
                    ),
                    const Text("Feet"),
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: _tempFrontLegHeight.toString()),
                      decoration: InputDecoration(
                        labelText: _tempIsMeterOrFeet ? "Front Leg Height (Feet)" : "Front Leg Height (Meter)",
                        border: const OutlineInputBorder(),
                        suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(icon: const Icon(Icons.arrow_drop_up, size: 24), onPressed: () => setState(() { _tempFrontLegHeight++; })),
                          IconButton(icon: const Icon(Icons.arrow_drop_down, size: 24), onPressed: () => setState(() { if (_tempFrontLegHeight > 0) _tempFrontLegHeight--; })),
                        ]),
                      ),
                    )),
                  ]),
                  const SizedBox(height: 12),
                  Row(children: [
                    Expanded(child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(text: _tempBackLegHeight.toString()),
                      decoration: InputDecoration(
                        labelText: _tempIsMeterOrFeet ? "Back Leg Height (Feet)" : "Back Leg Height (Meter)",
                        border: const OutlineInputBorder(),
                        suffixIcon: Row(mainAxisSize: MainAxisSize.min, children: [
                          IconButton(icon: const Icon(Icons.arrow_drop_up, size: 24), onPressed: () => setState(() { _tempBackLegHeight++; })),
                          IconButton(icon: const Icon(Icons.arrow_drop_down, size: 24), onPressed: () => setState(() { if (_tempBackLegHeight > 0) _tempBackLegHeight--; })),
                        ]),
                      ),
                    )),
                  ]),
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.pop(context);
                controller.isSelectingArea.value = true;
                controller.isDrawingTerrace.value = true;
              }, child: const Text("Back")),
              ElevatedButton(
                onPressed: () {
                  controller.saveStructureDetails(
                    terraceTypeVal: _tempTerraceType,
                    structureTypeVal: _tempStructureType,
                    inverterPositionVal: _tempInverterPosition,
                    isMeterOrFeetVal: _tempIsMeterOrFeet,
                    frontLegHeightVal: _tempFrontLegHeight,
                    backLegHeightVal: _tempBackLegHeight,
                  );
                  Navigator.pop(context);
                  _showPanelConfigurationDialog();
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
                child: const Text("Next"),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showPanelConfigurationDialog() {
    _tempProjectType = controller.selectedProjectTypeId.value;
    _tempTechnology = controller.selectedTechnologyId.value;
    _tempPanelWatt = controller.selectedPanelWatt.value;
    _tempKilowatt = controller.selectedKilowattId.value;
    _tempPanelCount = controller.selectedPanelCount.value;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text("Configure Solar Panels", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 12),
                  Obx(() {
                    return DropdownButtonFormField<CommonItemModel>(
                      decoration: const InputDecoration(labelText: "Select Brand", border: OutlineInputBorder()),
                      items: controller.brandList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedBrand.value = value.id;
                          controller.getTechnology();
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  Obx(() {
                    return DropdownButtonFormField<CommonItemModel>(
                      decoration: const InputDecoration(labelText: "Select Technology", border: OutlineInputBorder()),
                      items: controller.technologyList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedTechnologyId.value = value.id;
                          _tempTechnology = value.id;
                          controller.getSolarPanelWatt();
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  Obx(() {
                    return DropdownButtonFormField<CommonItemModel>(
                      decoration: const InputDecoration(labelText: "Select Panel Watt", border: OutlineInputBorder()),
                      items: controller.panelWattList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedPanelWattId.value = value.id;
                          print('controller.selectedPanelWattId.value ${controller
                              .selectedPanelWattId.value}');
                          String cleaned = value.name.replaceAll(RegExp(r'\s*[Kk]?[Ww]\s*$'), '').trim();
                          controller.selectedPanelWatt.value = cleaned;
                          _tempPanelWatt = cleaned;
                          controller.getNoOfPanels();
                        }
                      },
                    );
                  }),
                  const SizedBox(height: 12),
                  if (controller.currentMode.value == 1) ...[
                    Obx(() {
                      return DropdownButtonFormField<CommonItemModel>(
                        decoration: const InputDecoration(labelText: "Select Number Of Panels", border: OutlineInputBorder()),
                        items: controller.noOfPanelList.map((type) => DropdownMenuItem(value: type, child: Text(type.name))).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedNoOfPanels.value = value.id;
                            controller.getKilowatt();
                            _tempPanelCount = int.tryParse(controller.selectedNoOfPanels.value) ?? 0;
                          }
                        },
                      );
                    }),
                    const SizedBox(height: 12),
                    Obx(() {
                      CommonItemModel? selected = controller.kilowattList.firstWhereOrNull((element) {
                        return element.id == controller.selectedKilowattId.value;
                      },);

                      return DropdownButtonFormField<CommonItemModel>(
                        initialValue: selected,
                        decoration: const InputDecoration(labelText: "Select Kilowatt", border: OutlineInputBorder()),
                        items: controller.kilowattList.map((kw) => DropdownMenuItem(value: kw, child: Text(kw.name))).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            String cleaned = value.name.replaceAll(RegExp(r'\s*[Kk]?[Ww]\s*$'), '').trim();
                            controller.selectedKilowattId.value = value.id;
                            _tempKilowatt = cleaned;
                            double kw = double.parse(cleaned);
                            int watt = int.parse(controller.selectedPanelWatt.value);
                            _tempPanelCount = ((kw * 1000) / watt).ceil();
                          }
                        },
                      );
                    }),
                    const SizedBox(height: 12),
                  ] else if (controller.currentMode.value == 2) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(8)),
                      child: const Text("Panels will fill the entire terrace area", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
              ElevatedButton(
                onPressed: () {
                  controller.savePanelConfiguration(
                    projectType: _tempProjectType,
                    technology: _tempTechnology,
                    panelWatt: _tempPanelWatt,
                    kilowatt: _tempKilowatt,
                    panelCount: _tempPanelCount,
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_tempPanelCount} panels placed"), backgroundColor: Colors.green));
                },
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue),
                child: const Text("Show Panels"),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showBOMDialog() {
    controller.calculateBOM();
    showDialog(
      context: context,
      builder: (context) {
        final building = controller.currentBuilding!;
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Bill of Materials", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildBOMSection("Standard Pipes", [
                          {"item": "60 x 40", "qty": building.f6040, "unit": "Pipes"},
                          {"item": "40 x 40", "qty": building.f4040, "unit": "Pipes"},
                          {"item": "Extra Pipes", "qty": building.extraPipes, "unit": "Pipes"},
                        ]),
                        const SizedBox(height: 16),
                        _buildBOMSection("Accessories", [
                          {"item": "L - Angle", "qty": building.lAngle_qty, "unit": "Pcs"},
                          {"item": "American Bolt", "qty": building.americanBolt_qty, "unit": "Pcs"},
                          {"item": "Zink Spray", "qty": building.zink_qty, "unit": "Pcs"},
                          {"item": "J Bolt", "qty": building.jBolt_qty, "unit": "Pcs"},
                          {"item": "Foundation", "qty": building.foundation_qty, "unit": "Pcs"},
                        ]),
                        const SizedBox(height: 16),
                        _buildBOMSection("Wires", [
                          {"item": "DC Wire", "qty": building.dcWire_meter, "unit": "Meter"},
                          {"item": "AC Wire", "qty": building.acWire_meter, "unit": "Meter"},
                        ]),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.orange),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total KG:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("${building.totalKg.toStringAsFixed(2)} KG", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.orange)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () => Navigator.pop(context), style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryBlue), child: const Text("Close")),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBOMSection(String title, List<Map<String, dynamic>> items) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item["item"]),
                Text("${item["qty"]} ${item["unit"]}"),
              ],
            ),
          )),
        ],
      ),
    );
  }

  // ==================== Markers ====================
  Set<Marker> _buildMarkers() {
    final markers = <Marker>{};
    if (!controller.isSelectingArea.value) {
      markers.add(Marker(markerId: const MarkerId("PickLocation"), position: controller.pickedLocation.value, icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
    }
    markers.addAll(controller.distanceMarkers);

    if ((controller.isSelectingArea.value && controller.isDrawingTerrace.value) ||
        (controller.isSelectingArea.value && controller.isEditingTerrace.value)) {
      markers.addAll(controller.polygonPoints.asMap().entries.map((entry) {
        final idx = entry.key;
        final point = entry.value;
        return Marker(
          draggable: controller.isEditingTerrace.value,
          onDragEnd: (newPos) => controller.isEditingTerrace.value ? controller.updatePolygonPoint(idx, newPos) : controller.polygonPoints[idx] = newPos,
          markerId: MarkerId('polygon_point_$idx'),
          position: point,
          icon: controller.boundaryIcon.value,
          infoWindow: InfoWindow(
            title: 'Point ${idx + 1}',
            snippet: controller.isEditingTerrace.value ? "Drag to move" : "Tap to delete",
            onTap: () => !controller.isEditingTerrace.value ? controller.removePolygonPoint(idx) : null,
          ),
        );
      }));
    }

    if (controller.currentMode.value == 1 &&
        controller.hasPanels.value &&
        controller.currentBuilding != null &&
        controller.currentBuilding!.panels.isNotEmpty) {
      markers.add(Marker(
        markerId: const MarkerId('drag_handle'),
        position: controller.dragHandlePosition.value,
        icon: controller.panelDragIcon.value,
        draggable: true,
        onDragStart: (position) {
          HapticFeedback.vibrate();
          controller.originalPanelCenters.value = List<LatLng>.from(controller.currentBuilding!.panels);
          controller.isDraggingPanels.value = true;
          controller.dragStartPoint = position;
          controller.dragHandlePosition.value = position;
        },
        onDrag: (position) {
          if (controller.editingTerraceIndex.value != -1 && controller.isDraggingPanels.value) {
            final latDelta = position.latitude - controller.dragHandlePosition.value.latitude;
            final lngDelta = position.longitude - controller.dragHandlePosition.value.longitude;
            controller.dragHandlePosition.value = position;
            controller.moveAllPanels(latDelta, lngDelta);
          }
        },
        onDragEnd: (position) {
          controller.isDraggingPanels.value = false;
          controller.originalPanelCenters.clear();
          if (controller.currentBuilding != null && controller.currentBuilding!.panels.isNotEmpty) {
            final newCenter = controller.getPanelsCenter(controller.currentBuilding!.panels);
            controller.dragHandlePosition.value = newCenter;
          }
        },
      ));
    }

    if (controller.isEditingTerraceLayout.value && controller.isEditingWalkway.value) {
      for (int i = 0; i < controller.currentWalkways.length; i++) {
        final walkway = controller.currentWalkways[i];
        final endPoint = controller.getWalkwayEndPoint(walkway);
        markers.add(Marker(
          markerId: MarkerId('walkway_${walkway.id}'),
          position: endPoint,
          icon: controller.walkWayIcon.value,
          draggable: true,
          onDragStart: (_) => HapticFeedback.vibrate(),
          onDrag: (newPosition) {
            controller.dragWalkway(i, newPosition);
          },
          infoWindow: InfoWindow(
            snippet: 'Delete',
            title: 'Tap to Delete',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Delete Walkway"),
                  content: const Text("Are you sure you want to delete this walkway?"),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                    TextButton(
                      onPressed: () {
                        controller.removeWalkway(i);
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text("Delete"),
                    ),
                  ],
                ),
              );
            },
          ),
          onTap: () {},
        ));
      }
    }
    return markers;
  }

  // ==================== Polygons ====================
  Set<Polygon> _buildPolygons() {
    final polygons = <Polygon>{};
    if ((controller.isSelectingArea.value && controller.isDrawingTerrace.value) ||
        (controller.isSelectingArea.value && controller.isEditingTerrace.value)) {
      if (controller.polygonPoints.length >= 3) {
        polygons.add(Polygon(
          polygonId: const PolygonId('current_area'),
          points: List<LatLng>.from(controller.polygonPoints),
          strokeWidth: 3,
          strokeColor: controller.isEditingTerrace.value ? Colors.blue : Colors.yellow,
          fillColor: (controller.isEditingTerrace.value ? Colors.blue : Colors.yellow).withOpacity(0.15),
        ));
      }
    }
    if (controller.currentBuilding != null && controller.currentBuilding!.terracePoints.isNotEmpty) {
      final isSelected = controller.selectedBuildingId.value == controller.currentBuilding!.id;
      polygons.add(Polygon(
        polygonId: const PolygonId('saved_terrace'),
        points: List<LatLng>.from(controller.currentBuilding!.terracePoints),
        strokeWidth: isSelected ? 4 : 2,
        strokeColor: isSelected ? Colors.green : Colors.blue,
        fillColor: (isSelected ? Colors.green : Colors.blue).withOpacity(0.1),
      ));
    }
    polygons.addAll(controller.solarPanelsPolygons);
    if (controller.currentWalkways.isNotEmpty) {
      polygons.addAll(controller.currentWalkways.map((w) => w.toPolygon()));
    }
    return polygons;
  }

  Set<Polyline> _buildPolylines() {
    final polylines = <Polyline>{};
    for (int i = 0; i < controller.currentHandRailPoints.length; i += 2) {
      if (i + 1 < controller.currentHandRailPoints.length) {
        polylines.add(Polyline(
          polylineId: PolylineId('handrail_${i ~/ 2}'),
          points: [controller.currentHandRailPoints[i], controller.currentHandRailPoints[i + 1]],
          color: Colors.black,
          width: 5,
        ));
      }
    }
    return polylines;
  }

  // ==================== Drawer ====================
  Widget _buildDrawer() {
    return Drawer(
      width: screenWidth * 0.7,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors.primaryBlue,
                  AppColors.primaryBlue.withOpacity(0.8),
                ]),
              ),
              child: Row(children: [
                const CircleAvatar(backgroundColor: Colors.white, radius: 24, child: Icon(Icons.business, color: AppColors.primaryBlue, size: 28)),
                const SizedBox(width: 16),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Buildings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                    Obx(() => Text("${controller.buildings.length} Building${controller.buildings.length != 1 ? 's' : ''}", style: const TextStyle(color: Colors.white70, fontSize: 14))),
                  ],
                )),
              ]),
            ),
            Expanded(
              child: Obx(() {
                if (controller.buildings.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.business_outlined, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text("No buildings yet.", style: TextStyle(color: Colors.grey, fontSize: 16)),
                        SizedBox(height: 8),
                        Text("Tap + to add one.", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: controller.buildings.length,
                  itemBuilder: (context, index) {
                    final building = controller.buildings[index];
                    final isSelected = controller.selectedBuildingId.value == building.id;
                    return Card(
                      elevation: isSelected ? 4 : 1,
                      margin: const EdgeInsets.only(bottom: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: isSelected ? BorderSide(color: AppColors.primaryBlue, width: 2) : BorderSide.none,
                      ),
                      child: InkWell(
                        onTap: () => controller.selectBuilding(building.id),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(child: Text(building.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: isSelected ? AppColors.primaryBlue : Colors.black87))),
                                if (building.terracePoints.isNotEmpty && building.panels.isNotEmpty) Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  child: InkWell(
                                    onTap: () {
                                      controller.selectBuilding(building.id);
                                      _showBOMDialog();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(color: AppColors.primaryBlue, borderRadius: BorderRadius.circular(20)),
                                      child: const Text("BOM", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: const Text("Delete Building"),
                                        content: Text("Are you sure you want to delete '${building.name}'?"),
                                        actions: [
                                          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
                                          TextButton(
                                            onPressed: () {
                                              controller.deleteBuilding(building.id);
                                              Navigator.pop(context);
                                            },
                                            style: TextButton.styleFrom(foregroundColor: Colors.red),
                                            child: const Text("Delete"),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ]),
                              const SizedBox(height: 8),
                              Row(children: [
                                Icon(Icons.article_outlined, size: 14, color: isSelected ? AppColors.primaryBlue : Colors.grey),
                                const SizedBox(width: 4),
                                Text(building.projectType, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.primaryBlue : Colors.grey[600])),
                              ]),
                              Row(children: [
                                Icon(Icons.person, size: 14, color: isSelected ? AppColors.primaryBlue : Colors.grey),
                                const SizedBox(width: 4),
                                Text(building.customerName, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.primaryBlue : Colors.grey[600])),
                              ]),
                              const SizedBox(height: 4),
                              Row(children: [
                                Icon(Icons.phone, size: 14, color: isSelected ? AppColors.primaryBlue : Colors.grey),
                                const SizedBox(width: 4),
                                Text(building.customerMobile, style: TextStyle(fontSize: 12, color: isSelected ? AppColors.primaryBlue : Colors.grey[600])),
                              ]),
                              const SizedBox(height: 12),
                              Wrap(spacing: 8, runSpacing: 8, children: [
                                if (building.terracePoints.isNotEmpty) _buildStatusChip("Terrace", Icons.draw, isSelected ? AppColors.primaryBlue : Colors.green),
                                if (building.panels.isNotEmpty) _buildStatusChip("${building.panels.length} Panels", Icons.solar_power, isSelected ? AppColors.primaryBlue : Colors.blue),
                                if (building.isSaved) _buildStatusChip("Saved", Icons.check_circle, isSelected ? AppColors.primaryBlue : Colors.green),
                              ]),
                              if (building.totalKw > 0) Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("${building.totalKw.toStringAsFixed(2)} KW", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isSelected ? AppColors.primaryBlue : AppColors.primaryBlue.withOpacity(0.7))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: _showCreateBuildingDialog,
                icon: const Icon(Icons.add, size: 20),
                label: const Text("New Building", style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}