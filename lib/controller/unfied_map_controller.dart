// // import 'dart:async';
// // import 'dart:math';
// // import 'dart:ui' as ui;
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// //
// // class Walkway {
// //   String id;
// //   String name;
// //   List<LatLng> points;
// //   bool isHorizontal;
// //   double width;
// //   double length;
// //   double maxLength;
// //   double rotationAngle;
// //
// //   Walkway({
// //     required this.id,
// //     required this.points,
// //     this.isHorizontal = true,
// //     this.width = 0.5,
// //     this.length = 3.0,
// //     required this.maxLength,
// //     this.rotationAngle = 0,
// //     required this.name,
// //   });
// //
// //   Polygon toPolygon() => Polygon(
// //     polygonId: PolygonId(id),
// //     points: points,
// //     strokeWidth: 1,
// //     strokeColor: Colors.deepOrange,
// //     fillColor: Colors.deepOrange.withOpacity(0.5),
// //   );
// //
// //   Walkway copyWith({
// //     List<LatLng>? points,
// //     bool? isHorizontal,
// //     double? width,
// //     double? length,
// //     double? maxLength,
// //     String? name,
// //   }) {
// //     return Walkway(
// //       id: id,
// //       points: points ?? this.points,
// //       isHorizontal: isHorizontal ?? this.isHorizontal,
// //       width: width ?? this.width,
// //       length: length ?? this.length,
// //       maxLength: maxLength ?? this.maxLength,
// //       name: name ?? this.name,
// //     );
// //   }
// // }
// //
// // class Building {
// //   String id;
// //   String name;
// //   String customerName;
// //   String customerMobile;
// //   List<LatLng> terracePoints;
// //   List<LatLng> panels;
// //   List<Walkway> walkways;
// //   bool isHorizontal;
// //   bool isAlternate;
// //   double padding;
// //   double rowSpacing;
// //   int selectedPanelCount;
// //   int selectedRows;
// //   double totalKw;
// //   String terraceType;
// //   int frontLegHeight;
// //   int backLegHeight;
// //   String mountingStyle;
// //   double paneltotalWidth;
// //   double paneltotalHeight;
// //   int f6040;
// //   int f4040;
// //   int lAngle_qty;
// //   int americanBolt_qty;
// //   int zink_qty;
// //   int jBolt_qty;
// //   int foundation_qty;
// //   int dcWire_meter;
// //   int acWire_meter;
// //   int extraPipes;
// //   double totalKg;
// //   bool isMeterOrFeet;
// //   String inverterPosition;
// //   String structureType;
// //   bool isSaved;
// //   String selectedProjectType;
// //   String selectedTechnology;
// //   String selectedPanelWatt;
// //   String selectedKilowatt;
// //
// //   Building({
// //     required this.id,
// //     required this.name,
// //     this.customerName = "",
// //     this.customerMobile = "",
// //     this.terracePoints = const [],
// //     this.panels = const [],
// //     this.walkways = const [],
// //     this.isHorizontal = true,
// //     this.isAlternate = false,
// //     this.padding = 0,
// //     this.rowSpacing = 0,
// //     this.selectedPanelCount = 0,
// //     this.selectedRows = 1,
// //     this.totalKw = 0,
// //     this.terraceType = "Rcc Roof",
// //     this.frontLegHeight = 0,
// //     this.backLegHeight = 0,
// //     this.mountingStyle = "Legs On Terrace",
// //     this.paneltotalWidth = 0,
// //     this.paneltotalHeight = 0,
// //     this.f6040 = 0,
// //     this.f4040 = 0,
// //     this.lAngle_qty = 0,
// //     this.americanBolt_qty = 0,
// //     this.zink_qty = 0,
// //     this.jBolt_qty = 0,
// //     this.foundation_qty = 0,
// //     this.dcWire_meter = 0,
// //     this.acWire_meter = 0,
// //     this.extraPipes = 0,
// //     this.totalKg = 0,
// //     this.isMeterOrFeet = true,
// //     this.inverterPosition = "Ground Floor",
// //     this.structureType = "Hot dig Gi(Galvanised iron)",
// //     this.isSaved = false,
// //     this.selectedProjectType = "",
// //     this.selectedTechnology = "",
// //     this.selectedPanelWatt = "545",
// //     this.selectedKilowatt = "",
// //   });
// //
// //   Building copyWith({
// //     String? id,
// //     String? name,
// //     String? customerName,
// //     String? customerMobile,
// //     List<LatLng>? terracePoints,
// //     List<LatLng>? panels,
// //     List<Walkway>? walkways,
// //     bool? isHorizontal,
// //     bool? isAlternate,
// //     double? padding,
// //     double? rowSpacing,
// //     int? selectedPanelCount,
// //     int? selectedRows,
// //     double? totalKw,
// //     String? terraceType,
// //     int? frontLegHeight,
// //     int? backLegHeight,
// //     String? mountingStyle,
// //     double? paneltotalWidth,
// //     double? paneltotalHeight,
// //     int? f6040,
// //     int? f4040,
// //     int? lAngle_qty,
// //     int? americanBolt_qty,
// //     int? zink_qty,
// //     int? jBolt_qty,
// //     int? foundation_qty,
// //     int? dcWire_meter,
// //     int? acWire_meter,
// //     int? extraPipes,
// //     double? totalKg,
// //     bool? isMeterOrFeet,
// //     String? inverterPosition,
// //     String? structureType,
// //     bool? isSaved,
// //     String? selectedProjectType,
// //     String? selectedTechnology,
// //     String? selectedPanelWatt,
// //     String? selectedKilowatt,
// //   }) {
// //     return Building(
// //       id: id ?? this.id,
// //       name: name ?? this.name,
// //       customerName: customerName ?? this.customerName,
// //       customerMobile: customerMobile ?? this.customerMobile,
// //       terracePoints: terracePoints ?? this.terracePoints,
// //       panels: panels ?? this.panels,
// //       walkways: walkways ?? this.walkways,
// //       isHorizontal: isHorizontal ?? this.isHorizontal,
// //       isAlternate: isAlternate ?? this.isAlternate,
// //       padding: padding ?? this.padding,
// //       rowSpacing: rowSpacing ?? this.rowSpacing,
// //       selectedPanelCount: selectedPanelCount ?? this.selectedPanelCount,
// //       selectedRows: selectedRows ?? this.selectedRows,
// //       totalKw: totalKw ?? this.totalKw,
// //       terraceType: terraceType ?? this.terraceType,
// //       frontLegHeight: frontLegHeight ?? this.frontLegHeight,
// //       backLegHeight: backLegHeight ?? this.backLegHeight,
// //       mountingStyle: mountingStyle ?? this.mountingStyle,
// //       paneltotalWidth: paneltotalWidth ?? this.paneltotalWidth,
// //       paneltotalHeight: paneltotalHeight ?? this.paneltotalHeight,
// //       f6040: f6040 ?? this.f6040,
// //       f4040: f4040 ?? this.f4040,
// //       lAngle_qty: lAngle_qty ?? this.lAngle_qty,
// //       americanBolt_qty: americanBolt_qty ?? this.americanBolt_qty,
// //       zink_qty: zink_qty ?? this.zink_qty,
// //       jBolt_qty: jBolt_qty ?? this.jBolt_qty,
// //       foundation_qty: foundation_qty ?? this.foundation_qty,
// //       dcWire_meter: dcWire_meter ?? this.dcWire_meter,
// //       acWire_meter: acWire_meter ?? this.acWire_meter,
// //       extraPipes: extraPipes ?? this.extraPipes,
// //       totalKg: totalKg ?? this.totalKg,
// //       isMeterOrFeet: isMeterOrFeet ?? this.isMeterOrFeet,
// //       inverterPosition: inverterPosition ?? this.inverterPosition,
// //       structureType: structureType ?? this.structureType,
// //       isSaved: isSaved ?? this.isSaved,
// //       selectedProjectType: selectedProjectType ?? this.selectedProjectType,
// //       selectedTechnology: selectedTechnology ?? this.selectedTechnology,
// //       selectedPanelWatt: selectedPanelWatt ?? this.selectedPanelWatt,
// //       selectedKilowatt: selectedKilowatt ?? this.selectedKilowatt,
// //     );
// //   }
// // }
// //
// // class UnifiedSurveyController extends GetxController {
// //   // Reactive variables
// //   var polygonPoints = <LatLng>[].obs;
// //   var polygonArea = 0.0.obs;
// //   var distanceMarkers = <Marker>{}.obs;
// //   var isSelectingArea = false.obs;
// //   var isEditingTerrace = false.obs;
// //   var isEditingTerraceLayout = false.obs;  // <-- ADD THIS
// //   var showStreetView = false.obs;
// //   var pickedLocation = LatLng(22.260076, 70.787970).obs;
// //   var showInMeters = true.obs;
// //   var boundaryIcon = BitmapDescriptor.defaultMarker.obs;
// //   var walkWayIcon = BitmapDescriptor.defaultMarker.obs;
// //   var panelDragIcon = BitmapDescriptor.defaultMarker.obs;
// //
// //   var currentMode = 1.obs;
// //   var isDrawingTerrace = false.obs;
// //   var hasTerrace = false.obs;
// //   var hasPanels = false.obs;
// //   var isSaved = false.obs;
// //   var isLoading = false.obs;
// //   var isDraggingPanels = false.obs;
// //   var editingTerraceIndex = (-1).obs;
// //
// //   // Panel edit controls
// //   var paddingValue = 0.0.obs;
// //   var rowSpacingValue = 0.0.obs;
// //   var availableRowsForEdit = <int>[].obs;
// //
// //   var dragHandlePosition = LatLng(0, 0).obs;
// //   var originalPanelCenters = <LatLng>[].obs;
// //   LatLng? dragStartPoint;
// //
// //   var buildings = <Building>[].obs;
// //   var selectedBuildingId = "".obs;
// //
// //   Building? get currentBuilding {
// //     if (selectedBuildingId.isEmpty) return null;
// //     try {
// //       return buildings.firstWhere((b) => b.id == selectedBuildingId.value);
// //     } catch (e) {
// //       return null;
// //     }
// //   }
// //
// //   var selectedPanelCount = 0.obs;
// //   var groupRowsForSpace = 1.obs;   // number of rows per group for As Per Space mode
// //
// //   var selectedRows = 1.obs;
// //   var availableRows = <int>[].obs;
// //   var isHorizontal = true.obs;
// //   var terraceType = "Rcc Roof".obs;
// //   var frontLegHeight = 0.obs;
// //   var backLegHeight = 0.obs;
// //   var isMeterOrFeet = true.obs;
// //   var inverterPosition = "Ground Floor".obs;
// //   var structureType = "Hot dig Gi(Galvanised iron)".obs;
// //   var totalPanelWidth = 0.0.obs;
// //   var totalPanelHeight = 0.0.obs;
// //
// //   var selectedProjectType = "".obs;
// //   var selectedTechnology = "".obs;
// //   var selectedPanelWatt = "545".obs;
// //   var selectedKilowatt = "".obs;
// //
// //   final List<String> projectTypes = ["Residential", "Commercial", "Industrial"];
// //   final List<String> technologies = ["Bifacial", "Topcon", "Mono Perc"];
// //   final List<String> panelWatts = ["540", "545", "550", "555", "560", "565", "570", "575"];
// //   final List<String> kilowattOptions = ["2.27", "3.24", "4.20", "5.25", "6.30", "7.35", "8.40", "9.45", "10.50"];
// //   final List<String> terraceTypes = ["Rcc Roof", "Slant Roof", "Ground Mountain"];
// //   final List<String> structureTypes = ["Hot dig Gi(Galvanised iron)", "Aluminium", "GI Structure"];
// //   final List<String> inverterPositions = ["Ground Floor", "Sidi Room", "Terrace", "Roof Top"];
// //
// //   GoogleMapController? mapController;
// //   final double earthRadius = 6371000;
// //
// //   RxList<Walkway> currentWalkways = <Walkway>[].obs;
// //   RxInt editingWalkwayIndex = (-1).obs;
// //   RxString selectedWalkwayWidth = "270".obs;
// //   RxList<LatLng> currentHandRailPoints = <LatLng>[].obs;
// //   RxBool isDrawingHandRail = false.obs;
// //   RxBool isHandRailComplete = false.obs;
// //   final RxSet<Polygon> solarPanelsPolygons = <Polygon>{}.obs;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     loadIcons();
// //   }
// //
// //   Future<void> loadIcons() async {
// //     boundaryIcon.value = await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(size: Size(22, 22)),
// //       "assets/images/bcircle3.png",
// //     );
// //     walkWayIcon.value = await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(size: Size(10, 10)),
// //       "assets/images/wcircle.png",
// //     );
// //     panelDragIcon.value = await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(size: Size(22, 22)),
// //       "assets/images/panelDragHandle.png",
// //     );
// //   }
// //
// //   bool isPolygonValid(List<LatLng> points) {
// //     if (points.length < 3) return true;
// //     for (int i = 0; i < points.length; i++) {
// //       final p1 = points[i];
// //       final p2 = points[(i + 1) % points.length];
// //       for (int j = i + 2; j < points.length; j++) {
// //         final p3 = points[j];
// //         final p4 = points[(j + 1) % points.length];
// //         if (i == j || (i + 1) % points.length == j || (j + 1) % points.length == i) continue;
// //         if (_lineSegmentsIntersect(p1, p2, p3, p4)) return false;
// //       }
// //     }
// //     return true;
// //   }
// //
// //   bool _lineSegmentsIntersect(LatLng p1, LatLng p2, LatLng p3, LatLng p4) {
// //     double orientation(LatLng a, LatLng b, LatLng c) {
// //       double val = (b.latitude - a.latitude) * (c.longitude - b.longitude) -
// //           (b.longitude - a.longitude) * (c.latitude - b.latitude);
// //       if (val.abs() < 1e-10) return 0;
// //       return val.sign;
// //     }
// //     double o1 = orientation(p1, p2, p3);
// //     double o2 = orientation(p1, p2, p4);
// //     double o3 = orientation(p3, p4, p1);
// //     double o4 = orientation(p3, p4, p2);
// //     if (o1 != o2 && o3 != o4) return true;
// //     if (o1 == 0 && _onSegment(p1, p3, p2)) return true;
// //     if (o2 == 0 && _onSegment(p1, p4, p2)) return true;
// //     if (o3 == 0 && _onSegment(p3, p1, p4)) return true;
// //     if (o4 == 0 && _onSegment(p3, p2, p4)) return true;
// //     return false;
// //   }
// //
// //   bool _onSegment(LatLng p, LatLng q, LatLng r) {
// //     return q.latitude <= max(p.latitude, r.latitude) &&
// //         q.latitude >= min(p.latitude, r.latitude) &&
// //         q.longitude <= max(p.longitude, r.longitude) &&
// //         q.longitude >= min(p.longitude, r.longitude);
// //   }
// //
// //   void createNewBuilding(String name, String customerName, String customerMobile) {
// //     final newBuilding = Building(
// //       id: DateTime.now().millisecondsSinceEpoch.toString(),
// //       name: name,
// //       customerName: customerName,
// //       customerMobile: customerMobile,
// //     );
// //     buildings.add(newBuilding);
// //     selectedBuildingId.value = newBuilding.id;
// //     isSelectingArea.value = true;
// //     isDrawingTerrace.value = true;
// //     hasTerrace.value = false;
// //     hasPanels.value = false;
// //     isSaved.value = false;
// //     isEditingTerraceLayout.value = false;
// //     clearTerrace();
// //   }
// //
// //   void clearTerrace() {
// //     polygonPoints.clear();
// //     polygonArea.value = 0.0;
// //     distanceMarkers.clear();
// //     solarPanelsPolygons.clear();
// //     currentWalkways.clear();
// //     currentHandRailPoints.clear();
// //     isDrawingHandRail.value = false;
// //     isHandRailComplete.value = false;
// //   }
// //
// //   void addPolygonPoint(LatLng point) {
// //     if (isSelectingArea.value && isDrawingTerrace.value) {
// //       polygonPoints.add(point);
// //       updatePolygon();
// //     }
// //   }
// //
// //   void undoLastPoint() {
// //     if (polygonPoints.isNotEmpty) {
// //       polygonPoints.removeLast();
// //       updatePolygon();
// //     }
// //   }
// //
// //   void updatePolygonPoint(int index, LatLng newPosition) {
// //     if (index >= 0 && index < polygonPoints.length) {
// //       polygonPoints[index] = newPosition;
// //       updatePolygon(forceUpdate: true);
// //     }
// //   }
// //
// //   void removePolygonPoint(int index) {
// //     if (index >= 0 && index < polygonPoints.length) {
// //       polygonPoints.removeAt(index);
// //       updatePolygon();
// //     }
// //   }
// //
// //   void startEditingTerrace() {
// //     if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty) {
// //       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
// //       isSelectingArea.value = true;
// //       isEditingTerrace.value = true;
// //       isDrawingTerrace.value = false;
// //       editingTerraceIndex.value = 0;
// //       // Show the edit card
// //       isEditingTerraceLayout.value = true;
// //       // Load current layout values
// //       selectedRows.value = currentBuilding!.selectedRows;
// //       isHorizontal.value = currentBuilding!.isHorizontal;
// //       paddingValue.value = currentBuilding!.padding;
// //       rowSpacingValue.value = currentBuilding!.rowSpacing;
// //       updateAvailableRowsForEdit();
// //     }
// //   }
// //
// //   bool saveEditedTerrace() {
// //     if (polygonPoints.length < 3) return false;
// //     if (!isPolygonValid(polygonPoints)) return false;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           terracePoints: List<LatLng>.from(polygonPoints),
// //           isSaved: false,
// //         );
// //       }
// //     }
// //     isSelectingArea.value = false;
// //     isEditingTerrace.value = false;
// //     hasTerrace.value = true;
// //     editingTerraceIndex.value = -1;
// //     isEditingTerraceLayout.value = false; // hide edit card
// //     if (hasPanels.value) calculateAndShowPanels();
// //     return true;
// //   }
// //
// //   void cancelEditingTerrace() {
// //     if (currentBuilding != null) {
// //       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
// //     }
// //     isSelectingArea.value = false;
// //     isEditingTerrace.value = false;
// //     editingTerraceIndex.value = -1;
// //     isEditingTerraceLayout.value = false; // hide edit card
// //     updatePolygon();
// //   }
// //
// //   bool completeTerraceDrawing() {
// //     if (polygonPoints.length < 3) return false;
// //     if (!isPolygonValid(polygonPoints)) return false;
// //     isSelectingArea.value = false;
// //     isDrawingTerrace.value = false;
// //     hasTerrace.value = true;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           terracePoints: List<LatLng>.from(polygonPoints),
// //         );
// //       }
// //     }
// //     editingTerraceIndex.value = 0;
// //     return true;
// //   }
// //
// //   void saveStructureDetails({
// //     required String terraceTypeVal,
// //     required String structureTypeVal,
// //     required String inverterPositionVal,
// //     required bool isMeterOrFeetVal,
// //     required int frontLegHeightVal,
// //     required int backLegHeightVal,
// //   }) {
// //     terraceType.value = terraceTypeVal;
// //     structureType.value = structureTypeVal;
// //     inverterPosition.value = inverterPositionVal;
// //     isMeterOrFeet.value = isMeterOrFeetVal;
// //     frontLegHeight.value = frontLegHeightVal;
// //     backLegHeight.value = backLegHeightVal;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           terraceType: terraceTypeVal,
// //           structureType: structureTypeVal,
// //           inverterPosition: inverterPositionVal,
// //           isMeterOrFeet: isMeterOrFeetVal,
// //           frontLegHeight: frontLegHeightVal,
// //           backLegHeight: backLegHeightVal,
// //         );
// //       }
// //     }
// //   }
// //
// //   void savePanelConfiguration({
// //     required String projectType,
// //     required String technology,
// //     required String panelWatt,
// //     required String kilowatt,
// //     required int panelCount,
// //   }) {
// //     selectedProjectType.value = projectType;
// //     selectedTechnology.value = technology;
// //     selectedPanelWatt.value = panelWatt;
// //     selectedKilowatt.value = kilowatt;
// //     selectedPanelCount.value = panelCount;
// //     selectedRows.value = 1;
// //     isHorizontal.value = true;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           selectedProjectType: projectType,
// //           selectedTechnology: technology,
// //           selectedPanelWatt: panelWatt,
// //           selectedKilowatt: kilowatt,
// //           selectedPanelCount: panelCount,
// //           selectedRows: 1,
// //           isHorizontal: true,
// //         );
// //       }
// //     }
// //     calculateAndShowPanels();
// //   }
// //
// //   void updateAvailableRows() {
// //     if (selectedPanelCount.value <= 0 || currentBuilding == null) {
// //       availableRows.value = [1];
// //       selectedRows.value = 1;
// //       return;
// //     }
// //     final feasibleRows = <int>[];
// //     for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
// //       if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
// //     }
// //     availableRows.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
// //     if (availableRows.isNotEmpty && !availableRows.contains(selectedRows.value)) {
// //       selectedRows.value = availableRows.first;
// //     }
// //   }
// //
// //   void updateAvailableRowsForEdit() {
// //     if (selectedPanelCount.value <= 0 || currentBuilding == null) {
// //       availableRowsForEdit.value = [1];
// //       selectedRows.value = 1;
// //       return;
// //     }
// //     final feasibleRows = <int>[];
// //     for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
// //       if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
// //     }
// //     availableRowsForEdit.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
// //     if (availableRowsForEdit.isNotEmpty && !availableRowsForEdit.contains(selectedRows.value)) {
// //       selectedRows.value = availableRowsForEdit.first;
// //     }
// //   }
// //
// //   bool isRowConfigurationFeasible(int rows) {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return false;
// //     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //     final columns = (selectedPanelCount.value / rows).ceil();
// //     const double panelWidth = 1.13, panelHeight = 2.27;
// //     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
// //     final double panelHeightDeg = panelHeight / 111111.0;
// //     double requiredWidth = isHorizontal.value ? columns * panelHeightDeg : columns * panelWidthDeg;
// //     double requiredHeight = isHorizontal.value ? rows * panelWidthDeg : rows * panelHeightDeg;
// //     double availableWidth = (bounds.northeast.longitude - bounds.southwest.longitude).abs();
// //     double availableHeight = (bounds.northeast.latitude - bounds.southwest.latitude).abs();
// //     return requiredWidth <= availableWidth && requiredHeight <= availableHeight;
// //   }
// //
// //   void calculateAndShowPanels() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     List<LatLng> centers;
// //     if (currentMode.value == 1) {
// //       centers = calculatePanelCentersWithRows(
// //         currentBuilding!.terracePoints,
// //         selectedPanelCount.value,
// //         selectedRows.value,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //       );
// //     } else {
// //       centers = calculatePanelCentersFull(
// //         currentBuilding!.terracePoints,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //         groupRowsForSpace.value,
// //       );
// //     }
// //     totalPanelWidth.value = calculatePanelStructureWidth(centers, isHorizontal.value);
// //     totalPanelHeight.value = calculatePanelStructureHeight(centers, isHorizontal.value);
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(
// //         panels: centers,
// //         selectedPanelCount: selectedPanelCount.value,
// //         selectedRows: selectedRows.value,
// //         isHorizontal: isHorizontal.value,
// //         paneltotalWidth: totalPanelWidth.value,
// //         paneltotalHeight: totalPanelHeight.value,
// //         isSaved: false,
// //         padding: paddingValue.value,
// //         rowSpacing: rowSpacingValue.value,
// //       );
// //     }
// //     solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
// //     hasPanels.value = true;
// //     if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
// //     double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
// //     if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
// //   }
// //
// //   void updatePanelsFromEditCard() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     List<LatLng> centers;
// //     if (currentMode.value == 1) {
// //       centers = calculatePanelCentersWithRows(
// //         currentBuilding!.terracePoints,
// //         selectedPanelCount.value,
// //         selectedRows.value,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //       );
// //     } else {
// //       centers = calculatePanelCentersFull(
// //         currentBuilding!.terracePoints,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //         groupRowsForSpace.value,
// //       );
// //     }
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(
// //         panels: centers,
// //         isHorizontal: isHorizontal.value,
// //         selectedRows: selectedRows.value,
// //         padding: paddingValue.value,
// //         rowSpacing: rowSpacingValue.value,
// //       );
// //     }
// //     solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
// //     if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
// //     double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
// //     if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
// //   }
// //
// //   LatLng getPanelsCenter(List<LatLng> panels) {
// //     if (panels.isEmpty) return pickedLocation.value;
// //     double sumLat = 0, sumLng = 0;
// //     for (final panel in panels) {
// //       sumLat += panel.latitude;
// //       sumLng += panel.longitude;
// //     }
// //     return LatLng(sumLat / panels.length, sumLng / panels.length);
// //   }
// //
// //   void moveAllPanels(double latDelta, double lngDelta) {
// //     if (editingTerraceIndex.value == -1) return;
// //     if (currentBuilding == null) return;
// //     final terrace = currentBuilding!;
// //     final List<LatLng> newCenters = [];
// //     for (final panel in terrace.panels) {
// //       final newPos = LatLng(panel.latitude + latDelta, panel.longitude + lngDelta);
// //       if (!_isPointInPolygon(newPos, terrace.terracePoints)) return;
// //       newCenters.add(newPos);
// //     }
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(panels: newCenters, isSaved: false);
// //     }
// //     solarPanelsPolygons.value = convertCentersToPolygons(newCenters, isHorizontal.value);
// //     if (newCenters.isNotEmpty) dragHandlePosition.value = getPanelsCenter(newCenters);
// //   }
// //
// //   double calculatePanelStructureWidth(List<LatLng> panels, bool isHorizontal) {
// //     if (panels.isEmpty) return 0.0;
// //     final rows = <double, List<LatLng>>{};
// //     for (final panel in panels) {
// //       final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
// //       rows.putIfAbsent(rowKey, () => []).add(panel);
// //     }
// //     int maxPanelsInRow = 0;
// //     for (final row in rows.values) {
// //       if (row.length > maxPanelsInRow) maxPanelsInRow = row.length;
// //     }
// //     return isHorizontal ? maxPanelsInRow * 2.27 : maxPanelsInRow * 1.13;
// //   }
// //
// //   double calculatePanelStructureHeight(List<LatLng> panels, bool isHorizontal) {
// //     if (panels.isEmpty) return 0.0;
// //     final rows = <double, List<LatLng>>{};
// //     for (final panel in panels) {
// //       final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
// //       rows.putIfAbsent(rowKey, () => []).add(panel);
// //     }
// //     return isHorizontal ? rows.length * 1.13 : rows.length * 2.27;
// //   }
// //
// //   List<LatLng> calculatePanelCentersWithRows(
// //       List<LatLng> polygonPoints,
// //       int panelCount,
// //       int rows,
// //       bool isHorizontal,
// //       double padding,
// //       double rowSpacing,
// //       ) {
// //     if (polygonPoints.length < 3 || panelCount <= 0 || rows <= 0) return [];
// //     final bounds = getPolygonBounds(polygonPoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //     final double paddingLat = padding / 111111.0;
// //     final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
// //     final double paddedSouth = bounds.southwest.latitude + paddingLat;
// //     final double paddedNorth = bounds.northeast.latitude - paddingLat;
// //     final double paddedWest = bounds.southwest.longitude + paddingLng;
// //     final double paddedEast = bounds.northeast.longitude - paddingLng;
// //     if (paddedSouth >= paddedNorth || paddedWest >= paddedEast) return [];
// //
// //     final columns = (panelCount / rows).ceil();
// //     const double panelWidth = 1.13, panelHeight = 2.27;
// //     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
// //     final double panelHeightDeg = panelHeight / 111111.0;
// //     double lngStep, latStep;
// //     if (isHorizontal) {
// //       lngStep = panelHeightDeg;
// //       latStep = panelWidthDeg;
// //     } else {
// //       lngStep = panelWidthDeg;
// //       latStep = panelHeightDeg;
// //     }
// //     final double rowSpacingDeg = rowSpacing / 111111.0;
// //     final double totalWidth = (columns - 1) * lngStep;
// //     final double totalHeight = (rows - 1) * (latStep + rowSpacingDeg);
// //     final double startLngCentered = paddedWest + (paddedEast - paddedWest - totalWidth) / 2;
// //     final double startLatCentered = paddedNorth - (paddedNorth - paddedSouth - totalHeight) / 2;
// //     List<LatLng> centers = [];
// //     int panelsPlaced = 0;
// //     List<int> rowPanelCounts = List.filled(rows, columns);
// //     int remaining = panelCount;
// //     for (int i = 0; i < rows && remaining > 0; i++) {
// //       if (i == rows - 1) rowPanelCounts[i] = remaining;
// //       else {
// //         rowPanelCounts[i] = (remaining / (rows - i)).ceil();
// //         remaining -= rowPanelCounts[i];
// //       }
// //     }
// //     for (int row = 0; row < rows && panelsPlaced < panelCount; row++) {
// //       int panelsInRow = rowPanelCounts[row];
// //       double rowStartLng = startLngCentered + ((columns - panelsInRow) * lngStep / 2);
// //       double rowTopLat = startLatCentered - (row * (latStep + rowSpacingDeg));
// //       for (int col = 0; col < panelsInRow && panelsPlaced < panelCount; col++) {
// //         final double centerLng = rowStartLng + (col * lngStep) + (lngStep / 2);
// //         final double centerLat = rowTopLat - (latStep / 2);
// //         final LatLng panelCenter = LatLng(centerLat, centerLng);
// //         if (_isPointInPolygon(panelCenter, polygonPoints)) {
// //           centers.add(panelCenter);
// //           panelsPlaced++;
// //         }
// //       }
// //     }
// //     return centers;
// //   }
// //
// //   List<LatLng> calculatePanelCentersFull(
// //       List<LatLng> polygonPoints,
// //       bool isHorizontal,
// //       double padding,
// //       double rowSpacing,
// //       int groupRows,   // how many rows per group (spacing after each group)
// //       ) {
// //     if (polygonPoints.length < 3) return [];
// //     final bounds = getPolygonBounds(polygonPoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //     final double paddingLat = padding / 111111.0;
// //     final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
// //     final double startLat = bounds.southwest.latitude + paddingLat;
// //     final double endLat = bounds.northeast.latitude - paddingLat;
// //     final double startLng = bounds.southwest.longitude + paddingLng;
// //     final double endLng = bounds.northeast.longitude - paddingLng;
// //     if (startLat >= endLat || startLng >= endLng) return [];
// //
// //     const double panelWidth = 1.13, panelHeight = 2.27;
// //     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
// //     final double panelHeightDeg = panelHeight / 111111.0;
// //     int cols, rows;
// //     if (isHorizontal) {
// //       cols = ((endLng - startLng) / panelHeightDeg).floor();
// //       rows = ((endLat - startLat) / panelWidthDeg).floor();
// //     } else {
// //       cols = ((endLng - startLng) / panelWidthDeg).floor();
// //       rows = ((endLat - startLat) / panelHeightDeg).floor();
// //     }
// //     if (cols <= 0 || rows <= 0) return [];
// //     final double stepLng = isHorizontal ? panelHeightDeg : panelWidthDeg;
// //     final double stepLat = isHorizontal ? panelWidthDeg : panelHeightDeg;
// //     final double rowSpacingDeg = rowSpacing / 111111.0;
// //
// //     // Calculate number of groups
// //     int numberOfGroups = (rows / groupRows).ceil();
// //     int rowsInLastGroup = rows % groupRows;
// //     if (rowsInLastGroup == 0) rowsInLastGroup = groupRows;
// //
// //     // Total height = sum of group heights + spacing between groups
// //     double totalHeight = 0;
// //     for (int g = 0; g < numberOfGroups; g++) {
// //       int rowsInThisGroup = (g == numberOfGroups - 1) ? rowsInLastGroup : groupRows;
// //       totalHeight += rowsInThisGroup * stepLat;
// //       if (g < numberOfGroups - 1) totalHeight += rowSpacingDeg;
// //     }
// //
// //     final double startLngCentered = startLng + (endLng - startLng - (cols * stepLng)) / 2;
// //     final double startLatCentered = endLat - (endLat - startLat - totalHeight) / 2;
// //
// //     List<LatLng> centers = [];
// //     double currentY = startLatCentered;
// //     for (int g = 0; g < numberOfGroups; g++) {
// //       int rowsInThisGroup = (g == numberOfGroups - 1) ? rowsInLastGroup : groupRows;
// //       for (int row = 0; row < rowsInThisGroup; row++) {
// //         final double rowTopLat = currentY - (row * stepLat);
// //         final double rowStartLng = startLngCentered;
// //         for (int col = 0; col < cols; col++) {
// //           final double centerLng = rowStartLng + (col * stepLng) + (stepLng / 2);
// //           final double centerLat = rowTopLat - (stepLat / 2);
// //           final LatLng panelCenter = LatLng(centerLat, centerLng);
// //           if (_isPointInPolygon(panelCenter, polygonPoints)) centers.add(panelCenter);
// //         }
// //       }
// //       // Move down for the next group, adding spacing if not the last group
// //       currentY -= (rowsInThisGroup * stepLat + rowSpacingDeg);
// //     }
// //     return centers;
// //   }
// //
// //   bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
// //     bool inside = false;
// //     for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
// //       final xi = polygon[i].latitude, yi = polygon[i].longitude;
// //       final xj = polygon[j].latitude, yj = polygon[j].longitude;
// //       final intersect = ((yi > point.longitude) != (yj > point.longitude)) &&
// //           (point.latitude < (xj - xi) * (point.longitude - yi) / (yj - yi) + xi);
// //       if (intersect) inside = !inside;
// //     }
// //     return inside;
// //   }
// //
// //   Set<Polygon> convertCentersToPolygons(List<LatLng> centers, bool isHorizontal) {
// //     return centers.map((center) => _createPanelPolygon(center, isHorizontal)).toSet();
// //   }
// //
// //   Polygon _createPanelPolygon(LatLng center, bool isHorizontal, {int rowIndex = 0}) {
// //     final panelWidth = isHorizontal ? 2.27 : 1.13;
// //     final panelHeight = isHorizontal ? 1.13 : 2.27;
// //     final latDelta = panelHeight / 111111.0 / 2;
// //     final lngDelta = panelWidth / (111111.0 * cos(center.latitude * pi / 180)) / 2;
// //     return Polygon(
// //       polygonId: PolygonId('panel_${center.latitude}_${center.longitude}_$rowIndex'),
// //       points: [
// //         LatLng(center.latitude - latDelta, center.longitude - lngDelta),
// //         LatLng(center.latitude - latDelta, center.longitude + lngDelta),
// //         LatLng(center.latitude + latDelta, center.longitude + lngDelta),
// //         LatLng(center.latitude + latDelta, center.longitude - lngDelta),
// //       ],
// //       strokeWidth: 1,
// //       strokeColor: Colors.white,
// //       fillColor: Colors.blue.withOpacity(0.8),
// //     );
// //   }
// //
// //   void saveTerrace() {
// //     if (currentBuilding == null) return;
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) buildings[index] = buildings[index].copyWith(isSaved: true);
// //     isSaved.value = true;
// //     isEditingTerraceLayout.value = false;
// //   }
// //
// //   void calculateBOM() {
// //     if (currentBuilding == null) return;
// //     double paneltotal_width = currentBuilding!.paneltotalWidth;
// //     double paneltotal_Height = currentBuilding!.paneltotalHeight;
// //     int nof_Rows = currentBuilding!.selectedRows;
// //     bool isMeterOrFeet = currentBuilding!.isMeterOrFeet;
// //     int nofPanels = currentBuilding!.panels.length;
// //     int nof_FrontLeg = (paneltotal_width / 1.5).round();
// //     int nof_BackLeg = (paneltotal_Height / 3.048).round();
// //     if (paneltotal_Height > 3.048) nof_BackLeg += 1;
// //     int legs;
// //     if (isMeterOrFeet) {
// //       double frontLegHeight = currentBuilding!.frontLegHeight / 3.281;
// //       double backLegHeight = currentBuilding!.backLegHeight / 3.281;
// //       legs = nof_FrontLeg * (frontLegHeight + backLegHeight).floor();
// //     } else {
// //       legs = nof_FrontLeg * (currentBuilding!.frontLegHeight + currentBuilding!.backLegHeight).toInt();
// //     }
// //     var rafter = nof_FrontLeg * nof_Rows;
// //     var perlin = nof_Rows * paneltotal_width * 2;
// //     double f6040 = (legs + rafter) * 0.8;
// //     int f6040_2 = f6040.floor();
// //     int f4040 = (perlin * 0.8).floor();
// //     var totalKg = (f6040_2 + f4040) * 3.28;
// //     double qty6040 = ((legs + rafter) * 3.28) / 20;
// //     int qty6040_1 = qty6040.floor();
// //     var qty4040 = (perlin * 3.28) / 20;
// //     int qty4040_1 = qty4040.floor();
// //     double borderTotalLength = 2 * (paneltotal_width + paneltotal_Height);
// //     int extraPipes = 0;
// //     if (isMeterOrFeet) {
// //       int epipes = (borderTotalLength / 6.096).round();
// //       extraPipes = currentBuilding!.backLegHeight >= 8 ? epipes : 0;
// //     } else {
// //       int epipes = (borderTotalLength / 6.096).round();
// //       extraPipes = currentBuilding!.backLegHeight >= 2.43 ? epipes : 0;
// //     }
// //     int langle_qty = legs * 2;
// //     int foundation_qty = legs * 2;
// //     int americanBolt_qty = langle_qty * 2;
// //     double kw = currentBuilding!.totalKw;
// //     int zink_qty = kw <= 3 ? 1 : kw <= 6 ? 2 : kw <= 9 ? 3 : kw <= 12 ? 4 : kw <= 15 ? 5 : kw <= 18 ? 6 : kw <= 21 ? 7 : kw <= 24 ? 8 : 9;
// //     int jBolt_qty = nofPanels * 4;
// //     int dcWire_qty = 25;
// //     int acWire_qty = 25;
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(
// //         f6040: qty6040_1,
// //         f4040: qty4040_1,
// //         totalKg: totalKg,
// //         lAngle_qty: langle_qty,
// //         americanBolt_qty: americanBolt_qty,
// //         zink_qty: zink_qty,
// //         jBolt_qty: jBolt_qty,
// //         foundation_qty: foundation_qty,
// //         dcWire_meter: dcWire_qty,
// //         acWire_meter: acWire_qty,
// //         extraPipes: extraPipes,
// //       );
// //     }
// //   }
// //
// //   void switchMode(int mode) {
// //     if (currentMode.value == mode) return;
// //     currentMode.value = mode;
// //     if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty && hasPanels.value) {
// //       calculateAndShowPanels();
// //     }
// //   }
// //
// //   void deleteBuilding(String buildingId) {
// //     buildings.removeWhere((b) => b.id == buildingId);
// //     if (selectedBuildingId.value == buildingId) {
// //       if (buildings.isNotEmpty) selectBuilding(buildings.first.id);
// //       else {
// //         selectedBuildingId.value = "";
// //         hasTerrace.value = false;
// //         hasPanels.value = false;
// //         isSaved.value = false;
// //         isEditingTerraceLayout.value = false;
// //         clearTerrace();
// //         editingTerraceIndex.value = -1;
// //       }
// //     }
// //   }
// //
// //   void selectBuilding(String buildingId) {
// //     if (selectedBuildingId.value == buildingId) return;
// //     selectedBuildingId.value = buildingId;
// //     if (currentBuilding != null) {
// //       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
// //       hasTerrace.value = currentBuilding!.terracePoints.isNotEmpty;
// //       hasPanels.value = currentBuilding!.panels.isNotEmpty;
// //       isSaved.value = currentBuilding!.isSaved;
// //       selectedPanelCount.value = currentBuilding!.selectedPanelCount;
// //       selectedRows.value = currentBuilding!.selectedRows;
// //       isHorizontal.value = currentBuilding!.isHorizontal;
// //       terraceType.value = currentBuilding!.terraceType;
// //       frontLegHeight.value = currentBuilding!.frontLegHeight;
// //       backLegHeight.value = currentBuilding!.backLegHeight;
// //       isMeterOrFeet.value = currentBuilding!.isMeterOrFeet;
// //       selectedProjectType.value = currentBuilding!.selectedProjectType;
// //       selectedTechnology.value = currentBuilding!.selectedTechnology;
// //       selectedPanelWatt.value = currentBuilding!.selectedPanelWatt;
// //       selectedKilowatt.value = currentBuilding!.selectedKilowatt;
// //       paddingValue.value = currentBuilding!.padding;
// //       rowSpacingValue.value = currentBuilding!.rowSpacing;
// //       if (currentBuilding!.panels.isNotEmpty) {
// //         solarPanelsPolygons.value = convertCentersToPolygons(currentBuilding!.panels, currentBuilding!.isHorizontal);
// //         dragHandlePosition.value = getPanelsCenter(currentBuilding!.panels);
// //       } else {
// //         solarPanelsPolygons.clear();
// //       }
// //       updatePolygon();
// //       editingTerraceIndex.value = hasTerrace.value ? 0 : -1;
// //     } else {
// //       clearTerrace();
// //       editingTerraceIndex.value = -1;
// //     }
// //   }
// //
// //   // Walkway methods (unchanged)
// //   void addWalkway() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //     final double widthMeters = double.parse(selectedWalkwayWidth.value) / 1000;
// //     final double lengthMeters = min(
// //       (bounds.northeast.longitude - bounds.southwest.longitude) * 111111 * cos(center.latitude * pi / 180),
// //       (bounds.northeast.latitude - bounds.southwest.latitude) * 111111,
// //     );
// //     currentWalkways.add(Walkway(
// //       id: DateTime.now().millisecondsSinceEpoch.toString(),
// //       name: 'Walkway ${currentWalkways.length + 1}',
// //       points: _createWalkwayPoints(center, isHorizontal.value, widthMeters, lengthMeters),
// //       isHorizontal: isHorizontal.value,
// //       width: widthMeters,
// //       length: lengthMeters,
// //       maxLength: lengthMeters,
// //     ));
// //     editingWalkwayIndex.value = currentWalkways.length - 1;
// //   }
// //
// //   List<LatLng> _createWalkwayPoints(LatLng center, bool isHoriz, double width, double length) {
// //     final latDelta = (isHoriz ? width : length) / 111111.0 / 2;
// //     final lngDelta = (isHoriz ? length : width) / (111111.0 * cos(center.latitude * pi / 180)) / 2;
// //     return [
// //       LatLng(center.latitude - latDelta, center.longitude - lngDelta),
// //       LatLng(center.latitude - latDelta, center.longitude + lngDelta),
// //       LatLng(center.latitude + latDelta, center.longitude + lngDelta),
// //       LatLng(center.latitude + latDelta, center.longitude - lngDelta),
// //     ];
// //   }
// //
// //   void updateWalkwayPoints(int index, List<LatLng> newPoints) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     final walkway = currentWalkways[index];
// //     final bounds = getPolygonBounds(newPoints);
// //     double newLength = walkway.isHorizontal
// //         ? (bounds.northeast.longitude - bounds.southwest.longitude) * 111111 * cos(bounds.southwest.latitude * pi / 180)
// //         : (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
// //     currentWalkways[index] = walkway.copyWith(points: newPoints, length: newLength);
// //   }
// //
// //   void updateWalkwayLength(int index, double newLength) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     final walkway = currentWalkways[index];
// //     if (currentBuilding == null) return;
// //     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
// //     double maxLen = walkway.isHorizontal
// //         ? (bounds.northeast.longitude - bounds.southwest.longitude) * 111111 * cos(bounds.southwest.latitude * pi / 180)
// //         : (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
// //     final clamped = newLength.clamp(1.0, maxLen);
// //     final center = getCenter(walkway.points);
// //     final newPoints = _createWalkwayPoints(center, walkway.isHorizontal, walkway.width, clamped);
// //     currentWalkways[index] = walkway.copyWith(length: clamped, points: newPoints, maxLength: maxLen);
// //   }
// //
// //   void removeWalkway(int index) {
// //     if (index >= 0 && index < currentWalkways.length) currentWalkways.removeAt(index);
// //     editingWalkwayIndex.value = -1;
// //   }
// //
// //   void toggleWalkwayOrientation(int index) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     final walkway = currentWalkways[index];
// //     final newOrientation = !walkway.isHorizontal;
// //     final center = getCenter(walkway.points);
// //     currentWalkways[index] = walkway.copyWith(
// //       isHorizontal: newOrientation,
// //       points: _createWalkwayPoints(center, newOrientation, walkway.width, walkway.length),
// //     );
// //   }
// //
// //   LatLng getCenter(List<LatLng> points) {
// //     double lat = 0, lng = 0;
// //     for (final p in points) { lat += p.latitude; lng += p.longitude; }
// //     return LatLng(lat / points.length, lng / points.length);
// //   }
// //
// //   void startDrawingHandRail() { isDrawingHandRail.value = true; isHandRailComplete.value = false; update(); }
// //   void toggleBorderSelection(int index) {}
// //   void finishDrawingHandRail() { isDrawingHandRail.value = false; isHandRailComplete.value = true; update(); }
// //   bool isPointNearBorder(LatLng tapPoint, LatLng lineStart, LatLng lineEnd) {
// //     const double threshold = 0.00005;
// //     if (lineStart == lineEnd) return false;
// //     final lineLength = calculateDistance(lineStart, lineEnd);
// //     final distance = ((lineEnd.latitude - lineStart.latitude) * (tapPoint.longitude - lineStart.longitude) -
// //         (lineEnd.longitude - lineStart.longitude) * (tapPoint.latitude - lineStart.latitude)).abs() / lineLength;
// //     return distance < threshold;
// //   }
// //   double calculateHandRailLength(List<LatLng> handRailPoints) {
// //     if (handRailPoints.isEmpty || handRailPoints.length % 2 != 0) return 0.0;
// //     double total = 0.0;
// //     for (int i = 0; i < handRailPoints.length; i += 2) {
// //       if (i + 1 < handRailPoints.length) total += calculateDistance(handRailPoints[i], handRailPoints[i + 1]);
// //     }
// //     return total;
// //   }
// //
// //   Future<void> updatePolygon({bool forceUpdate = false}) async {
// //     if (!forceUpdate && polygonPoints.length < 2) return;
// //     distanceMarkers.clear();
// //     final List<LatLng> cleanPoints = List<LatLng>.from(polygonPoints);
// //     if (cleanPoints.length >= 3 && cleanPoints.first == cleanPoints.last) cleanPoints.removeLast();
// //     for (int i = 0; i < cleanPoints.length; i++) {
// //       final nextIndex = (i + 1) % cleanPoints.length;
// //       final distance = calculateDistance(cleanPoints[i], cleanPoints[nextIndex]);
// //       final converted = showInMeters.value ? distance : distance * 3.28084;
// //       final textMarker = await createTextMarker('${converted.toStringAsFixed(1)}${showInMeters.value ? 'm' : 'ft'}');
// //       final midpoint = LatLng(
// //         (cleanPoints[i].latitude + cleanPoints[nextIndex].latitude) / 2,
// //         (cleanPoints[i].longitude + cleanPoints[nextIndex].longitude) / 2,
// //       );
// //       distanceMarkers.add(Marker(
// //         markerId: MarkerId('distance_$i'),
// //         position: midpoint,
// //         icon: textMarker,
// //         anchor: const Offset(0.5, 0.5),
// //       ));
// //     }
// //     if (cleanPoints.length >= 3) {
// //       final closed = List<LatLng>.from(cleanPoints)..add(cleanPoints[0]);
// //       polygonArea.value = calculatePolygonArea(closed);
// //     } else {
// //       polygonArea.value = 0.0;
// //     }
// //   }
// //
// //   double calculateDistance(LatLng start, LatLng end) {
// //     final lat1 = start.latitude * pi / 180;
// //     final lon1 = start.longitude * pi / 180;
// //     final lat2 = end.latitude * pi / 180;
// //     final lon2 = end.longitude * pi / 180;
// //     final dLat = lat2 - lat1;
// //     final dLon = lon2 - lon1;
// //     final a = sin(dLat / 2) * sin(dLat / 2) + cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
// //     final c = 2 * atan2(sqrt(a), sqrt(1 - a));
// //     return earthRadius * c;
// //   }
// //
// //   double calculatePolygonArea(List<LatLng> points) {
// //     if (points.length < 3) return 0.0;
// //     double area = 0.0;
// //     for (int i = 0; i < points.length; i++) {
// //       final p1 = points[i];
// //       final p2 = points[(i + 1) % points.length];
// //       area += toRadians(p2.longitude - p1.longitude) *
// //           (2 + sin(toRadians(p1.latitude)) + sin(toRadians(p2.latitude)));
// //     }
// //     return (area * 6378137 * 6378137 / 2).abs();
// //   }
// //
// //   double toRadians(double degree) => degree * pi / 180;
// //
// //   LatLngBounds getPolygonBounds(List<LatLng> points) {
// //     if (points.isEmpty) return LatLngBounds(southwest: const LatLng(0, 0), northeast: const LatLng(0, 0));
// //     double minLat = points[0].latitude, maxLat = points[0].latitude;
// //     double minLng = points[0].longitude, maxLng = points[0].longitude;
// //     for (final p in points) {
// //       minLat = min(minLat, p.latitude);
// //       maxLat = max(maxLat, p.latitude);
// //       minLng = min(minLng, p.longitude);
// //       maxLng = max(maxLng, p.longitude);
// //     }
// //     return LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng));
// //   }
// //
// //   void clearPolygon() {
// //     polygonPoints.clear();
// //     polygonArea.value = 0.0;
// //     distanceMarkers.clear();
// //     solarPanelsPolygons.clear();
// //     currentWalkways.clear();
// //   }
// //
// //   Future<BitmapDescriptor> createTextMarker(String text) async {
// //     final recorder = ui.PictureRecorder();
// //     final canvas = Canvas(recorder);
// //     final textPainter = TextPainter(
// //       text: TextSpan(text: text, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, backgroundColor: Colors.black54)),
// //       textDirection: TextDirection.ltr,
// //     );
// //     textPainter.layout();
// //     textPainter.paint(canvas, Offset.zero);
// //     final image = await recorder.endRecording().toImage(textPainter.width.ceil(), textPainter.height.ceil());
// //     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
// //     return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
// //   }
// //
// //   void toggleBuildingSelection(String buildingId) {
// //     if (selectedBuildingId.value == buildingId) selectedBuildingId.value = '';
// //     else selectBuilding(buildingId);
// //   }
// // }
//
//
//
// // import 'dart:async';
// // import 'dart:math';
// // import 'dart:ui' as ui;
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// //
// // class Walkway {
// //   String id;
// //   String name;
// //   List<LatLng> points;
// //   bool isHorizontal;
// //   double width;
// //   double length;
// //   double maxLength;
// //   double rotationAngle;
// //
// //   Walkway({
// //     required this.id,
// //     required this.points,
// //     this.isHorizontal = true,
// //     this.width = 0.5,
// //     this.length = 3.0,
// //     required this.maxLength,
// //     this.rotationAngle = 0,
// //     required this.name,
// //   });
// //
// //   Polygon toPolygon() => Polygon(
// //     polygonId: PolygonId(id),
// //     points: points,
// //     strokeWidth: 1,
// //     strokeColor: Colors.deepOrange,
// //     fillColor: Colors.deepOrange.withOpacity(0.5),
// //   );
// //
// //   Walkway copyWith({
// //     List<LatLng>? points,
// //     bool? isHorizontal,
// //     double? width,
// //     double? length,
// //     double? maxLength,
// //     String? name,
// //   }) {
// //     return Walkway(
// //       id: id,
// //       points: points ?? this.points,
// //       isHorizontal: isHorizontal ?? this.isHorizontal,
// //       width: width ?? this.width,
// //       length: length ?? this.length,
// //       maxLength: maxLength ?? this.maxLength,
// //       name: name ?? this.name,
// //     );
// //   }
// // }
// //
// // class Building {
// //   String id;
// //   String name;
// //   String customerName;
// //   String customerMobile;
// //   List<LatLng> terracePoints;
// //   List<LatLng> panels;
// //   List<Walkway> walkways;
// //   bool isHorizontal;
// //   bool isAlternate;
// //   double padding;
// //   double rowSpacing;
// //   int selectedPanelCount;
// //   int selectedRows;
// //   double totalKw;
// //   String terraceType;
// //   int frontLegHeight;
// //   int backLegHeight;
// //   String mountingStyle;
// //   double paneltotalWidth;
// //   double paneltotalHeight;
// //   int f6040;
// //   int f4040;
// //   int lAngle_qty;
// //   int americanBolt_qty;
// //   int zink_qty;
// //   int jBolt_qty;
// //   int foundation_qty;
// //   int dcWire_meter;
// //   int acWire_meter;
// //   int extraPipes;
// //   double totalKg;
// //   bool isMeterOrFeet;
// //   String inverterPosition;
// //   String structureType;
// //   bool isSaved;
// //   String selectedProjectType;
// //   String selectedTechnology;
// //   String selectedPanelWatt;
// //   String selectedKilowatt;
// //
// //   Building({
// //     required this.id,
// //     required this.name,
// //     this.customerName = "",
// //     this.customerMobile = "",
// //     this.terracePoints = const [],
// //     this.panels = const [],
// //     this.walkways = const [],
// //     this.isHorizontal = true,
// //     this.isAlternate = false,
// //     this.padding = 0,
// //     this.rowSpacing = 0,
// //     this.selectedPanelCount = 0,
// //     this.selectedRows = 1,
// //     this.totalKw = 0,
// //     this.terraceType = "Rcc Roof",
// //     this.frontLegHeight = 0,
// //     this.backLegHeight = 0,
// //     this.mountingStyle = "Legs On Terrace",
// //     this.paneltotalWidth = 0,
// //     this.paneltotalHeight = 0,
// //     this.f6040 = 0,
// //     this.f4040 = 0,
// //     this.lAngle_qty = 0,
// //     this.americanBolt_qty = 0,
// //     this.zink_qty = 0,
// //     this.jBolt_qty = 0,
// //     this.foundation_qty = 0,
// //     this.dcWire_meter = 0,
// //     this.acWire_meter = 0,
// //     this.extraPipes = 0,
// //     this.totalKg = 0,
// //     this.isMeterOrFeet = true,
// //     this.inverterPosition = "Ground Floor",
// //     this.structureType = "Hot dig Gi(Galvanised iron)",
// //     this.isSaved = false,
// //     this.selectedProjectType = "",
// //     this.selectedTechnology = "",
// //     this.selectedPanelWatt = "545",
// //     this.selectedKilowatt = "",
// //   });
// //
// //   Building copyWith({
// //     String? id,
// //     String? name,
// //     String? customerName,
// //     String? customerMobile,
// //     List<LatLng>? terracePoints,
// //     List<LatLng>? panels,
// //     List<Walkway>? walkways,
// //     bool? isHorizontal,
// //     bool? isAlternate,
// //     double? padding,
// //     double? rowSpacing,
// //     int? selectedPanelCount,
// //     int? selectedRows,
// //     double? totalKw,
// //     String? terraceType,
// //     int? frontLegHeight,
// //     int? backLegHeight,
// //     String? mountingStyle,
// //     double? paneltotalWidth,
// //     double? paneltotalHeight,
// //     int? f6040,
// //     int? f4040,
// //     int? lAngle_qty,
// //     int? americanBolt_qty,
// //     int? zink_qty,
// //     int? jBolt_qty,
// //     int? foundation_qty,
// //     int? dcWire_meter,
// //     int? acWire_meter,
// //     int? extraPipes,
// //     double? totalKg,
// //     bool? isMeterOrFeet,
// //     String? inverterPosition,
// //     String? structureType,
// //     bool? isSaved,
// //     String? selectedProjectType,
// //     String? selectedTechnology,
// //     String? selectedPanelWatt,
// //     String? selectedKilowatt,
// //   }) {
// //     return Building(
// //       id: id ?? this.id,
// //       name: name ?? this.name,
// //       customerName: customerName ?? this.customerName,
// //       customerMobile: customerMobile ?? this.customerMobile,
// //       terracePoints: terracePoints ?? this.terracePoints,
// //       panels: panels ?? this.panels,
// //       walkways: walkways ?? this.walkways,
// //       isHorizontal: isHorizontal ?? this.isHorizontal,
// //       isAlternate: isAlternate ?? this.isAlternate,
// //       padding: padding ?? this.padding,
// //       rowSpacing: rowSpacing ?? this.rowSpacing,
// //       selectedPanelCount: selectedPanelCount ?? this.selectedPanelCount,
// //       selectedRows: selectedRows ?? this.selectedRows,
// //       totalKw: totalKw ?? this.totalKw,
// //       terraceType: terraceType ?? this.terraceType,
// //       frontLegHeight: frontLegHeight ?? this.frontLegHeight,
// //       backLegHeight: backLegHeight ?? this.backLegHeight,
// //       mountingStyle: mountingStyle ?? this.mountingStyle,
// //       paneltotalWidth: paneltotalWidth ?? this.paneltotalWidth,
// //       paneltotalHeight: paneltotalHeight ?? this.paneltotalHeight,
// //       f6040: f6040 ?? this.f6040,
// //       f4040: f4040 ?? this.f4040,
// //       lAngle_qty: lAngle_qty ?? this.lAngle_qty,
// //       americanBolt_qty: americanBolt_qty ?? this.americanBolt_qty,
// //       zink_qty: zink_qty ?? this.zink_qty,
// //       jBolt_qty: jBolt_qty ?? this.jBolt_qty,
// //       foundation_qty: foundation_qty ?? this.foundation_qty,
// //       dcWire_meter: dcWire_meter ?? this.dcWire_meter,
// //       acWire_meter: acWire_meter ?? this.acWire_meter,
// //       extraPipes: extraPipes ?? this.extraPipes,
// //       totalKg: totalKg ?? this.totalKg,
// //       isMeterOrFeet: isMeterOrFeet ?? this.isMeterOrFeet,
// //       inverterPosition: inverterPosition ?? this.inverterPosition,
// //       structureType: structureType ?? this.structureType,
// //       isSaved: isSaved ?? this.isSaved,
// //       selectedProjectType: selectedProjectType ?? this.selectedProjectType,
// //       selectedTechnology: selectedTechnology ?? this.selectedTechnology,
// //       selectedPanelWatt: selectedPanelWatt ?? this.selectedPanelWatt,
// //       selectedKilowatt: selectedKilowatt ?? this.selectedKilowatt,
// //     );
// //   }
// // }
// //
// // class UnifiedSurveyController extends GetxController {
// //   // Reactive variables
// //   var polygonPoints = <LatLng>[].obs;
// //   var polygonArea = 0.0.obs;
// //   var distanceMarkers = <Marker>{}.obs;
// //   var isSelectingArea = false.obs;
// //   var isEditingTerrace = false.obs;
// //   var isEditingTerraceLayout = false.obs;
// //   var showStreetView = false.obs;
// //   var pickedLocation = LatLng(22.260076, 70.787970).obs;
// //   var showInMeters = true.obs;
// //   var boundaryIcon = BitmapDescriptor.defaultMarker.obs;
// //   var walkWayIcon = BitmapDescriptor.defaultMarker.obs;
// //   var panelDragIcon = BitmapDescriptor.defaultMarker.obs;
// //
// //   var currentMode = 1.obs;
// //   var isDrawingTerrace = false.obs;
// //   var hasTerrace = false.obs;
// //   var hasPanels = false.obs;
// //   var isSaved = false.obs;
// //   var isLoading = false.obs;
// //   var isDraggingPanels = false.obs;
// //   var editingTerraceIndex = (-1).obs;
// //
// //   // Panel edit controls
// //   var paddingValue = 0.0.obs;
// //   var rowSpacingValue = 0.0.obs;
// //   var availableRowsForEdit = <int>[].obs;
// //   var groupRowsForSpace = 1.obs; // for As Per Space
// //   var groupRowsForKW = 1.obs;    // for As Per KW
// //
// //   // Walkway edit state
// //   var isEditingWalkway = false.obs;
// //   var selectedWalkwayIndex = (-1).obs;
// //   var isAddingWalkway = false.obs;
// //
// //   var dragHandlePosition = LatLng(0, 0).obs;
// //   var originalPanelCenters = <LatLng>[].obs;
// //   LatLng? dragStartPoint;
// //
// //   var buildings = <Building>[].obs;
// //   var selectedBuildingId = "".obs;
// //
// //   Building? get currentBuilding {
// //     if (selectedBuildingId.isEmpty) return null;
// //     try {
// //       return buildings.firstWhere((b) => b.id == selectedBuildingId.value);
// //     } catch (e) {
// //       return null;
// //     }
// //   }
// //
// //   var selectedPanelCount = 0.obs;
// //   var selectedRows = 1.obs;
// //   var availableRows = <int>[].obs;
// //   var isHorizontal = true.obs;
// //   var terraceType = "Rcc Roof".obs;
// //   var frontLegHeight = 0.obs;
// //   var backLegHeight = 0.obs;
// //   var isMeterOrFeet = true.obs;
// //   var inverterPosition = "Ground Floor".obs;
// //   var structureType = "Hot dig Gi(Galvanised iron)".obs;
// //   var totalPanelWidth = 0.0.obs;
// //   var totalPanelHeight = 0.0.obs;
// //
// //   var selectedProjectType = "".obs;
// //   var selectedTechnology = "".obs;
// //   var selectedPanelWatt = "545".obs;
// //   var selectedKilowatt = "".obs;
// //
// //   final List<String> projectTypes = ["Residential", "Commercial", "Industrial"];
// //   final List<String> technologies = ["Bifacial", "Topcon", "Mono Perc"];
// //   final List<String> panelWatts = ["540", "545", "550", "555", "560", "565", "570", "575"];
// //   final List<String> kilowattOptions = ["2.27", "3.24", "4.20", "5.25", "6.30", "7.35", "8.40", "9.45", "10.50"];
// //   final List<String> terraceTypes = ["Rcc Roof", "Slant Roof", "Ground Mountain"];
// //   final List<String> structureTypes = ["Hot dig Gi(Galvanised iron)", "Aluminium", "GI Structure"];
// //   final List<String> inverterPositions = ["Ground Floor", "Sidi Room", "Terrace", "Roof Top"];
// //
// //   GoogleMapController? mapController;
// //   final double earthRadius = 6371000;
// //
// //   RxList<Walkway> currentWalkways = <Walkway>[].obs;
// //   RxInt editingWalkwayIndex = (-1).obs;
// //   RxString selectedWalkwayWidth = "270".obs;
// //   RxList<LatLng> currentHandRailPoints = <LatLng>[].obs;
// //   RxBool isDrawingHandRail = false.obs;
// //   RxBool isHandRailComplete = false.obs;
// //   final RxSet<Polygon> solarPanelsPolygons = <Polygon>{}.obs;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     loadIcons();
// //   }
// //
// //   Future<void> loadIcons() async {
// //     boundaryIcon.value = await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(size: Size(22, 22)),
// //       "assets/images/bcircle3.png",
// //     );
// //     walkWayIcon.value = await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(size: Size(10, 10)),
// //       "assets/images/wcircle.png",
// //     );
// //     panelDragIcon.value = await BitmapDescriptor.fromAssetImage(
// //       const ImageConfiguration(size: Size(22, 22)),
// //       "assets/images/panelDragHandle.png",
// //     );
// //   }
// //
// //   bool isPolygonValid(List<LatLng> points) {
// //     if (points.length < 3) return true;
// //     for (int i = 0; i < points.length; i++) {
// //       final p1 = points[i];
// //       final p2 = points[(i + 1) % points.length];
// //       for (int j = i + 2; j < points.length; j++) {
// //         final p3 = points[j];
// //         final p4 = points[(j + 1) % points.length];
// //         if (i == j || (i + 1) % points.length == j || (j + 1) % points.length == i) continue;
// //         if (_lineSegmentsIntersect(p1, p2, p3, p4)) return false;
// //       }
// //     }
// //     return true;
// //   }
// //
// //   bool _lineSegmentsIntersect(LatLng p1, LatLng p2, LatLng p3, LatLng p4) {
// //     double orientation(LatLng a, LatLng b, LatLng c) {
// //       double val = (b.latitude - a.latitude) * (c.longitude - b.longitude) -
// //           (b.longitude - a.longitude) * (c.latitude - b.latitude);
// //       if (val.abs() < 1e-10) return 0;
// //       return val.sign;
// //     }
// //     double o1 = orientation(p1, p2, p3);
// //     double o2 = orientation(p1, p2, p4);
// //     double o3 = orientation(p3, p4, p1);
// //     double o4 = orientation(p3, p4, p2);
// //     if (o1 != o2 && o3 != o4) return true;
// //     if (o1 == 0 && _onSegment(p1, p3, p2)) return true;
// //     if (o2 == 0 && _onSegment(p1, p4, p2)) return true;
// //     if (o3 == 0 && _onSegment(p3, p1, p4)) return true;
// //     if (o4 == 0 && _onSegment(p3, p2, p4)) return true;
// //     return false;
// //   }
// //
// //   bool _onSegment(LatLng p, LatLng q, LatLng r) {
// //     return q.latitude <= max(p.latitude, r.latitude) &&
// //         q.latitude >= min(p.latitude, r.latitude) &&
// //         q.longitude <= max(p.longitude, r.longitude) &&
// //         q.longitude >= min(p.longitude, r.longitude);
// //   }
// //
// //   void createNewBuilding(String name, String customerName, String customerMobile) {
// //     final newBuilding = Building(
// //       id: DateTime.now().millisecondsSinceEpoch.toString(),
// //       name: name,
// //       customerName: customerName,
// //       customerMobile: customerMobile,
// //     );
// //     buildings.add(newBuilding);
// //     selectedBuildingId.value = newBuilding.id;
// //     isSelectingArea.value = true;
// //     isDrawingTerrace.value = true;
// //     hasTerrace.value = false;
// //     hasPanels.value = false;
// //     isSaved.value = false;
// //     isEditingTerraceLayout.value = false;
// //     clearTerrace();
// //   }
// //
// //   void clearTerrace() {
// //     polygonPoints.clear();
// //     polygonArea.value = 0.0;
// //     distanceMarkers.clear();
// //     solarPanelsPolygons.clear();
// //     currentWalkways.clear();
// //     currentHandRailPoints.clear();
// //     isDrawingHandRail.value = false;
// //     isHandRailComplete.value = false;
// //   }
// //
// //   void addPolygonPoint(LatLng point) {
// //     if (isSelectingArea.value && isDrawingTerrace.value) {
// //       polygonPoints.add(point);
// //       updatePolygon();
// //     }
// //   }
// //
// //   void undoLastPoint() {
// //     if (polygonPoints.isNotEmpty) {
// //       polygonPoints.removeLast();
// //       updatePolygon();
// //     }
// //   }
// //
// //   void updatePolygonPoint(int index, LatLng newPosition) {
// //     if (index >= 0 && index < polygonPoints.length) {
// //       polygonPoints[index] = newPosition;
// //       updatePolygon(forceUpdate: true);
// //     }
// //   }
// //
// //   void removePolygonPoint(int index) {
// //     if (index >= 0 && index < polygonPoints.length) {
// //       polygonPoints.removeAt(index);
// //       updatePolygon();
// //     }
// //   }
// //
// //   void startEditingTerrace() {
// //     if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty) {
// //       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
// //       isSelectingArea.value = true;
// //       isEditingTerrace.value = true;
// //       isDrawingTerrace.value = false;
// //       editingTerraceIndex.value = 0;
// //       isEditingTerraceLayout.value = true;
// //       selectedRows.value = currentBuilding!.selectedRows;
// //       isHorizontal.value = currentBuilding!.isHorizontal;
// //       paddingValue.value = currentBuilding!.padding;
// //       rowSpacingValue.value = currentBuilding!.rowSpacing;
// //       groupRowsForKW.value = currentBuilding!.rowSpacing > 0 ? 1 : 1;
// //       updateAvailableRowsForEdit();
// //       if (currentWalkways.isNotEmpty) {
// //         selectedWalkwayIndex.value = 0;
// //         editingWalkwayIndex.value = 0;
// //         isEditingWalkway.value = true;
// //       } else {
// //         stopEditingWalkway();
// //       }
// //     }
// //   }
// //
// //   bool saveEditedTerrace() {
// //     if (polygonPoints.length < 3) return false;
// //     if (!isPolygonValid(polygonPoints)) return false;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           terracePoints: List<LatLng>.from(polygonPoints),
// //           isSaved: false,
// //         );
// //       }
// //     }
// //     isSelectingArea.value = false;
// //     isEditingTerrace.value = false;
// //     hasTerrace.value = true;
// //     editingTerraceIndex.value = -1;
// //     isEditingTerraceLayout.value = false;
// //     stopEditingWalkway();
// //     if (hasPanels.value) calculateAndShowPanels();
// //     return true;
// //   }
// //
// //   void cancelEditingTerrace() {
// //     if (currentBuilding != null) {
// //       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
// //     }
// //     isSelectingArea.value = false;
// //     isEditingTerrace.value = false;
// //     editingTerraceIndex.value = -1;
// //     isEditingTerraceLayout.value = false;
// //     stopEditingWalkway();
// //     updatePolygon();
// //   }
// //
// //   bool completeTerraceDrawing() {
// //     if (polygonPoints.length < 3) return false;
// //     if (!isPolygonValid(polygonPoints)) return false;
// //     isSelectingArea.value = false;
// //     isDrawingTerrace.value = false;
// //     hasTerrace.value = true;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           terracePoints: List<LatLng>.from(polygonPoints),
// //         );
// //       }
// //     }
// //     editingTerraceIndex.value = 0;
// //     return true;
// //   }
// //
// //   void saveStructureDetails({
// //     required String terraceTypeVal,
// //     required String structureTypeVal,
// //     required String inverterPositionVal,
// //     required bool isMeterOrFeetVal,
// //     required int frontLegHeightVal,
// //     required int backLegHeightVal,
// //   }) {
// //     terraceType.value = terraceTypeVal;
// //     structureType.value = structureTypeVal;
// //     inverterPosition.value = inverterPositionVal;
// //     isMeterOrFeet.value = isMeterOrFeetVal;
// //     frontLegHeight.value = frontLegHeightVal;
// //     backLegHeight.value = backLegHeightVal;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           terraceType: terraceTypeVal,
// //           structureType: structureTypeVal,
// //           inverterPosition: inverterPositionVal,
// //           isMeterOrFeet: isMeterOrFeetVal,
// //           frontLegHeight: frontLegHeightVal,
// //           backLegHeight: backLegHeightVal,
// //         );
// //       }
// //     }
// //   }
// //
// //   void savePanelConfiguration({
// //     required String projectType,
// //     required String technology,
// //     required String panelWatt,
// //     required String kilowatt,
// //     required int panelCount,
// //   }) {
// //     selectedProjectType.value = projectType;
// //     selectedTechnology.value = technology;
// //     selectedPanelWatt.value = panelWatt;
// //     selectedKilowatt.value = kilowatt;
// //     selectedPanelCount.value = panelCount;
// //     selectedRows.value = 1;
// //     isHorizontal.value = true;
// //     if (currentBuilding != null) {
// //       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //       if (index != -1) {
// //         buildings[index] = buildings[index].copyWith(
// //           selectedProjectType: projectType,
// //           selectedTechnology: technology,
// //           selectedPanelWatt: panelWatt,
// //           selectedKilowatt: kilowatt,
// //           selectedPanelCount: panelCount,
// //           selectedRows: 1,
// //           isHorizontal: true,
// //         );
// //       }
// //     }
// //     calculateAndShowPanels();
// //   }
// //
// //   void updateAvailableRows() {
// //     if (selectedPanelCount.value <= 0 || currentBuilding == null) {
// //       availableRows.value = [1];
// //       selectedRows.value = 1;
// //       return;
// //     }
// //     final feasibleRows = <int>[];
// //     for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
// //       if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
// //     }
// //     availableRows.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
// //     if (availableRows.isNotEmpty && !availableRows.contains(selectedRows.value)) {
// //       selectedRows.value = availableRows.first;
// //     }
// //   }
// //
// //   void updateAvailableRowsForEdit() {
// //     if (selectedPanelCount.value <= 0 || currentBuilding == null) {
// //       availableRowsForEdit.value = [1];
// //       selectedRows.value = 1;
// //       return;
// //     }
// //     final feasibleRows = <int>[];
// //     for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
// //       if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
// //     }
// //     availableRowsForEdit.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
// //     if (availableRowsForEdit.isNotEmpty && !availableRowsForEdit.contains(selectedRows.value)) {
// //       selectedRows.value = availableRowsForEdit.first;
// //     }
// //   }
// //
// //   bool isRowConfigurationFeasible(int rows) {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return false;
// //     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //     final columns = (selectedPanelCount.value / rows).ceil();
// //     const double panelWidth = 1.13, panelHeight = 2.27;
// //     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
// //     final double panelHeightDeg = panelHeight / 111111.0;
// //     double requiredWidth = isHorizontal.value ? columns * panelHeightDeg : columns * panelWidthDeg;
// //     double requiredHeight = isHorizontal.value ? rows * panelWidthDeg : rows * panelHeightDeg;
// //     double availableWidth = (bounds.northeast.longitude - bounds.southwest.longitude).abs();
// //     double availableHeight = (bounds.northeast.latitude - bounds.southwest.latitude).abs();
// //     return requiredWidth <= availableWidth && requiredHeight <= availableHeight;
// //   }
// //
// //   void calculateAndShowPanels() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     List<LatLng> centers;
// //     if (currentMode.value == 1) {
// //       centers = calculatePanelCentersWithRows(
// //         currentBuilding!.terracePoints,
// //         selectedPanelCount.value,
// //         selectedRows.value,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //         groupRowsForKW.value,
// //       );
// //     } else {
// //       centers = calculatePanelCentersFull(
// //         currentBuilding!.terracePoints,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //         groupRowsForSpace.value,
// //       );
// //     }
// //     totalPanelWidth.value = calculatePanelStructureWidth(centers, isHorizontal.value);
// //     totalPanelHeight.value = calculatePanelStructureHeight(centers, isHorizontal.value);
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(
// //         panels: centers,
// //         selectedPanelCount: selectedPanelCount.value,
// //         selectedRows: selectedRows.value,
// //         isHorizontal: isHorizontal.value,
// //         paneltotalWidth: totalPanelWidth.value,
// //         paneltotalHeight: totalPanelHeight.value,
// //         isSaved: false,
// //         padding: paddingValue.value,
// //         rowSpacing: rowSpacingValue.value,
// //       );
// //     }
// //     solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
// //     hasPanels.value = true;
// //     if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
// //     double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
// //     if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
// //   }
// //
// //   void updatePanelsFromEditCard() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     List<LatLng> centers;
// //     if (currentMode.value == 1) {
// //       centers = calculatePanelCentersWithRows(
// //         currentBuilding!.terracePoints,
// //         selectedPanelCount.value,
// //         selectedRows.value,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //         groupRowsForKW.value,
// //       );
// //     } else {
// //       centers = calculatePanelCentersFull(
// //         currentBuilding!.terracePoints,
// //         isHorizontal.value,
// //         paddingValue.value,
// //         rowSpacingValue.value,
// //         groupRowsForSpace.value,
// //       );
// //     }
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(
// //         panels: centers,
// //         isHorizontal: isHorizontal.value,
// //         selectedRows: selectedRows.value,
// //         padding: paddingValue.value,
// //         rowSpacing: rowSpacingValue.value,
// //       );
// //     }
// //     solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
// //     if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
// //     double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
// //     if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
// //   }
// //
// //   LatLng getPanelsCenter(List<LatLng> panels) {
// //     if (panels.isEmpty) return pickedLocation.value;
// //     double sumLat = 0, sumLng = 0;
// //     for (final panel in panels) {
// //       sumLat += panel.latitude;
// //       sumLng += panel.longitude;
// //     }
// //     return LatLng(sumLat / panels.length, sumLng / panels.length);
// //   }
// //
// //   void moveAllPanels(double latDelta, double lngDelta) {
// //     if (editingTerraceIndex.value == -1) return;
// //     if (currentBuilding == null) return;
// //     final terrace = currentBuilding!;
// //     final List<LatLng> newCenters = [];
// //     for (final panel in terrace.panels) {
// //       final newPos = LatLng(panel.latitude + latDelta, panel.longitude + lngDelta);
// //       if (!_isPointInPolygon(newPos, terrace.terracePoints)) return;
// //       newCenters.add(newPos);
// //     }
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(panels: newCenters, isSaved: false);
// //     }
// //     solarPanelsPolygons.value = convertCentersToPolygons(newCenters, isHorizontal.value);
// //     if (newCenters.isNotEmpty) dragHandlePosition.value = getPanelsCenter(newCenters);
// //   }
// //
// //   double calculatePanelStructureWidth(List<LatLng> panels, bool isHorizontal) {
// //     if (panels.isEmpty) return 0.0;
// //     final rows = <double, List<LatLng>>{};
// //     for (final panel in panels) {
// //       final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
// //       rows.putIfAbsent(rowKey, () => []).add(panel);
// //     }
// //     int maxPanelsInRow = 0;
// //     for (final row in rows.values) {
// //       if (row.length > maxPanelsInRow) maxPanelsInRow = row.length;
// //     }
// //     return isHorizontal ? maxPanelsInRow * 2.27 : maxPanelsInRow * 1.13;
// //   }
// //
// //   double calculatePanelStructureHeight(List<LatLng> panels, bool isHorizontal) {
// //     if (panels.isEmpty) return 0.0;
// //     final rows = <double, List<LatLng>>{};
// //     for (final panel in panels) {
// //       final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
// //       rows.putIfAbsent(rowKey, () => []).add(panel);
// //     }
// //     return isHorizontal ? rows.length * 1.13 : rows.length * 2.27;
// //   }
// //
// //   // ========== PANEL CALCULATION METHODS (FIXED) ==========
// //
// //   List<LatLng> calculatePanelCentersWithRows(
// //       List<LatLng> polygonPoints,
// //       int panelCount,
// //       int rows,
// //       bool isHorizontal,
// //       double padding,
// //       double rowSpacing,
// //       int groupRows,
// //       ) {
// //     if (polygonPoints.length < 3 || panelCount <= 0 || rows <= 0) return [];
// //
// //     final bounds = getPolygonBounds(polygonPoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //
// //     final double paddingLat = padding / 111111.0;
// //     final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
// //     final double paddedSouth = bounds.southwest.latitude + paddingLat;
// //     final double paddedNorth = bounds.northeast.latitude - paddingLat;
// //     final double paddedWest = bounds.southwest.longitude + paddingLng;
// //     final double paddedEast = bounds.northeast.longitude - paddingLng;
// //
// //     if (paddedSouth >= paddedNorth || paddedWest >= paddedEast) return [];
// //
// //     final columns = (panelCount / rows).ceil();
// //     const double panelWidth = 1.13, panelHeight = 2.27;
// //     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
// //     final double panelHeightDeg = panelHeight / 111111.0;
// //
// //     double lngStep, latStep;
// //     if (isHorizontal) {
// //       lngStep = panelHeightDeg;
// //       latStep = panelWidthDeg;
// //     } else {
// //       lngStep = panelWidthDeg;
// //       latStep = panelHeightDeg;
// //     }
// //
// //     final double rowSpacingDeg = rowSpacing / 111111.0;
// //
// //     // Row tops without spacing
// //     double fullGridHeight = rows * latStep;
// //     double startY = paddedNorth - fullGridHeight;
// //     List<double> rowTops = List.generate(rows, (i) => startY + i * latStep);
// //
// //     // Apply grouping offsets
// //     List<double> offsets = List.filled(rows, 0.0);
// //     for (int i = 0; i < rows; i++) {
// //       int groupsBefore = (i / groupRows).floor();
// //       offsets[i] = groupsBefore * rowSpacingDeg;
// //     }
// //     for (int i = 0; i < rows; i++) {
// //       rowTops[i] += offsets[i];
// //     }
// //
// //     // Center the block vertically
// //     double blockTop = rowTops.first;
// //     double blockBottom = rowTops.last + latStep;
// //     double blockHeight = blockBottom - blockTop;
// //     double availableHeight = paddedNorth - paddedSouth;
// //     double deltaY = paddedSouth + (availableHeight - blockHeight) / 2 - blockTop;
// //     for (int i = 0; i < rows; i++) {
// //       rowTops[i] += deltaY;
// //     }
// //
// //     // Generate panel centers, skipping those inside any walkway
// //     List<LatLng> centers = [];
// //     double rowStartLng = paddedWest + (paddedEast - paddedWest - (columns * lngStep)) / 2;
// //     int panelsPlaced = 0;
// //
// //     for (int row = 0; row < rows; row++) {
// //       int panelsInRow = (row == rows - 1) ? panelCount - (rows - 1) * columns : columns;
// //       for (int col = 0; col < panelsInRow; col++) {
// //         double centerLng = rowStartLng + col * lngStep + lngStep / 2;
// //         double centerLat = rowTops[row] + latStep / 2;
// //         LatLng panelCenter = LatLng(centerLat, centerLng);
// //
// //         // Skip if outside terrace polygon
// //         if (!_isPointInPolygon(panelCenter, polygonPoints)) continue;
// //
// //         // Skip if inside any walkway
// //         bool insideWalkway = false;
// //         for (final walkway in currentWalkways) {
// //           if (_isPointInPolygon(panelCenter, walkway.points)) {
// //             insideWalkway = true;
// //             break;
// //           }
// //         }
// //         if (insideWalkway) continue;
// //
// //         centers.add(panelCenter);
// //         panelsPlaced++;
// //       }
// //     }
// //     return centers;
// //   }
// //
// //   List<LatLng> calculatePanelCentersFull(
// //       List<LatLng> polygonPoints,
// //       bool isHorizontal,
// //       double padding,
// //       double rowSpacing,
// //       int groupRows,
// //       ) {
// //     if (polygonPoints.length < 3) return [];
// //
// //     final bounds = getPolygonBounds(polygonPoints);
// //     final center = LatLng(
// //       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
// //       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
// //     );
// //
// //     final double paddingLat = padding / 111111.0;
// //     final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
// //     final double startLat = bounds.southwest.latitude + paddingLat;
// //     final double endLat = bounds.northeast.latitude - paddingLat;
// //     final double startLng = bounds.southwest.longitude + paddingLng;
// //     final double endLng = bounds.northeast.longitude - paddingLng;
// //
// //     if (startLat >= endLat || startLng >= endLng) return [];
// //
// //     const double panelWidth = 1.13, panelHeight = 2.27;
// //     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
// //     final double panelHeightDeg = panelHeight / 111111.0;
// //
// //     int cols, totalRows;
// //     if (isHorizontal) {
// //       cols = ((endLng - startLng) / panelHeightDeg).floor();
// //       totalRows = ((endLat - startLat) / panelWidthDeg).floor();
// //     } else {
// //       cols = ((endLng - startLng) / panelWidthDeg).floor();
// //       totalRows = ((endLat - startLat) / panelHeightDeg).floor();
// //     }
// //
// //     if (cols <= 0 || totalRows <= 0) return [];
// //
// //     final double stepLng = isHorizontal ? panelHeightDeg : panelWidthDeg;
// //     final double stepLat = isHorizontal ? panelWidthDeg : panelHeightDeg;
// //     final double rowSpacingDeg = rowSpacing / 111111.0;
// //
// //     // Row tops without spacing
// //     double fullGridHeight = totalRows * stepLat;
// //     double startY = endLat - fullGridHeight;
// //     List<double> rowTops = List.generate(totalRows, (i) => startY + i * stepLat);
// //
// //     // Apply grouping offsets
// //     List<double> offsets = List.filled(totalRows, 0.0);
// //     for (int i = 0; i < totalRows; i++) {
// //       int groupsBefore = (i / groupRows).floor();
// //       offsets[i] = groupsBefore * rowSpacingDeg;
// //     }
// //     for (int i = 0; i < totalRows; i++) {
// //       rowTops[i] += offsets[i];
// //     }
// //
// //     // Center the block vertically
// //     double blockTop = rowTops.first;
// //     double blockBottom = rowTops.last + stepLat;
// //     double blockHeight = blockBottom - blockTop;
// //     double availableHeight = endLat - startLat;
// //     double deltaY = startLat + (availableHeight - blockHeight) / 2 - blockTop;
// //     for (int i = 0; i < totalRows; i++) {
// //       rowTops[i] += deltaY;
// //     }
// //
// //     // Generate panel centers, skipping those inside any walkway
// //     List<LatLng> centers = [];
// //     double rowStartLng = startLng + (endLng - startLng - (cols * stepLng)) / 2;
// //
// //     for (int row = 0; row < totalRows; row++) {
// //       for (int col = 0; col < cols; col++) {
// //         double centerLng = rowStartLng + col * stepLng + stepLng / 2;
// //         double centerLat = rowTops[row] + stepLat / 2;
// //         LatLng panelCenter = LatLng(centerLat, centerLng);
// //
// //         if (!_isPointInPolygon(panelCenter, polygonPoints)) continue;
// //
// //         bool insideWalkway = false;
// //         for (final walkway in currentWalkways) {
// //           if (_isPointInPolygon(panelCenter, walkway.points)) {
// //             insideWalkway = true;
// //             break;
// //           }
// //         }
// //         if (insideWalkway) continue;
// //
// //         centers.add(panelCenter);
// //       }
// //     }
// //     return centers;
// //   }
// //
// //   bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
// //     bool inside = false;
// //     for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
// //       final xi = polygon[i].latitude, yi = polygon[i].longitude;
// //       final xj = polygon[j].latitude, yj = polygon[j].longitude;
// //       final intersect = ((yi > point.longitude) != (yj > point.longitude)) &&
// //           (point.latitude < (xj - xi) * (point.longitude - yi) / (yj - yi) + xi);
// //       if (intersect) inside = !inside;
// //     }
// //     return inside;
// //   }
// //
// //   Set<Polygon> convertCentersToPolygons(List<LatLng> centers, bool isHorizontal) {
// //     return centers.map((center) => _createPanelPolygon(center, isHorizontal)).toSet();
// //   }
// //
// //   Polygon _createPanelPolygon(LatLng center, bool isHorizontal, {int rowIndex = 0}) {
// //     final panelWidth = isHorizontal ? 2.27 : 1.13;
// //     final panelHeight = isHorizontal ? 1.13 : 2.27;
// //     final latDelta = panelHeight / 111111.0 / 2;
// //     final lngDelta = panelWidth / (111111.0 * cos(center.latitude * pi / 180)) / 2;
// //     return Polygon(
// //       polygonId: PolygonId('panel_${center.latitude}_${center.longitude}_$rowIndex'),
// //       points: [
// //         LatLng(center.latitude - latDelta, center.longitude - lngDelta),
// //         LatLng(center.latitude - latDelta, center.longitude + lngDelta),
// //         LatLng(center.latitude + latDelta, center.longitude + lngDelta),
// //         LatLng(center.latitude + latDelta, center.longitude - lngDelta),
// //       ],
// //       strokeWidth: 1,
// //       strokeColor: Colors.white,
// //       fillColor: Colors.blue.withOpacity(0.8),
// //     );
// //   }
// //
// //   void saveTerrace() {
// //     if (currentBuilding == null) return;
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) buildings[index] = buildings[index].copyWith(isSaved: true);
// //     isSaved.value = true;
// //     isEditingTerraceLayout.value = false;
// //     stopEditingWalkway();
// //   }
// //
// //   void calculateBOM() {
// //     if (currentBuilding == null) return;
// //     double paneltotal_width = currentBuilding!.paneltotalWidth;
// //     double paneltotal_Height = currentBuilding!.paneltotalHeight;
// //     int nof_Rows = currentBuilding!.selectedRows;
// //     bool isMeterOrFeet = currentBuilding!.isMeterOrFeet;
// //     int nofPanels = currentBuilding!.panels.length;
// //     int nof_FrontLeg = (paneltotal_width / 1.5).round();
// //     int nof_BackLeg = (paneltotal_Height / 3.048).round();
// //     if (paneltotal_Height > 3.048) nof_BackLeg += 1;
// //     int legs;
// //     if (isMeterOrFeet) {
// //       double frontLegHeight = currentBuilding!.frontLegHeight / 3.281;
// //       double backLegHeight = currentBuilding!.backLegHeight / 3.281;
// //       legs = nof_FrontLeg * (frontLegHeight + backLegHeight).floor();
// //     } else {
// //       legs = nof_FrontLeg * (currentBuilding!.frontLegHeight + currentBuilding!.backLegHeight).toInt();
// //     }
// //     var rafter = nof_FrontLeg * nof_Rows;
// //     var perlin = nof_Rows * paneltotal_width * 2;
// //     double f6040 = (legs + rafter) * 0.8;
// //     int f6040_2 = f6040.floor();
// //     int f4040 = (perlin * 0.8).floor();
// //     var totalKg = (f6040_2 + f4040) * 3.28;
// //     double qty6040 = ((legs + rafter) * 3.28) / 20;
// //     int qty6040_1 = qty6040.floor();
// //     var qty4040 = (perlin * 3.28) / 20;
// //     int qty4040_1 = qty4040.floor();
// //     double borderTotalLength = 2 * (paneltotal_width + paneltotal_Height);
// //     int extraPipes = 0;
// //     if (isMeterOrFeet) {
// //       int epipes = (borderTotalLength / 6.096).round();
// //       extraPipes = currentBuilding!.backLegHeight >= 8 ? epipes : 0;
// //     } else {
// //       int epipes = (borderTotalLength / 6.096).round();
// //       extraPipes = currentBuilding!.backLegHeight >= 2.43 ? epipes : 0;
// //     }
// //     int langle_qty = legs * 2;
// //     int foundation_qty = legs * 2;
// //     int americanBolt_qty = langle_qty * 2;
// //     double kw = currentBuilding!.totalKw;
// //     int zink_qty = kw <= 3 ? 1 : kw <= 6 ? 2 : kw <= 9 ? 3 : kw <= 12 ? 4 : kw <= 15 ? 5 : kw <= 18 ? 6 : kw <= 21 ? 7 : kw <= 24 ? 8 : 9;
// //     int jBolt_qty = nofPanels * 4;
// //     int dcWire_qty = 25;
// //     int acWire_qty = 25;
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(
// //         f6040: qty6040_1,
// //         f4040: qty4040_1,
// //         totalKg: totalKg,
// //         lAngle_qty: langle_qty,
// //         americanBolt_qty: americanBolt_qty,
// //         zink_qty: zink_qty,
// //         jBolt_qty: jBolt_qty,
// //         foundation_qty: foundation_qty,
// //         dcWire_meter: dcWire_qty,
// //         acWire_meter: acWire_qty,
// //         extraPipes: extraPipes,
// //       );
// //     }
// //   }
// //
// //   void switchMode(int mode) {
// //     if (currentMode.value == mode) return;
// //     currentMode.value = mode;
// //     if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty && hasPanels.value) {
// //       calculateAndShowPanels();
// //     }
// //   }
// //
// //   void deleteBuilding(String buildingId) {
// //     buildings.removeWhere((b) => b.id == buildingId);
// //     if (selectedBuildingId.value == buildingId) {
// //       if (buildings.isNotEmpty) selectBuilding(buildings.first.id);
// //       else {
// //         selectedBuildingId.value = "";
// //         hasTerrace.value = false;
// //         hasPanels.value = false;
// //         isSaved.value = false;
// //         isEditingTerraceLayout.value = false;
// //         clearTerrace();
// //         editingTerraceIndex.value = -1;
// //       }
// //     }
// //   }
// //
// //   void selectBuilding(String buildingId) {
// //     if (selectedBuildingId.value == buildingId) return;
// //     selectedBuildingId.value = buildingId;
// //     if (currentBuilding != null) {
// //       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
// //       hasTerrace.value = currentBuilding!.terracePoints.isNotEmpty;
// //       hasPanels.value = currentBuilding!.panels.isNotEmpty;
// //       isSaved.value = currentBuilding!.isSaved;
// //       selectedPanelCount.value = currentBuilding!.selectedPanelCount;
// //       selectedRows.value = currentBuilding!.selectedRows;
// //       isHorizontal.value = currentBuilding!.isHorizontal;
// //       terraceType.value = currentBuilding!.terraceType;
// //       frontLegHeight.value = currentBuilding!.frontLegHeight;
// //       backLegHeight.value = currentBuilding!.backLegHeight;
// //       isMeterOrFeet.value = currentBuilding!.isMeterOrFeet;
// //       selectedProjectType.value = currentBuilding!.selectedProjectType;
// //       selectedTechnology.value = currentBuilding!.selectedTechnology;
// //       selectedPanelWatt.value = currentBuilding!.selectedPanelWatt;
// //       selectedKilowatt.value = currentBuilding!.selectedKilowatt;
// //       paddingValue.value = currentBuilding!.padding;
// //       rowSpacingValue.value = currentBuilding!.rowSpacing;
// //       groupRowsForKW.value = currentBuilding!.rowSpacing > 0 ? 1 : 1;
// //       currentWalkways.value = List<Walkway>.from(currentBuilding!.walkways);
// //       if (currentBuilding!.panels.isNotEmpty) {
// //         solarPanelsPolygons.value = convertCentersToPolygons(currentBuilding!.panels, currentBuilding!.isHorizontal);
// //         dragHandlePosition.value = getPanelsCenter(currentBuilding!.panels);
// //       } else {
// //         solarPanelsPolygons.clear();
// //       }
// //       updatePolygon();
// //       editingTerraceIndex.value = hasTerrace.value ? 0 : -1;
// //     } else {
// //       clearTerrace();
// //       editingTerraceIndex.value = -1;
// //     }
// //   }
// //
// //   void startAddingWalkway() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     if (!isEditingTerraceLayout.value) {
// //       startEditingTerrace();
// //     }
// //     isAddingWalkway.value = true;
// //     isEditingWalkway.value = true;
// //     addWalkway();
// //     if (currentWalkways.isNotEmpty) {
// //       selectedWalkwayIndex.value = currentWalkways.length - 1;
// //       editingWalkwayIndex.value = selectedWalkwayIndex.value;
// //     }
// //   }
// //
// //   void addWalkway() {
// //     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
// //     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
// //     final double widthMeters = double.parse(selectedWalkwayWidth.value) / 1000;
// //     final double centerLat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
// //     final double halfHeightDeg = widthMeters / 111111.0 / 2;
// //     final double topLat = centerLat + halfHeightDeg;
// //     final double bottomLat = centerLat - halfHeightDeg;
// //     final double lengthMeters = (bounds.northeast.longitude - bounds.southwest.longitude) *
// //         111111 *
// //         cos(centerLat * pi / 180);
// //     final List<LatLng> points = [
// //       LatLng(bottomLat, bounds.southwest.longitude),
// //       LatLng(bottomLat, bounds.northeast.longitude),
// //       LatLng(topLat, bounds.northeast.longitude),
// //       LatLng(topLat, bounds.southwest.longitude),
// //     ];
// //     currentWalkways.add(Walkway(
// //       id: DateTime.now().millisecondsSinceEpoch.toString(),
// //       name: 'Walkway ${currentWalkways.length + 1}',
// //       points: points,
// //       isHorizontal: true,
// //       width: widthMeters,
// //       length: lengthMeters,
// //       maxLength: lengthMeters,
// //     ));
// //     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (index != -1) {
// //       buildings[index] = buildings[index].copyWith(walkways: List<Walkway>.from(currentWalkways));
// //     }
// //     if (hasPanels.value) calculateAndShowPanels();
// //   }
// //
// //   void startEditingWalkway(int index) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     if (!isEditingTerraceLayout.value) {
// //       startEditingTerrace();
// //     }
// //     selectedWalkwayIndex.value = index;
// //     editingWalkwayIndex.value = index;
// //     isEditingWalkway.value = true;
// //   }
// //
// //   void stopEditingWalkway() {
// //     isEditingWalkway.value = false;
// //     selectedWalkwayIndex.value = -1;
// //     editingWalkwayIndex.value = -1;
// //     isAddingWalkway.value = false;
// //   }
// //
// //   void updateWalkwayPoints(int index, List<LatLng> newPoints) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     final walkway = currentWalkways[index];
// //     final bounds = getPolygonBounds(newPoints);
// //     double newLength;
// //     if (walkway.isHorizontal) {
// //       newLength = (bounds.northeast.longitude - bounds.southwest.longitude) *
// //           111111 *
// //           cos(bounds.southwest.latitude * pi / 180);
// //     } else {
// //       newLength = (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
// //     }
// //     final updatedWalkway = walkway.copyWith(points: newPoints, length: newLength);
// //     currentWalkways[index] = updatedWalkway;
// //     final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (buildingIndex != -1) {
// //       buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
// //     }
// //     if (hasPanels.value) calculateAndShowPanels();
// //     update();
// //   }
// //
// //   void toggleWalkwayOrientation(int index) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     final walkway = currentWalkways[index];
// //     final newOrientation = !walkway.isHorizontal;
// //     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
// //     final double widthMeters = walkway.width;
// //     List<LatLng> newPoints;
// //     if (newOrientation) {
// //       final double centerLat = getCenter(walkway.points).latitude;
// //       final double halfHeightDeg = widthMeters / 111111.0 / 2;
// //       final double topLat = centerLat + halfHeightDeg;
// //       final double bottomLat = centerLat - halfHeightDeg;
// //       final double lengthMeters = (bounds.northeast.longitude - bounds.southwest.longitude) *
// //           111111 *
// //           cos(centerLat * pi / 180);
// //       newPoints = [
// //         LatLng(bottomLat, bounds.southwest.longitude),
// //         LatLng(bottomLat, bounds.northeast.longitude),
// //         LatLng(topLat, bounds.northeast.longitude),
// //         LatLng(topLat, bounds.southwest.longitude),
// //       ];
// //       final updatedWalkway = walkway.copyWith(
// //         isHorizontal: true,
// //         points: newPoints,
// //         length: lengthMeters,
// //         maxLength: lengthMeters,
// //       );
// //       currentWalkways[index] = updatedWalkway;
// //     } else {
// //       final double centerLng = getCenter(walkway.points).longitude;
// //       final double halfWidthDeg = widthMeters / (111111.0 * cos(centerLng * pi / 180)) / 2;
// //       final double leftLng = centerLng - halfWidthDeg;
// //       final double rightLng = centerLng + halfWidthDeg;
// //       final double lengthMeters = (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
// //       newPoints = [
// //         LatLng(bounds.southwest.latitude, leftLng),
// //         LatLng(bounds.southwest.latitude, rightLng),
// //         LatLng(bounds.northeast.latitude, rightLng),
// //         LatLng(bounds.northeast.latitude, leftLng),
// //       ];
// //       final updatedWalkway = walkway.copyWith(
// //         isHorizontal: false,
// //         points: newPoints,
// //         length: lengthMeters,
// //         maxLength: lengthMeters,
// //       );
// //       currentWalkways[index] = updatedWalkway;
// //     }
// //     final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (buildingIndex != -1) {
// //       buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
// //     }
// //     if (hasPanels.value) calculateAndShowPanels();
// //     update();
// //   }
// //
// //   void removeWalkway(int index) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     currentWalkways.removeAt(index);
// //     final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
// //     if (buildingIndex != -1) {
// //       buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
// //     }
// //     if (currentWalkways.isEmpty) stopEditingWalkway();
// //     else if (selectedWalkwayIndex.value >= currentWalkways.length) {
// //       selectedWalkwayIndex.value = currentWalkways.length - 1;
// //       editingWalkwayIndex.value = selectedWalkwayIndex.value;
// //     }
// //     if (hasPanels.value) calculateAndShowPanels();
// //     update();
// //   }
// //
// //   LatLng getCenter(List<LatLng> points) {
// //     double lat = 0, lng = 0;
// //     for (final p in points) {
// //       lat += p.latitude;
// //       lng += p.longitude;
// //     }
// //     return LatLng(lat / points.length, lng / points.length);
// //   }
// //
// //   LatLng getWalkwayEndPoint(Walkway walkway) {
// //     if (walkway.points.isEmpty) return const LatLng(0, 0);
// //     if (walkway.isHorizontal) {
// //       final p1 = walkway.points[1];
// //       final p2 = walkway.points[2];
// //       return LatLng((p1.latitude + p2.latitude) / 2, (p1.longitude + p2.longitude) / 2);
// //     } else {
// //       final p1 = walkway.points[0];
// //       final p2 = walkway.points[1];
// //       return LatLng((p1.latitude + p2.latitude) / 2, (p1.longitude + p2.longitude) / 2);
// //     }
// //   }
// //
// //   void dragWalkway(int index, LatLng newPosition) {
// //     if (index < 0 || index >= currentWalkways.length) return;
// //     final walkway = currentWalkways[index];
// //     final endPoint = getWalkwayEndPoint(walkway);
// //     final translation = LatLng(
// //       newPosition.latitude - endPoint.latitude,
// //       newPosition.longitude - endPoint.longitude,
// //     );
// //     final newPoints = walkway.points
// //         .map((p) => LatLng(p.latitude + translation.latitude, p.longitude + translation.longitude))
// //         .toList();
// //     updateWalkwayPoints(index, newPoints);
// //   }
// //
// //   Future<void> updatePolygon({bool forceUpdate = false}) async {
// //     if (!forceUpdate && polygonPoints.length < 2) return;
// //     distanceMarkers.clear();
// //     final List<LatLng> cleanPoints = List<LatLng>.from(polygonPoints);
// //     if (cleanPoints.length >= 3 && cleanPoints.first == cleanPoints.last) cleanPoints.removeLast();
// //     for (int i = 0; i < cleanPoints.length; i++) {
// //       final nextIndex = (i + 1) % cleanPoints.length;
// //       final distance = calculateDistance(cleanPoints[i], cleanPoints[nextIndex]);
// //       final converted = showInMeters.value ? distance : distance * 3.28084;
// //       final textMarker = await createTextMarker('${converted.toStringAsFixed(1)}${showInMeters.value ? 'm' : 'ft'}');
// //       final midpoint = LatLng(
// //         (cleanPoints[i].latitude + cleanPoints[nextIndex].latitude) / 2,
// //         (cleanPoints[i].longitude + cleanPoints[nextIndex].longitude) / 2,
// //       );
// //       distanceMarkers.add(Marker(
// //         markerId: MarkerId('distance_$i'),
// //         position: midpoint,
// //         icon: textMarker,
// //         anchor: const Offset(0.5, 0.5),
// //       ));
// //     }
// //     if (cleanPoints.length >= 3) {
// //       final closed = List<LatLng>.from(cleanPoints)..add(cleanPoints[0]);
// //       polygonArea.value = calculatePolygonArea(closed);
// //     } else {
// //       polygonArea.value = 0.0;
// //     }
// //   }
// //
// //   double calculateDistance(LatLng start, LatLng end) {
// //     final lat1 = start.latitude * pi / 180;
// //     final lon1 = start.longitude * pi / 180;
// //     final lat2 = end.latitude * pi / 180;
// //     final lon2 = end.longitude * pi / 180;
// //     final dLat = lat2 - lat1;
// //     final dLon = lon2 - lon1;
// //     final a = sin(dLat / 2) * sin(dLat / 2) +
// //         cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
// //     final c = 2 * atan2(sqrt(a), sqrt(1 - a));
// //     return earthRadius * c;
// //   }
// //
// //   double calculatePolygonArea(List<LatLng> points) {
// //     if (points.length < 3) return 0.0;
// //     double area = 0.0;
// //     for (int i = 0; i < points.length; i++) {
// //       final p1 = points[i];
// //       final p2 = points[(i + 1) % points.length];
// //       area += toRadians(p2.longitude - p1.longitude) *
// //           (2 + sin(toRadians(p1.latitude)) + sin(toRadians(p2.latitude)));
// //     }
// //     return (area * 6378137 * 6378137 / 2).abs();
// //   }
// //
// //   double toRadians(double degree) => degree * pi / 180;
// //
// //   LatLngBounds getPolygonBounds(List<LatLng> points) {
// //     if (points.isEmpty) return LatLngBounds(southwest: const LatLng(0, 0), northeast: const LatLng(0, 0));
// //     double minLat = points[0].latitude, maxLat = points[0].latitude;
// //     double minLng = points[0].longitude, maxLng = points[0].longitude;
// //     for (final p in points) {
// //       minLat = min(minLat, p.latitude);
// //       maxLat = max(maxLat, p.latitude);
// //       minLng = min(minLng, p.longitude);
// //       maxLng = max(maxLng, p.longitude);
// //     }
// //     return LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng));
// //   }
// //
// //
// //   // clear the value
// //   void clearPolygon() {
// //     polygonPoints.clear();
// //     polygonArea.value = 0.0;
// //     distanceMarkers.clear();
// //     solarPanelsPolygons.clear();
// //     currentWalkways.clear();
// //   }
// //
// //   Future<BitmapDescriptor> createTextMarker(String text) async {
// //     final recorder = ui.PictureRecorder();
// //     final canvas = Canvas(recorder);
// //     final textPainter = TextPainter(
// //       text: TextSpan(
// //         text: text,
// //         style: const TextStyle(
// //           color: Colors.white,
// //           fontSize: 20,
// //           fontWeight: FontWeight.bold,
// //           backgroundColor: Colors.black54,
// //         ),
// //       ),
// //       textDirection: TextDirection.ltr,
// //     );
// //     textPainter.layout();
// //     textPainter.paint(canvas, Offset.zero);
// //     final image = await recorder.endRecording()
// //         .toImage(textPainter.width.ceil(), textPainter.height.ceil());
// //     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
// //     return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
// //   }
// //
// //   void toggleBuildingSelection(String buildingId) {
// //     if (selectedBuildingId.value == buildingId) selectedBuildingId.value = '';
// //     else selectBuilding(buildingId);
// //   }
// //
// //   void startDrawingHandRail() {
// //     isDrawingHandRail.value = true;
// //     isHandRailComplete.value = false;
// //     update();
// //   }
// //
// //   void toggleBorderSelection(int index) {}
// //
// //   void finishDrawingHandRail() {
// //     isDrawingHandRail.value = false;
// //     isHandRailComplete.value = true;
// //     update();
// //   }
// //
// //   bool isPointNearBorder(LatLng tapPoint, LatLng lineStart, LatLng lineEnd) {
// //     const double threshold = 0.00005;
// //     if (lineStart == lineEnd) return false;
// //     final lineLength = calculateDistance(lineStart, lineEnd);
// //     final distance = ((lineEnd.latitude - lineStart.latitude) *
// //         (tapPoint.longitude - lineStart.longitude) -
// //         (lineEnd.longitude - lineStart.longitude) *
// //             (tapPoint.latitude - lineStart.latitude))
// //         .abs() /
// //         lineLength;
// //     return distance < threshold;
// //   }
// //
// //
// //
// //   double calculateHandRailLength(List<LatLng> handRailPoints) {
// //     if (handRailPoints.isEmpty || handRailPoints.length % 2 != 0) return 0.0;
// //     double total = 0.0;
// //     for (int i = 0; i < handRailPoints.length; i += 2) {
// //       if (i + 1 < handRailPoints.length)
// //         total += calculateDistance(handRailPoints[i], handRailPoints[i + 1]);
// //     }
// //     return total;
// //   }
// // }
//
//
//
//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:math';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:solarkits_new/apiServices/api_services.dart';
// import 'package:solarkits_new/models/comanItem_model.dart';
// import 'package:http/http.dart' as http;
// import '../view/custome_snackbar.dart';
// class Walkway {
//   String id;
//   String name;
//   List<LatLng> points;
//   bool isHorizontal;
//   double width;
//   double length;
//   double maxLength;
//   double rotationAngle;
//
//   Walkway({
//     required this.id,
//     required this.points,
//     this.isHorizontal = true,
//     this.width = 0.5,
//     this.length = 3.0,
//     required this.maxLength,
//     this.rotationAngle = 0,
//     required this.name,
//   });
//
//   Polygon toPolygon() => Polygon(
//     polygonId: PolygonId(id),
//     points: points,
//     strokeWidth: 1,
//     strokeColor: Colors.deepOrange,
//     fillColor: Colors.deepOrange.withOpacity(0.5),
//   );
//
//   Walkway copyWith({
//     List<LatLng>? points,
//     bool? isHorizontal,
//     double? width,
//     double? length,
//     double? maxLength,
//     String? name,
//   }) {
//     return Walkway(
//       id: id,
//       points: points ?? this.points,
//       isHorizontal: isHorizontal ?? this.isHorizontal,
//       width: width ?? this.width,
//       length: length ?? this.length,
//       maxLength: maxLength ?? this.maxLength,
//       name: name ?? this.name,
//     );
//   }
// }
//
// class Building {
//   String id;
//   String name;
//   String projectType;
//   String customerName;
//   String customerMobile;
//   List<LatLng> terracePoints;
//   List<LatLng> panels;
//   List<Walkway> walkways;
//   bool isHorizontal;
//   bool isAlternate;
//   double padding;
//   double rowSpacing;
//   int selectedPanelCount;
//   int selectedRows;
//   double totalKw;
//   String terraceType;
//   int frontLegHeight;
//   int backLegHeight;
//   String mountingStyle;
//   double paneltotalWidth;
//   double paneltotalHeight;
//   int f6040;
//   int f4040;
//   int lAngle_qty;
//   int americanBolt_qty;
//   int zink_qty;
//   int jBolt_qty;
//   int foundation_qty;
//   int dcWire_meter;
//   int acWire_meter;
//   int extraPipes;
//   double totalKg;
//   bool isMeterOrFeet;
//   String inverterPosition;
//   String structureType;
//   bool isSaved;
//   String selectedProjectType;
//   String selectedTechnology;
//   String selectedPanelWatt;
//   String selectedKilowatt;
//
//   Building({
//     required this.id,
//     required this.name,
//     this.projectType = '',
//     this.customerName = "",
//     this.customerMobile = "",
//     this.terracePoints = const [],
//     this.panels = const [],
//     this.walkways = const [],
//     this.isHorizontal = true,
//     this.isAlternate = false,
//     this.padding = 0,
//     this.rowSpacing = 0,
//     this.selectedPanelCount = 0,
//     this.selectedRows = 1,
//     this.totalKw = 0,
//     this.terraceType = "Rcc Roof",
//     this.frontLegHeight = 0,
//     this.backLegHeight = 0,
//     this.mountingStyle = "Legs On Terrace",
//     this.paneltotalWidth = 0,
//     this.paneltotalHeight = 0,
//     this.f6040 = 0,
//     this.f4040 = 0,
//     this.lAngle_qty = 0,
//     this.americanBolt_qty = 0,
//     this.zink_qty = 0,
//     this.jBolt_qty = 0,
//     this.foundation_qty = 0,
//     this.dcWire_meter = 0,
//     this.acWire_meter = 0,
//     this.extraPipes = 0,
//     this.totalKg = 0,
//     this.isMeterOrFeet = true,
//     this.inverterPosition = "Ground Floor",
//     this.structureType = "Hot dig Gi(Galvanised iron)",
//     this.isSaved = false,
//     this.selectedProjectType = "",
//     this.selectedTechnology = "",
//     this.selectedPanelWatt = "545",
//     this.selectedKilowatt = "",
//   });
//
//   Building copyWith({
//     String? id,
//     String? name,
//     String? projectType,
//     String? customerName,
//     String? customerMobile,
//     List<LatLng>? terracePoints,
//     List<LatLng>? panels,
//     List<Walkway>? walkways,
//     bool? isHorizontal,
//     bool? isAlternate,
//     double? padding,
//     double? rowSpacing,
//     int? selectedPanelCount,
//     int? selectedRows,
//     double? totalKw,
//     String? terraceType,
//     int? frontLegHeight,
//     int? backLegHeight,
//     String? mountingStyle,
//     double? paneltotalWidth,
//     double? paneltotalHeight,
//     int? f6040,
//     int? f4040,
//     int? lAngle_qty,
//     int? americanBolt_qty,
//     int? zink_qty,
//     int? jBolt_qty,
//     int? foundation_qty,
//     int? dcWire_meter,
//     int? acWire_meter,
//     int? extraPipes,
//     double? totalKg,
//     bool? isMeterOrFeet,
//     String? inverterPosition,
//     String? structureType,
//     bool? isSaved,
//     String? selectedProjectType,
//     String? selectedTechnology,
//     String? selectedPanelWatt,
//     String? selectedKilowatt,
//   }) {
//     return Building(
//       id: id ?? this.id,
//       name: name ?? this.name,
//        projectType: projectType ?? this.projectType,
//       customerName: customerName ?? this.customerName,
//       customerMobile: customerMobile ?? this.customerMobile,
//       terracePoints: terracePoints ?? this.terracePoints,
//       panels: panels ?? this.panels,
//       walkways: walkways ?? this.walkways,
//       isHorizontal: isHorizontal ?? this.isHorizontal,
//       isAlternate: isAlternate ?? this.isAlternate,
//       padding: padding ?? this.padding,
//       rowSpacing: rowSpacing ?? this.rowSpacing,
//       selectedPanelCount: selectedPanelCount ?? this.selectedPanelCount,
//       selectedRows: selectedRows ?? this.selectedRows,
//       totalKw: totalKw ?? this.totalKw,
//       terraceType: terraceType ?? this.terraceType,
//       frontLegHeight: frontLegHeight ?? this.frontLegHeight,
//       backLegHeight: backLegHeight ?? this.backLegHeight,
//       mountingStyle: mountingStyle ?? this.mountingStyle,
//       paneltotalWidth: paneltotalWidth ?? this.paneltotalWidth,
//       paneltotalHeight: paneltotalHeight ?? this.paneltotalHeight,
//       f6040: f6040 ?? this.f6040,
//       f4040: f4040 ?? this.f4040,
//       lAngle_qty: lAngle_qty ?? this.lAngle_qty,
//       americanBolt_qty: americanBolt_qty ?? this.americanBolt_qty,
//       zink_qty: zink_qty ?? this.zink_qty,
//       jBolt_qty: jBolt_qty ?? this.jBolt_qty,
//       foundation_qty: foundation_qty ?? this.foundation_qty,
//       dcWire_meter: dcWire_meter ?? this.dcWire_meter,
//       acWire_meter: acWire_meter ?? this.acWire_meter,
//       extraPipes: extraPipes ?? this.extraPipes,
//       totalKg: totalKg ?? this.totalKg,
//       isMeterOrFeet: isMeterOrFeet ?? this.isMeterOrFeet,
//       inverterPosition: inverterPosition ?? this.inverterPosition,
//       structureType: structureType ?? this.structureType,
//       isSaved: isSaved ?? this.isSaved,
//       selectedProjectType: selectedProjectType ?? this.selectedProjectType,
//       selectedTechnology: selectedTechnology ?? this.selectedTechnology,
//       selectedPanelWatt: selectedPanelWatt ?? this.selectedPanelWatt,
//       selectedKilowatt: selectedKilowatt ?? this.selectedKilowatt,
//     );
//   }
// }
//
// class UnifiedSurveyController extends GetxController {
//   final ApiServices _apiService = ApiServices();
//
//
//
//   var terraceTypesList =  <CommonItemModel>[].obs;
//   RxString selectedTerraceTypeId = ''.obs;
//
//   var structureTypeList = <CommonItemModel>[].obs;
//   RxString selectedStructureTypeId = ''.obs;
//
//   var inverterPositionList = <CommonItemModel>[].obs;
//   RxString selectedInverterPositionId = ''.obs;
//
//   var categoryList = <CommonItemModel>[].obs;
//   RxString selectedCategoryId = ''.obs;
//
//   var subCategoryList = <CommonItemModel>[].obs;
//   RxString selectedSubCategoryId = ''.obs;
//
//   var projectTypeList = <CommonItemModel>[].obs;
//   RxString selectedProjectTypeId = ''.obs;
//   RxString selectedProjectType = ''.obs;
//
//   var subprojectTypeList = <CommonItemModel>[].obs;
//   RxString selectedSubprojectTypeId = ''.obs;
//
//   var brandList = <CommonItemModel>[].obs;
//   RxString selectedBrand = ''.obs;
//
//   var technologyList = <CommonItemModel>[].obs;
//   RxString selectedTechnologyId = ''.obs;
//
//   var panelWattList = <CommonItemModel>[].obs;
//   RxString selectedPanelWattId = ''.obs;
//   RxString selectedPanelWatt = ''.obs;
//
//
//   var noOfPanelList = <CommonItemModel>[].obs;
//   RxString selectedNoOfPanels = ''.obs;
//
//   var kilowattList = <CommonItemModel>[].obs;
//   RxString selectedKilowattId = ''.obs;
//
//   var buildingTypes = <CommonItemModel>[].obs;
//   RxString selectedBuildingType = ''.obs;
//
//
//   // Reactive variables
//   var polygonPoints = <LatLng>[].obs;
//   var polygonArea = 0.0.obs;
//   var distanceMarkers = <Marker>{}.obs;
//   var isSelectingArea = false.obs;
//   var isEditingTerrace = false.obs;
//   var isEditingTerraceLayout = false.obs;
//   var showStreetView = false.obs;
//   var pickedLocation = LatLng(22.260076, 70.787970).obs;
//   var showInMeters = true.obs;
//   var boundaryIcon = BitmapDescriptor.defaultMarker.obs;
//   var walkWayIcon = BitmapDescriptor.defaultMarker.obs;
//   var panelDragIcon = BitmapDescriptor.defaultMarker.obs;
//
//   var currentMode = 1.obs;
//   var isDrawingTerrace = false.obs;
//   var hasTerrace = false.obs;
//   var hasPanels = false.obs;
//   var isSaved = false.obs;
//   var isLoading = false.obs;
//   var isDraggingPanels = false.obs;
//   var editingTerraceIndex = (-1).obs;
//
//   // Panel edit controls
//   var paddingValue = 0.0.obs;
//   var rowSpacingValue = 0.0.obs;
//   var availableRowsForEdit = <int>[].obs;
//   var groupRowsForSpace = 1.obs; // for As Per Space
//   var groupRowsForKW = 1.obs;    // for As Per KW
//
//   // Walkway edit state
//   var isEditingWalkway = false.obs;
//   var selectedWalkwayIndex = (-1).obs;
//   var isAddingWalkway = false.obs;
//
//   var dragHandlePosition = LatLng(0, 0).obs;
//   var originalPanelCenters = <LatLng>[].obs;
//   LatLng? dragStartPoint;
//
//   var buildings = <Building>[].obs;
//   var selectedBuildingId = "".obs;
//
//   Building? get currentBuilding {
//     if (selectedBuildingId.isEmpty) return null;
//     try {
//       return buildings.firstWhere((b) => b.id == selectedBuildingId.value);
//     } catch (e) {
//       return null;
//     }
//   }
//
//   var selectedPanelCount = 0.obs;
//   var selectedRows = 1.obs;
//   var availableRows = <int>[].obs;
//   var isHorizontal = true.obs;
//   var terraceType = "Rcc Roof".obs;
//   var frontLegHeight = 0.obs;
//   var backLegHeight = 0.obs;
//   var isMeterOrFeet = true.obs;
//   var inverterPosition = "Ground Floor".obs;
//   var structureType = "Hot dig Gi(Galvanised iron)".obs;
//   var totalPanelWidth = 0.0.obs;
//   var totalPanelHeight = 0.0.obs;
//
//
//
//   final List<String> projectTypes = ["Residential", "Commercial", "Industrial"];
//   final List<String> technologies = ["Bifacial", "Topcon", "Mono Perc"];
//   final List<String> panelWatts = ["540", "545", "550", "555", "560", "565", "570", "575"];
//   final List<String> kilowattOptions = ["2.27", "3.24", "4.20", "5.25", "6.30", "7.35", "8.40", "9.45", "10.50"];
//   final List<String> terraceTypes = ["Rcc Roof", "Slant Roof", "Ground Mountain"];
//   final List<String> structureTypes = ["Hot dig Gi(Galvanised iron)", "Aluminium", "GI Structure"];
//   final List<String> inverterPositions = ["Ground Floor", "Sidi Room", "Terrace", "Roof Top"];
//
//   GoogleMapController? mapController;
//   final double earthRadius = 6371000;
//
//   RxList<Walkway> currentWalkways = <Walkway>[].obs;
//   RxInt editingWalkwayIndex = (-1).obs;
//   RxString selectedWalkwayWidth = "270".obs;
//   RxList<LatLng> currentHandRailPoints = <LatLng>[].obs;
//   RxBool isDrawingHandRail = false.obs;
//   RxBool isHandRailComplete = false.obs;
//   final RxSet<Polygon> solarPanelsPolygons = <Polygon>{}.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadIcons();
//     getTerraceType();
//     getStructureType();
//     getInverterPositions();
//     getCategory();
//     getBuildingType();
//   }
//
//   Future<void> loadIcons() async {
//     boundaryIcon.value = await BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(size: Size(22, 22)),
//       "assets/images/bcircle3.png",
//     );
//     walkWayIcon.value = await BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(size: Size(10, 10)),
//       "assets/images/wcircle.png",
//     );
//     panelDragIcon.value = await BitmapDescriptor.fromAssetImage(
//       const ImageConfiguration(size: Size(22, 22)),
//       "assets/images/panelDragHandle.png",
//     );
//   }
//
//   bool isPolygonValid(List<LatLng> points) {
//     if (points.length < 3) return true;
//     for (int i = 0; i < points.length; i++) {
//       final p1 = points[i];
//       final p2 = points[(i + 1) % points.length];
//       for (int j = i + 2; j < points.length; j++) {
//         final p3 = points[j];
//         final p4 = points[(j + 1) % points.length];
//         if (i == j || (i + 1) % points.length == j || (j + 1) % points.length == i) continue;
//         if (_lineSegmentsIntersect(p1, p2, p3, p4)) return false;
//       }
//     }
//     return true;
//   }
//
//   bool _lineSegmentsIntersect(LatLng p1, LatLng p2, LatLng p3, LatLng p4) {
//     double orientation(LatLng a, LatLng b, LatLng c) {
//       double val = (b.latitude - a.latitude) * (c.longitude - b.longitude) -
//           (b.longitude - a.longitude) * (c.latitude - b.latitude);
//       if (val.abs() < 1e-10) return 0;
//       return val.sign;
//     }
//     double o1 = orientation(p1, p2, p3);
//     double o2 = orientation(p1, p2, p4);
//     double o3 = orientation(p3, p4, p1);
//     double o4 = orientation(p3, p4, p2);
//     if (o1 != o2 && o3 != o4) return true;
//     if (o1 == 0 && _onSegment(p1, p3, p2)) return true;
//     if (o2 == 0 && _onSegment(p1, p4, p2)) return true;
//     if (o3 == 0 && _onSegment(p3, p1, p4)) return true;
//     if (o4 == 0 && _onSegment(p3, p2, p4)) return true;
//     return false;
//   }
//
//   bool _onSegment(LatLng p, LatLng q, LatLng r) {
//     return q.latitude <= max(p.latitude, r.latitude) &&
//         q.latitude >= min(p.latitude, r.latitude) &&
//         q.longitude <= max(p.longitude, r.longitude) &&
//         q.longitude >= min(p.longitude, r.longitude);
//   }
//
//   void createNewBuilding(String name, String customerName, String customerMobile,String projectType) {
//     final newBuilding = Building(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: name,
//       customerName: customerName,
//       customerMobile: customerMobile,
//       projectType: projectType,
//     );
//     buildings.add(newBuilding);
//     selectedBuildingId.value = newBuilding.id;
//     isSelectingArea.value = true;
//     isDrawingTerrace.value = true;
//     hasTerrace.value = false;
//     hasPanels.value = false;
//     isSaved.value = false;
//     isEditingTerraceLayout.value = false;
//     clearTerrace();
//   }
//
//   void clearTerrace() {
//     polygonPoints.clear();
//     polygonArea.value = 0.0;
//     distanceMarkers.clear();
//     solarPanelsPolygons.clear();
//     currentWalkways.clear();
//     currentHandRailPoints.clear();
//     isDrawingHandRail.value = false;
//     isHandRailComplete.value = false;
//   }
//
//   void addPolygonPoint(LatLng point) {
//     if (isSelectingArea.value && isDrawingTerrace.value) {
//       polygonPoints.add(point);
//       updatePolygon();
//     }
//   }
//
//   void undoLastPoint() {
//     if (polygonPoints.isNotEmpty) {
//       polygonPoints.removeLast();
//       updatePolygon();
//     }
//   }
//
//   void updatePolygonPoint(int index, LatLng newPosition) {
//     if (index >= 0 && index < polygonPoints.length) {
//       polygonPoints[index] = newPosition;
//       updatePolygon(forceUpdate: true);
//     }
//   }
//
//   void removePolygonPoint(int index) {
//     if (index >= 0 && index < polygonPoints.length) {
//       polygonPoints.removeAt(index);
//       updatePolygon();
//     }
//   }
//
//   void startEditingTerrace() {
//     if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty) {
//       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
//       isSelectingArea.value = true;
//       isEditingTerrace.value = true;
//       isDrawingTerrace.value = false;
//       editingTerraceIndex.value = 0;
//       isEditingTerraceLayout.value = true;
//       selectedRows.value = currentBuilding!.selectedRows;
//       isHorizontal.value = currentBuilding!.isHorizontal;
//       paddingValue.value = currentBuilding!.padding;
//       rowSpacingValue.value = currentBuilding!.rowSpacing;
//       groupRowsForKW.value = currentBuilding!.rowSpacing > 0 ? 1 : 1;
//       updateAvailableRowsForEdit();
//       if (currentWalkways.isNotEmpty) {
//         selectedWalkwayIndex.value = 0;
//         editingWalkwayIndex.value = 0;
//         isEditingWalkway.value = true;
//       } else {
//         stopEditingWalkway();
//       }
//     }
//   }
//
//   bool saveEditedTerrace() {
//     if (polygonPoints.length < 3) return false;
//     if (!isPolygonValid(polygonPoints)) return false;
//     if (currentBuilding != null) {
//       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//       if (index != -1) {
//         buildings[index] = buildings[index].copyWith(
//           terracePoints: List<LatLng>.from(polygonPoints),
//           isSaved: false,
//         );
//       }
//     }
//     isSelectingArea.value = false;
//     isEditingTerrace.value = false;
//     hasTerrace.value = true;
//     editingTerraceIndex.value = -1;
//     isEditingTerraceLayout.value = false;
//     stopEditingWalkway();
//     if (hasPanels.value) calculateAndShowPanels();
//     return true;
//   }
//
//   void cancelEditingTerrace() {
//     if (currentBuilding != null) {
//       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
//     }
//     isSelectingArea.value = false;
//     isEditingTerrace.value = false;
//     editingTerraceIndex.value = -1;
//     isEditingTerraceLayout.value = false;
//     stopEditingWalkway();
//     updatePolygon();
//   }
//
//   bool completeTerraceDrawing() {
//     if (polygonPoints.length < 3) return false;
//     if (!isPolygonValid(polygonPoints)) return false;
//     isSelectingArea.value = false;
//     isDrawingTerrace.value = false;
//     hasTerrace.value = true;
//     if (currentBuilding != null) {
//       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//       if (index != -1) {
//         buildings[index] = buildings[index].copyWith(
//           terracePoints: List<LatLng>.from(polygonPoints),
//         );
//       }
//     }
//     editingTerraceIndex.value = 0;
//     return true;
//   }
//
//   void saveStructureDetails({
//     required String terraceTypeVal,
//     required String structureTypeVal,
//     required String inverterPositionVal,
//     required bool isMeterOrFeetVal,
//     required int frontLegHeightVal,
//     required int backLegHeightVal,
//   }) {
//     terraceType.value = terraceTypeVal;
//     structureType.value = structureTypeVal;
//     inverterPosition.value = inverterPositionVal;
//     isMeterOrFeet.value = isMeterOrFeetVal;
//     frontLegHeight.value = frontLegHeightVal;
//     backLegHeight.value = backLegHeightVal;
//     if (currentBuilding != null) {
//       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//       if (index != -1) {
//         buildings[index] = buildings[index].copyWith(
//           terraceType: terraceTypeVal,
//           structureType: structureTypeVal,
//           inverterPosition: inverterPositionVal,
//           isMeterOrFeet: isMeterOrFeetVal,
//           frontLegHeight: frontLegHeightVal,
//           backLegHeight: backLegHeightVal,
//         );
//       }
//     }
//   }
//
//   void savePanelConfiguration({
//     required String projectType,
//     required String technology,
//     required String panelWatt,
//     required String kilowatt,
//     required int panelCount,
//   }) {
//     selectedProjectTypeId.value = projectType;
//     selectedTechnologyId.value = technology;
//     selectedPanelWattId.value = panelWatt;
//     selectedKilowattId.value = kilowatt;
//     selectedPanelCount.value = panelCount;
//     selectedRows.value = 1;
//     isHorizontal.value = true;
//     if (currentBuilding != null) {
//       final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//       if (index != -1) {
//         buildings[index] = buildings[index].copyWith(
//           selectedProjectType: projectType,
//           selectedTechnology: technology,
//           selectedPanelWatt: panelWatt,
//           selectedKilowatt: kilowatt,
//           selectedPanelCount: panelCount,
//           selectedRows: 1,
//           isHorizontal: true,
//         );
//       }
//     }
//     calculateAndShowPanels();
//   }
//
//   void updateAvailableRows() {
//     if (selectedPanelCount.value <= 0 || currentBuilding == null) {
//       availableRows.value = [1];
//       selectedRows.value = 1;
//       return;
//     }
//     final feasibleRows = <int>[];
//     for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
//       if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
//     }
//     availableRows.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
//     if (availableRows.isNotEmpty && !availableRows.contains(selectedRows.value)) {
//       selectedRows.value = availableRows.first;
//     }
//   }
//
//   void updateAvailableRowsForEdit() {
//     if (selectedPanelCount.value <= 0 || currentBuilding == null) {
//       availableRowsForEdit.value = [1];
//       selectedRows.value = 1;
//       return;
//     }
//     final feasibleRows = <int>[];
//     for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
//       if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
//     }
//     availableRowsForEdit.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
//     if (availableRowsForEdit.isNotEmpty && !availableRowsForEdit.contains(selectedRows.value)) {
//       selectedRows.value = availableRowsForEdit.first;
//     }
//   }
//
//   bool isRowConfigurationFeasible(int rows) {
//     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return false;
//     final bounds = getPolygonBounds(currentBuilding!.terracePoints);
//     final center = LatLng(
//       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
//       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
//     );
//     final columns = (selectedPanelCount.value / rows).ceil();
//     const double panelWidth = 1.13, panelHeight = 2.27;
//     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
//     final double panelHeightDeg = panelHeight / 111111.0;
//     double requiredWidth = isHorizontal.value ? columns * panelHeightDeg : columns * panelWidthDeg;
//     double requiredHeight = isHorizontal.value ? rows * panelWidthDeg : rows * panelHeightDeg;
//     double availableWidth = (bounds.northeast.longitude - bounds.southwest.longitude).abs();
//     double availableHeight = (bounds.northeast.latitude - bounds.southwest.latitude).abs();
//     return requiredWidth <= availableWidth && requiredHeight <= availableHeight;
//   }
//
//   void calculateAndShowPanels() {
//     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
//     List<LatLng> centers;
//     if (currentMode.value == 1) {
//       centers = calculatePanelCentersWithRows(
//         currentBuilding!.terracePoints,
//         selectedPanelCount.value,
//         selectedRows.value,
//         isHorizontal.value,
//         paddingValue.value,
//         rowSpacingValue.value,
//         groupRowsForKW.value,
//       );
//     } else {
//       centers = calculatePanelCentersFull(
//         currentBuilding!.terracePoints,
//         isHorizontal.value,
//         paddingValue.value,
//         rowSpacingValue.value,
//         groupRowsForSpace.value,
//       );
//     }
//     totalPanelWidth.value = calculatePanelStructureWidth(centers, isHorizontal.value);
//     totalPanelHeight.value = calculatePanelStructureHeight(centers, isHorizontal.value);
//     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (index != -1) {
//       buildings[index] = buildings[index].copyWith(
//         panels: centers,
//         selectedPanelCount: selectedPanelCount.value,
//         selectedRows: selectedRows.value,
//         isHorizontal: isHorizontal.value,
//         paneltotalWidth: totalPanelWidth.value,
//         paneltotalHeight: totalPanelHeight.value,
//         isSaved: false,
//         padding: paddingValue.value,
//         rowSpacing: rowSpacingValue.value,
//       );
//     }
//     solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
//     hasPanels.value = true;
//     if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
//     double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
//     if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
//   }
//
//   void updatePanelsFromEditCard() {
//     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
//     List<LatLng> centers;
//     if (currentMode.value == 1) {
//       centers = calculatePanelCentersWithRows(
//         currentBuilding!.terracePoints,
//         selectedPanelCount.value,
//         selectedRows.value,
//         isHorizontal.value,
//         paddingValue.value,
//         rowSpacingValue.value,
//         groupRowsForKW.value,
//       );
//     } else {
//       centers = calculatePanelCentersFull(
//         currentBuilding!.terracePoints,
//         isHorizontal.value,
//         paddingValue.value,
//         rowSpacingValue.value,
//         groupRowsForSpace.value,
//       );
//     }
//     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (index != -1) {
//       buildings[index] = buildings[index].copyWith(
//         panels: centers,
//         isHorizontal: isHorizontal.value,
//         selectedRows: selectedRows.value,
//         padding: paddingValue.value,
//         rowSpacing: rowSpacingValue.value,
//       );
//     }
//     solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
//     if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
//     double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
//     if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
//   }
//
//   LatLng getPanelsCenter(List<LatLng> panels) {
//     if (panels.isEmpty) return pickedLocation.value;
//     double sumLat = 0, sumLng = 0;
//     for (final panel in panels) {
//       sumLat += panel.latitude;
//       sumLng += panel.longitude;
//     }
//     return LatLng(sumLat / panels.length, sumLng / panels.length);
//   }
//
//   void moveAllPanels(double latDelta, double lngDelta) {
//     if (editingTerraceIndex.value == -1) return;
//     if (currentBuilding == null) return;
//     final terrace = currentBuilding!;
//     final List<LatLng> newCenters = [];
//     for (final panel in terrace.panels) {
//       final newPos = LatLng(panel.latitude + latDelta, panel.longitude + lngDelta);
//       if (!_isPointInPolygon(newPos, terrace.terracePoints)) return;
//       newCenters.add(newPos);
//     }
//     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (index != -1) {
//       buildings[index] = buildings[index].copyWith(panels: newCenters, isSaved: false);
//     }
//     solarPanelsPolygons.value = convertCentersToPolygons(newCenters, isHorizontal.value);
//     if (newCenters.isNotEmpty) dragHandlePosition.value = getPanelsCenter(newCenters);
//   }
//
//   double calculatePanelStructureWidth(List<LatLng> panels, bool isHorizontal) {
//     if (panels.isEmpty) return 0.0;
//     final rows = <double, List<LatLng>>{};
//     for (final panel in panels) {
//       final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
//       rows.putIfAbsent(rowKey, () => []).add(panel);
//     }
//     int maxPanelsInRow = 0;
//     for (final row in rows.values) {
//       if (row.length > maxPanelsInRow) maxPanelsInRow = row.length;
//     }
//     return isHorizontal ? maxPanelsInRow * 2.27 : maxPanelsInRow * 1.13;
//   }
//
//   double calculatePanelStructureHeight(List<LatLng> panels, bool isHorizontal) {
//     if (panels.isEmpty) return 0.0;
//     final rows = <double, List<LatLng>>{};
//     for (final panel in panels) {
//       final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
//       rows.putIfAbsent(rowKey, () => []).add(panel);
//     }
//     return isHorizontal ? rows.length * 1.13 : rows.length * 2.27;
//   }
//
//   // ========== PANEL CALCULATION METHODS ==========
//
//   List<LatLng> calculatePanelCentersWithRows(
//       List<LatLng> polygonPoints,
//       int panelCount,
//       int rows,
//       bool isHorizontal,
//       double padding,
//       double rowSpacing,
//       int groupRows,
//       ) {
//     if (polygonPoints.length < 3 || panelCount <= 0 || rows <= 0) return [];
//
//     final bounds = getPolygonBounds(polygonPoints);
//     final center = LatLng(
//       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
//       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
//     );
//
//     final double paddingLat = padding / 111111.0;
//     final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
//     final double paddedSouth = bounds.southwest.latitude + paddingLat;
//     final double paddedNorth = bounds.northeast.latitude - paddingLat;
//     final double paddedWest = bounds.southwest.longitude + paddingLng;
//     final double paddedEast = bounds.northeast.longitude - paddingLng;
//
//     if (paddedSouth >= paddedNorth || paddedWest >= paddedEast) return [];
//
//     final columns = (panelCount / rows).ceil();
//     const double panelWidth = 1.13, panelHeight = 2.27;
//     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
//     final double panelHeightDeg = panelHeight / 111111.0;
//
//     double lngStep, latStep;
//     if (isHorizontal) {
//       lngStep = panelHeightDeg;
//       latStep = panelWidthDeg;
//     } else {
//       lngStep = panelWidthDeg;
//       latStep = panelHeightDeg;
//     }
//
//     final double rowSpacingDeg = rowSpacing / 111111.0;
//
//     // Row tops without spacing
//     double fullGridHeight = rows * latStep;
//     double startY = paddedNorth - fullGridHeight;
//     List<double> rowTops = List.generate(rows, (i) => startY + i * latStep);
//
//     // Apply grouping offsets
//     List<double> offsets = List.filled(rows, 0.0);
//     for (int i = 0; i < rows; i++) {
//       int groupsBefore = (i / groupRows).floor();
//       offsets[i] = groupsBefore * rowSpacingDeg;
//     }
//     for (int i = 0; i < rows; i++) {
//       rowTops[i] += offsets[i];
//     }
//
//     // Center the block vertically
//     double blockTop = rowTops.first;
//     double blockBottom = rowTops.last + latStep;
//     double blockHeight = blockBottom - blockTop;
//     double availableHeight = paddedNorth - paddedSouth;
//     double deltaY = paddedSouth + (availableHeight - blockHeight) / 2 - blockTop;
//     for (int i = 0; i < rows; i++) {
//       rowTops[i] += deltaY;
//     }
//
//     // Generate panel centers, skipping those inside any walkway
//     List<LatLng> centers = [];
//     double rowStartLng = paddedWest + (paddedEast - paddedWest - (columns * lngStep)) / 2;
//     int panelsPlaced = 0;
//
//     for (int row = 0; row < rows; row++) {
//       int panelsInRow = (row == rows - 1) ? panelCount - (rows - 1) * columns : columns;
//       for (int col = 0; col < panelsInRow; col++) {
//         double centerLng = rowStartLng + col * lngStep + lngStep / 2;
//         double centerLat = rowTops[row] + latStep / 2;
//         LatLng panelCenter = LatLng(centerLat, centerLng);
//
//         if (!_isPointInPolygon(panelCenter, polygonPoints)) continue;
//
//         bool insideWalkway = false;
//         for (final walkway in currentWalkways) {
//           if (_isPointInPolygon(panelCenter, walkway.points)) {
//             insideWalkway = true;
//             break;
//           }
//         }
//         if (insideWalkway) continue;
//
//         centers.add(panelCenter);
//         panelsPlaced++;
//       }
//     }
//     return centers;
//   }
//
//   List<LatLng> calculatePanelCentersFull(
//       List<LatLng> polygonPoints,
//       bool isHorizontal,
//       double padding,
//       double rowSpacing,
//       int groupRows,
//       ) {
//     if (polygonPoints.length < 3) return [];
//
//     final bounds = getPolygonBounds(polygonPoints);
//     final center = LatLng(
//       (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
//       (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
//     );
//
//     final double paddingLat = padding / 111111.0;
//     final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
//     final double startLat = bounds.southwest.latitude + paddingLat;
//     final double endLat = bounds.northeast.latitude - paddingLat;
//     final double startLng = bounds.southwest.longitude + paddingLng;
//     final double endLng = bounds.northeast.longitude - paddingLng;
//
//     if (startLat >= endLat || startLng >= endLng) return [];
//
//     const double panelWidth = 1.13, panelHeight = 2.27;
//     final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
//     final double panelHeightDeg = panelHeight / 111111.0;
//
//     int cols, totalRows;
//     if (isHorizontal) {
//       cols = ((endLng - startLng) / panelHeightDeg).floor();
//       totalRows = ((endLat - startLat) / panelWidthDeg).floor();
//     } else {
//       cols = ((endLng - startLng) / panelWidthDeg).floor();
//       totalRows = ((endLat - startLat) / panelHeightDeg).floor();
//     }
//
//     if (cols <= 0 || totalRows <= 0) return [];
//
//     final double stepLng = isHorizontal ? panelHeightDeg : panelWidthDeg;
//     final double stepLat = isHorizontal ? panelWidthDeg : panelHeightDeg;
//     final double rowSpacingDeg = rowSpacing / 111111.0;
//
//     // Row tops without spacing
//     double fullGridHeight = totalRows * stepLat;
//     double startY = endLat - fullGridHeight;
//     List<double> rowTops = List.generate(totalRows, (i) => startY + i * stepLat);
//
//     // Apply grouping offsets
//     List<double> offsets = List.filled(totalRows, 0.0);
//     for (int i = 0; i < totalRows; i++) {
//       int groupsBefore = (i / groupRows).floor();
//       offsets[i] = groupsBefore * rowSpacingDeg;
//     }
//     for (int i = 0; i < totalRows; i++) {
//       rowTops[i] += offsets[i];
//     }
//
//     // Center the block vertically
//     double blockTop = rowTops.first;
//     double blockBottom = rowTops.last + stepLat;
//     double blockHeight = blockBottom - blockTop;
//     double availableHeight = endLat - startLat;
//     double deltaY = startLat + (availableHeight - blockHeight) / 2 - blockTop;
//     for (int i = 0; i < totalRows; i++) {
//       rowTops[i] += deltaY;
//     }
//
//     // Generate panel centers, skipping those inside any walkway
//     List<LatLng> centers = [];
//     double rowStartLng = startLng + (endLng - startLng - (cols * stepLng)) / 2;
//
//     for (int row = 0; row < totalRows; row++) {
//       for (int col = 0; col < cols; col++) {
//         double centerLng = rowStartLng + col * stepLng + stepLng / 2;
//         double centerLat = rowTops[row] + stepLat / 2;
//         LatLng panelCenter = LatLng(centerLat, centerLng);
//
//         if (!_isPointInPolygon(panelCenter, polygonPoints)) continue;
//
//         bool insideWalkway = false;
//         for (final walkway in currentWalkways) {
//           if (_isPointInPolygon(panelCenter, walkway.points)) {
//             insideWalkway = true;
//             break;
//           }
//         }
//         if (insideWalkway) continue;
//
//         centers.add(panelCenter);
//       }
//     }
//     return centers;
//   }
//
//   bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
//     bool inside = false;
//     for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
//       final xi = polygon[i].latitude, yi = polygon[i].longitude;
//       final xj = polygon[j].latitude, yj = polygon[j].longitude;
//       final intersect = ((yi > point.longitude) != (yj > point.longitude)) &&
//           (point.latitude < (xj - xi) * (point.longitude - yi) / (yj - yi) + xi);
//       if (intersect) inside = !inside;
//     }
//     return inside;
//   }
//
//   Set<Polygon> convertCentersToPolygons(List<LatLng> centers, bool isHorizontal) {
//     return centers.map((center) => _createPanelPolygon(center, isHorizontal)).toSet();
//   }
//
//   Polygon _createPanelPolygon(LatLng center, bool isHorizontal, {int rowIndex = 0}) {
//     final panelWidth = isHorizontal ? 2.27 : 1.13;
//     final panelHeight = isHorizontal ? 1.13 : 2.27;
//     final latDelta = panelHeight / 111111.0 / 2;
//     final lngDelta = panelWidth / (111111.0 * cos(center.latitude * pi / 180)) / 2;
//     return Polygon(
//       polygonId: PolygonId('panel_${center.latitude}_${center.longitude}_$rowIndex'),
//       points: [
//         LatLng(center.latitude - latDelta, center.longitude - lngDelta),
//         LatLng(center.latitude - latDelta, center.longitude + lngDelta),
//         LatLng(center.latitude + latDelta, center.longitude + lngDelta),
//         LatLng(center.latitude + latDelta, center.longitude - lngDelta),
//       ],
//       strokeWidth: 1,
//       strokeColor: Colors.white,
//       fillColor: Colors.blue.withOpacity(0.8),
//     );
//   }
//
//   void saveTerrace() {
//     if (currentBuilding == null) return;
//     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (index != -1) buildings[index] = buildings[index].copyWith(isSaved: true);
//     isSaved.value = true;
//     isEditingTerraceLayout.value = false;
//     stopEditingWalkway();
//   }
//
//   void calculateBOM() {
//     if (currentBuilding == null) return;
//     double paneltotal_width = currentBuilding!.paneltotalWidth;
//     double paneltotal_Height = currentBuilding!.paneltotalHeight;
//     int nof_Rows = currentBuilding!.selectedRows;
//     bool isMeterOrFeet = currentBuilding!.isMeterOrFeet;
//     int nofPanels = currentBuilding!.panels.length;
//     int nof_FrontLeg = (paneltotal_width / 1.5).round();
//     int nof_BackLeg = (paneltotal_Height / 3.048).round();
//     if (paneltotal_Height > 3.048) nof_BackLeg += 1;
//     int legs;
//     if (isMeterOrFeet) {
//       double frontLegHeight = currentBuilding!.frontLegHeight / 3.281;
//       double backLegHeight = currentBuilding!.backLegHeight / 3.281;
//       legs = nof_FrontLeg * (frontLegHeight + backLegHeight).floor();
//     } else {
//       legs = nof_FrontLeg * (currentBuilding!.frontLegHeight + currentBuilding!.backLegHeight).toInt();
//     }
//     var rafter = nof_FrontLeg * nof_Rows;
//     var perlin = nof_Rows * paneltotal_width * 2;
//     double f6040 = (legs + rafter) * 0.8;
//     int f6040_2 = f6040.floor();
//     int f4040 = (perlin * 0.8).floor();
//     var totalKg = (f6040_2 + f4040) * 3.28;
//     double qty6040 = ((legs + rafter) * 3.28) / 20;
//     int qty6040_1 = qty6040.floor();
//     var qty4040 = (perlin * 3.28) / 20;
//     int qty4040_1 = qty4040.floor();
//     double borderTotalLength = 2 * (paneltotal_width + paneltotal_Height);
//     int extraPipes = 0;
//     if (isMeterOrFeet) {
//       int epipes = (borderTotalLength / 6.096).round();
//       extraPipes = currentBuilding!.backLegHeight >= 8 ? epipes : 0;
//     } else {
//       int epipes = (borderTotalLength / 6.096).round();
//       extraPipes = currentBuilding!.backLegHeight >= 2.43 ? epipes : 0;
//     }
//     int langle_qty = legs * 2;
//     int foundation_qty = legs * 2;
//     int americanBolt_qty = langle_qty * 2;
//     double kw = currentBuilding!.totalKw;
//     int zink_qty = kw <= 3 ? 1 : kw <= 6 ? 2 : kw <= 9 ? 3 : kw <= 12 ? 4 : kw <= 15 ? 5 : kw <= 18 ? 6 : kw <= 21 ? 7 : kw <= 24 ? 8 : 9;
//     int jBolt_qty = nofPanels * 4;
//     int dcWire_qty = 25;
//     int acWire_qty = 25;
//     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (index != -1) {
//       buildings[index] = buildings[index].copyWith(
//         f6040: qty6040_1,
//         f4040: qty4040_1,
//         totalKg: totalKg,
//         lAngle_qty: langle_qty,
//         americanBolt_qty: americanBolt_qty,
//         zink_qty: zink_qty,
//         jBolt_qty: jBolt_qty,
//         foundation_qty: foundation_qty,
//         dcWire_meter: dcWire_qty,
//         acWire_meter: acWire_qty,
//         extraPipes: extraPipes,
//       );
//     }
//   }
//
//   void switchMode(int mode) {
//     if (currentMode.value == mode) return;
//     currentMode.value = mode;
//     if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty && hasPanels.value) {
//       calculateAndShowPanels();
//     }
//   }
//
//   void deleteBuilding(String buildingId) {
//     buildings.removeWhere((b) => b.id == buildingId);
//     if (selectedBuildingId.value == buildingId) {
//       if (buildings.isNotEmpty) selectBuilding(buildings.first.id);
//       else {
//         selectedBuildingId.value = "";
//         hasTerrace.value = false;
//         hasPanels.value = false;
//         isSaved.value = false;
//         isEditingTerraceLayout.value = false;
//         clearTerrace();
//         editingTerraceIndex.value = -1;
//       }
//     }
//   }
//
//   void selectBuilding(String buildingId) {
//     if (selectedBuildingId.value == buildingId) return;
//     selectedBuildingId.value = buildingId;
//     if (currentBuilding != null) {
//       polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
//       hasTerrace.value = currentBuilding!.terracePoints.isNotEmpty;
//       hasPanels.value = currentBuilding!.panels.isNotEmpty;
//       isSaved.value = currentBuilding!.isSaved;
//       selectedPanelCount.value = currentBuilding!.selectedPanelCount;
//       selectedRows.value = currentBuilding!.selectedRows;
//       isHorizontal.value = currentBuilding!.isHorizontal;
//       terraceType.value = currentBuilding!.terraceType;
//       frontLegHeight.value = currentBuilding!.frontLegHeight;
//       backLegHeight.value = currentBuilding!.backLegHeight;
//       isMeterOrFeet.value = currentBuilding!.isMeterOrFeet;
//       selectedProjectTypeId.value = currentBuilding!.selectedProjectType;
//       selectedTechnologyId.value = currentBuilding!.selectedTechnology;
//       selectedPanelWattId.value = currentBuilding!.selectedPanelWatt;
//       selectedKilowattId.value = currentBuilding!.selectedKilowatt;
//       paddingValue.value = currentBuilding!.padding;
//       rowSpacingValue.value = currentBuilding!.rowSpacing;
//       groupRowsForKW.value = currentBuilding!.rowSpacing > 0 ? 1 : 1;
//       currentWalkways.value = List<Walkway>.from(currentBuilding!.walkways);
//       if (currentBuilding!.panels.isNotEmpty) {
//         solarPanelsPolygons.value = convertCentersToPolygons(currentBuilding!.panels, currentBuilding!.isHorizontal);
//         dragHandlePosition.value = getPanelsCenter(currentBuilding!.panels);
//       } else {
//         solarPanelsPolygons.clear();
//       }
//       updatePolygon();
//       editingTerraceIndex.value = hasTerrace.value ? 0 : -1;
//     } else {
//       clearTerrace();
//       editingTerraceIndex.value = -1;
//     }
//   }
//
//   // ========== WALKWAY METHODS (UPDATED FOR STRUCTURE SIZE) ==========
//
//   LatLngBounds? _getStructureBounds() {
//     if (currentBuilding == null || currentBuilding!.panels.isEmpty) return null;
//     double minLat = currentBuilding!.panels[0].latitude;
//     double maxLat = currentBuilding!.panels[0].latitude;
//     double minLng = currentBuilding!.panels[0].longitude;
//     double maxLng = currentBuilding!.panels[0].longitude;
//     for (final panel in currentBuilding!.panels) {
//       minLat = min(minLat, panel.latitude);
//       maxLat = max(maxLat, panel.latitude);
//       minLng = min(minLng, panel.longitude);
//       maxLng = max(maxLng, panel.longitude);
//     }
//     return LatLngBounds(
//       southwest: LatLng(minLat, minLng),
//       northeast: LatLng(maxLat, maxLng),
//     );
//   }
//
//   void startAddingWalkway() {
//     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
//     if (!isEditingTerraceLayout.value) {
//       startEditingTerrace();
//     }
//     isAddingWalkway.value = true;
//     isEditingWalkway.value = true;
//     addWalkway();
//     if (currentWalkways.isNotEmpty) {
//       selectedWalkwayIndex.value = currentWalkways.length - 1;
//       editingWalkwayIndex.value = selectedWalkwayIndex.value;
//     }
//   }
//
//   void addWalkway() {
//     if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
//
//     LatLngBounds bounds;
//     bool hasStructure = currentBuilding!.panels.isNotEmpty;
//     if (hasStructure) {
//       bounds = _getStructureBounds()!;
//     } else {
//       bounds = getPolygonBounds(currentBuilding!.terracePoints);
//     }
//
//     final double widthMeters = double.parse(selectedWalkwayWidth.value) / 1000;
//     final double centerLat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
//     final double halfHeightDeg = widthMeters / 111111.0 / 2;
//     final double topLat = centerLat + halfHeightDeg;
//     final double bottomLat = centerLat - halfHeightDeg;
//     final double lengthMeters = (bounds.northeast.longitude - bounds.southwest.longitude) *
//         111111 *
//         cos(centerLat * pi / 180);
//
//     final List<LatLng> points = [
//       LatLng(bottomLat, bounds.southwest.longitude),
//       LatLng(bottomLat, bounds.northeast.longitude),
//       LatLng(topLat, bounds.northeast.longitude),
//       LatLng(topLat, bounds.southwest.longitude),
//     ];
//
//     currentWalkways.add(Walkway(
//       id: DateTime.now().millisecondsSinceEpoch.toString(),
//       name: 'Walkway ${currentWalkways.length + 1}',
//       points: points,
//       isHorizontal: true,
//       width: widthMeters,
//       length: lengthMeters,
//       maxLength: lengthMeters,
//     ));
//
//     final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (index != -1) {
//       buildings[index] = buildings[index].copyWith(walkways: List<Walkway>.from(currentWalkways));
//     }
//     if (hasPanels.value) calculateAndShowPanels();
//   }
//
//   void startEditingWalkway(int index) {
//     if (index < 0 || index >= currentWalkways.length) return;
//     if (!isEditingTerraceLayout.value) {
//       startEditingTerrace();
//     }
//     selectedWalkwayIndex.value = index;
//     editingWalkwayIndex.value = index;
//     isEditingWalkway.value = true;
//   }
//
//   void stopEditingWalkway() {
//     isEditingWalkway.value = false;
//     selectedWalkwayIndex.value = -1;
//     editingWalkwayIndex.value = -1;
//     isAddingWalkway.value = false;
//   }
//
//   void updateWalkwayPoints(int index, List<LatLng> newPoints) {
//     if (index < 0 || index >= currentWalkways.length) return;
//     final walkway = currentWalkways[index];
//     final bounds = getPolygonBounds(newPoints);
//     double newLength;
//     if (walkway.isHorizontal) {
//       newLength = (bounds.northeast.longitude - bounds.southwest.longitude) *
//           111111 *
//           cos(bounds.southwest.latitude * pi / 180);
//     } else {
//       newLength = (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
//     }
//     final updatedWalkway = walkway.copyWith(points: newPoints, length: newLength);
//     currentWalkways[index] = updatedWalkway;
//     final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (buildingIndex != -1) {
//       buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
//     }
//     if (hasPanels.value) calculateAndShowPanels();
//     update();
//   }
//
//   void toggleWalkwayOrientation(int index) {
//     if (index < 0 || index >= currentWalkways.length) return;
//     final walkway = currentWalkways[index];
//     final newOrientation = !walkway.isHorizontal;
//
//     LatLngBounds bounds;
//     bool hasStructure = currentBuilding!.panels.isNotEmpty;
//     if (hasStructure) {
//       bounds = _getStructureBounds()!;
//     } else {
//       bounds = getPolygonBounds(currentBuilding!.terracePoints);
//     }
//
//     final double widthMeters = walkway.width;
//     List<LatLng> newPoints;
//     if (newOrientation) {
//       final double centerLat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
//       final double halfHeightDeg = widthMeters / 111111.0 / 2;
//       final double topLat = centerLat + halfHeightDeg;
//       final double bottomLat = centerLat - halfHeightDeg;
//       final double lengthMeters = (bounds.northeast.longitude - bounds.southwest.longitude) *
//           111111 *
//           cos(centerLat * pi / 180);
//       newPoints = [
//         LatLng(bottomLat, bounds.southwest.longitude),
//         LatLng(bottomLat, bounds.northeast.longitude),
//         LatLng(topLat, bounds.northeast.longitude),
//         LatLng(topLat, bounds.southwest.longitude),
//       ];
//       final updatedWalkway = walkway.copyWith(
//         isHorizontal: true,
//         points: newPoints,
//         length: lengthMeters,
//         maxLength: lengthMeters,
//       );
//       currentWalkways[index] = updatedWalkway;
//     } else {
//       final double centerLng = (bounds.northeast.longitude + bounds.southwest.longitude) / 2;
//       final double halfWidthDeg = widthMeters / (111111.0 * cos(centerLng * pi / 180)) / 2;
//       final double leftLng = centerLng - halfWidthDeg;
//       final double rightLng = centerLng + halfWidthDeg;
//       final double lengthMeters = (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
//       newPoints = [
//         LatLng(bounds.southwest.latitude, leftLng),
//         LatLng(bounds.southwest.latitude, rightLng),
//         LatLng(bounds.northeast.latitude, rightLng),
//         LatLng(bounds.northeast.latitude, leftLng),
//       ];
//       final updatedWalkway = walkway.copyWith(
//         isHorizontal: false,
//         points: newPoints,
//         length: lengthMeters,
//         maxLength: lengthMeters,
//       );
//       currentWalkways[index] = updatedWalkway;
//     }
//
//     final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (buildingIndex != -1) {
//       buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
//     }
//     if (hasPanels.value) calculateAndShowPanels();
//     update();
//   }
//
//   void removeWalkway(int index) {
//     if (index < 0 || index >= currentWalkways.length) return;
//     currentWalkways.removeAt(index);
//     final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
//     if (buildingIndex != -1) {
//       buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
//     }
//     if (currentWalkways.isEmpty) stopEditingWalkway();
//     else if (selectedWalkwayIndex.value >= currentWalkways.length) {
//       selectedWalkwayIndex.value = currentWalkways.length - 1;
//       editingWalkwayIndex.value = selectedWalkwayIndex.value;
//     }
//     if (hasPanels.value) calculateAndShowPanels();
//     update();
//   }
//
//   LatLng getCenter(List<LatLng> points) {
//     double lat = 0, lng = 0;
//     for (final p in points) {
//       lat += p.latitude;
//       lng += p.longitude;
//     }
//     return LatLng(lat / points.length, lng / points.length);
//   }
//
//   LatLng getWalkwayEndPoint(Walkway walkway) {
//     if (walkway.points.isEmpty) return const LatLng(0, 0);
//     if (walkway.isHorizontal) {
//       final p1 = walkway.points[1];
//       final p2 = walkway.points[2];
//       return LatLng((p1.latitude + p2.latitude) / 2, (p1.longitude + p2.longitude) / 2);
//     } else {
//       final p1 = walkway.points[0];
//       final p2 = walkway.points[1];
//       return LatLng((p1.latitude + p2.latitude) / 2, (p1.longitude + p2.longitude) / 2);
//     }
//   }
//
//   void dragWalkway(int index, LatLng newPosition) {
//     if (index < 0 || index >= currentWalkways.length) return;
//     final walkway = currentWalkways[index];
//     final endPoint = getWalkwayEndPoint(walkway);
//     final translation = LatLng(
//       newPosition.latitude - endPoint.latitude,
//       newPosition.longitude - endPoint.longitude,
//     );
//     final newPoints = walkway.points
//         .map((p) => LatLng(p.latitude + translation.latitude, p.longitude + translation.longitude))
//         .toList();
//     updateWalkwayPoints(index, newPoints);
//   }
//
//   // ========== UTILITY METHODS ==========
//
//   Future<void> updatePolygon({bool forceUpdate = false}) async {
//     if (!forceUpdate && polygonPoints.length < 2) return;
//     distanceMarkers.clear();
//     final List<LatLng> cleanPoints = List<LatLng>.from(polygonPoints);
//     if (cleanPoints.length >= 3 && cleanPoints.first == cleanPoints.last) cleanPoints.removeLast();
//     for (int i = 0; i < cleanPoints.length; i++) {
//       final nextIndex = (i + 1) % cleanPoints.length;
//       final distance = calculateDistance(cleanPoints[i], cleanPoints[nextIndex]);
//       final converted = showInMeters.value ? distance : distance * 3.28084;
//       final textMarker = await createTextMarker('${converted.toStringAsFixed(1)}${showInMeters.value ? 'm' : 'ft'}');
//       final midpoint = LatLng(
//         (cleanPoints[i].latitude + cleanPoints[nextIndex].latitude) / 2,
//         (cleanPoints[i].longitude + cleanPoints[nextIndex].longitude) / 2,
//       );
//       distanceMarkers.add(Marker(
//         markerId: MarkerId('distance_$i'),
//         position: midpoint,
//         icon: textMarker,
//         anchor: const Offset(0.5, 0.5),
//       ));
//     }
//     if (cleanPoints.length >= 3) {
//       final closed = List<LatLng>.from(cleanPoints)..add(cleanPoints[0]);
//       polygonArea.value = calculatePolygonArea(closed);
//     } else {
//       polygonArea.value = 0.0;
//     }
//   }
//
//   double calculateDistance(LatLng start, LatLng end) {
//     final lat1 = start.latitude * pi / 180;
//     final lon1 = start.longitude * pi / 180;
//     final lat2 = end.latitude * pi / 180;
//     final lon2 = end.longitude * pi / 180;
//     final dLat = lat2 - lat1;
//     final dLon = lon2 - lon1;
//     final a = sin(dLat / 2) * sin(dLat / 2) +
//         cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
//     final c = 2 * atan2(sqrt(a), sqrt(1 - a));
//     return earthRadius * c;
//   }
//
//   double calculatePolygonArea(List<LatLng> points) {
//     if (points.length < 3) return 0.0;
//     double area = 0.0;
//     for (int i = 0; i < points.length; i++) {
//       final p1 = points[i];
//       final p2 = points[(i + 1) % points.length];
//       area += toRadians(p2.longitude - p1.longitude) *
//           (2 + sin(toRadians(p1.latitude)) + sin(toRadians(p2.latitude)));
//     }
//     return (area * 6378137 * 6378137 / 2).abs();
//   }
//
//   double toRadians(double degree) => degree * pi / 180;
//
//   LatLngBounds getPolygonBounds(List<LatLng> points) {
//     if (points.isEmpty) return LatLngBounds(southwest: const LatLng(0, 0), northeast: const LatLng(0, 0));
//     double minLat = points[0].latitude, maxLat = points[0].latitude;
//     double minLng = points[0].longitude, maxLng = points[0].longitude;
//     for (final p in points) {
//       minLat = min(minLat, p.latitude);
//       maxLat = max(maxLat, p.latitude);
//       minLng = min(minLng, p.longitude);
//       maxLng = max(maxLng, p.longitude);
//     }
//     return LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng));
//   }
//
//   void clearPolygon() {
//     polygonPoints.clear();
//     polygonArea.value = 0.0;
//     distanceMarkers.clear();
//     solarPanelsPolygons.clear();
//     currentWalkways.clear();
//   }
//
//   Future<BitmapDescriptor> createTextMarker(String text) async {
//     final recorder = ui.PictureRecorder();
//     final canvas = Canvas(recorder);
//     final textPainter = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           backgroundColor: Colors.black54,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     textPainter.paint(canvas, Offset.zero);
//     final image = await recorder.endRecording()
//         .toImage(textPainter.width.ceil(), textPainter.height.ceil());
//     final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//     return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
//   }
//
//   void toggleBuildingSelection(String buildingId) {
//     if (selectedBuildingId.value == buildingId) selectedBuildingId.value = '';
//     else selectBuilding(buildingId);
//   }
//
//   void startDrawingHandRail() {
//     isDrawingHandRail.value = true;
//     isHandRailComplete.value = false;
//     update();
//   }
//
//   void toggleBorderSelection(int index) {}
//
//   void finishDrawingHandRail() {
//     isDrawingHandRail.value = false;
//     isHandRailComplete.value = true;
//     update();
//   }
//
//   bool isPointNearBorder(LatLng tapPoint, LatLng lineStart, LatLng lineEnd) {
//     const double threshold = 0.00005;
//     if (lineStart == lineEnd) return false;
//     final lineLength = calculateDistance(lineStart, lineEnd);
//     final distance = ((lineEnd.latitude - lineStart.latitude) *
//         (tapPoint.longitude - lineStart.longitude) -
//         (lineEnd.longitude - lineStart.longitude) *
//             (tapPoint.latitude - lineStart.latitude))
//         .abs() /
//         lineLength;
//     return distance < threshold;
//   }
//
//   double calculateHandRailLength(List<LatLng> handRailPoints) {
//     if (handRailPoints.isEmpty || handRailPoints.length % 2 != 0) return 0.0;
//     double total = 0.0;
//     for (int i = 0; i < handRailPoints.length; i += 2) {
//       if (i + 1 < handRailPoints.length)
//         total += calculateDistance(handRailPoints[i], handRailPoints[i + 1]);
//     }
//     return total;
//   }
//
//   // api calls
//      Future<void> getTerraceType() async {
//     isLoading.value = true;
//     http.Response response = await _apiService.getTerraceType();
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       print('data $data');
//       terraceTypesList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
//
//       print('terraceTypesList $terraceTypesList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//
//   Future<void> getStructureType() async {
//     isLoading.value = true;
//     http.Response response = await _apiService.getStructureType();
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       print('data $data');
//       structureTypeList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
//
//       print('structureTypeList $structureTypeList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//
//
//   Future<void> getInverterPositions() async {
//     isLoading.value = true;
//     http.Response response = await _apiService.getInverterPositions();
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       print('data $data');
//       inverterPositionList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
//
//       print('inverterPositionList $inverterPositionList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//
//
//
//
//   Future<void> getCategory() async {
//
//     isLoading.value = true;
//     http.Response response = await _apiService.getCategory();
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       print('data $data');
//       categoryList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('categoryList.value $categoryList.value');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//
//     isLoading.value = false;
//   }
//
//
//   Future<void> getSubCategory() async {
//     isLoading.value = true;
//     http.Response response = await _apiService.getSubCategory(selectedCategoryId.value);
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       subCategoryList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('categoryList.value $categoryList.value');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//
//     isLoading.value = false;
//   }
//
//
//   Future<void> getProjectTypes() async {
//     isLoading.value = true;
//     http.Response response = await _apiService.getProjectTypes(selectedSubCategoryId.value);
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       projectTypeList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('projectTypeList $projectTypeList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//   Future<void> getSubProjectTypes() async {
//
//     isLoading.value = true;
//     http.Response response = await _apiService.getSubProjectTypes(selectedProjectTypeId.value);
//
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       subprojectTypeList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('subprojectTypeList $subprojectTypeList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//
//
//   Future<void> getSolarBrands() async {
//     isLoading.value = true;
//
//     http.Response response = await _apiService.getSolarBrands();
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       brandList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('brandList $brandList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//
//     isLoading.value = false;
//
//   }
//
//
//   Future<void> getTechnology() async {
//     isLoading.value = true;
//
//     http.Response response = await _apiService.getTechnology();
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       technologyList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('technologyList.value $technologyList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//
//     isLoading.value = false;
//
//   }
//
//   Future<void> getSolarPanelWatt() async {
//     isLoading.value = true;
//
//     http.Response response = await _apiService.getSolarPanelWatt();
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       panelWattList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('panelWattList.value $panelWattList');
//     } else {
//       showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//   Future<void> getNoOfPanels() async {
//     isLoading.value = true;
//
//     http.Response response = await _apiService.getNoOfPanels(selectedCategory: selectedCategoryId.value, selectedSubCategory: selectedSubCategoryId.value, selectedProjectType: selectedProjectTypeId.value, brandId: selectedBrand.value, selectedTechnology: selectedTechnologyId.value, selectedPanelWatt: selectedPanelWattId.value);
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data']['availableSolarPanelNumbers'];
//       noOfPanelList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('noOfPanelList.value $noOfPanelList');
//     } else {
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//   Future<void> getKilowatt() async {
//     isLoading.value = true;
//
//     http.Response response = await _apiService.getKilowatt(selectedPanelWattId.value,selectedNoOfPanels.value);
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       kilowattList.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('kilowattList.value $kilowattList');
//     } else {
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//   Future<void> getBuildingType() async {
//     isLoading.value = true;
//
//     http.Response response = await _apiService.getBuildingtype();
//     final Map<String, dynamic> jsonResponse = json.decode(response.body);
//     if (jsonResponse['success'] == true) {
//       List<dynamic> data = jsonResponse['data'];
//       buildingTypes.value = data
//           .map((item) => CommonItemModel.fromJson(item))
//           .toList();
//       print('buildingTypes.value $buildingTypes');
//     } else {
//       print('API error: ${jsonResponse['message']}');
//     }
//     isLoading.value = false;
//
//   }
//
//
// }





import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../custome_snackbar.dart';
import '../models/comanItem_model.dart';
import '../screens/all_quotes/add_surveyQuotation.dart';
import '../sevices/api_services.dart';

class Walkway {
  String id;
  String name;
  List<LatLng> points;
  bool isHorizontal;
  double width;
  double length;
  double maxLength;
  double rotationAngle;

  Walkway({
    required this.id,
    required this.points,
    this.isHorizontal = true,
    this.width = 0.5,
    this.length = 3.0,
    required this.maxLength,
    this.rotationAngle = 0,
    required this.name,
  });

  Polygon toPolygon() => Polygon(
    polygonId: PolygonId(id),
    points: points,
    strokeWidth: 1,
    strokeColor: Colors.deepOrange,
    fillColor: Colors.deepOrange.withOpacity(0.5),
  );

  Walkway copyWith({
    List<LatLng>? points,
    bool? isHorizontal,
    double? width,
    double? length,
    double? maxLength,
    String? name,
  }) {
    return Walkway(
      id: id,
      points: points ?? this.points,
      isHorizontal: isHorizontal ?? this.isHorizontal,
      width: width ?? this.width,
      length: length ?? this.length,
      maxLength: maxLength ?? this.maxLength,
      name: name ?? this.name,
    );
  }
}

class Building {
  String id;
  String name;
  String projectType;
  String customerName;
  String customerMobile;
  List<LatLng> terracePoints;
  List<LatLng> panels;
  List<Walkway> walkways;
  bool isHorizontal;
  bool isAlternate;
  double padding;
  double rowSpacing;
  int selectedPanelCount;
  int selectedRows;
  double totalKw;
  String terraceType;
  int frontLegHeight;
  int backLegHeight;
  String mountingStyle;
  double paneltotalWidth;
  double paneltotalHeight;
  int f6040;
  int f4040;
  int lAngle_qty;
  int americanBolt_qty;
  int zink_qty;
  int jBolt_qty;
  int foundation_qty;
  int dcWire_meter;
  int acWire_meter;
  int extraPipes;
  double totalKg;
  bool isMeterOrFeet;
  String inverterPosition;
  String structureType;
  bool isSaved;
  String selectedProjectType;
  String selectedTechnology;
  String selectedPanelWatt;
  String selectedKilowatt;

  Building({
    required this.id,
    required this.name,
    this.projectType = '',
    this.customerName = "",
    this.customerMobile = "",
    this.terracePoints = const [],
    this.panels = const [],
    this.walkways = const [],
    this.isHorizontal = true,
    this.isAlternate = false,
    this.padding = 0,
    this.rowSpacing = 0,
    this.selectedPanelCount = 0,
    this.selectedRows = 1,
    this.totalKw = 0,
    this.terraceType = "Rcc Roof",
    this.frontLegHeight = 0,
    this.backLegHeight = 0,
    this.mountingStyle = "Legs On Terrace",
    this.paneltotalWidth = 0,
    this.paneltotalHeight = 0,
    this.f6040 = 0,
    this.f4040 = 0,
    this.lAngle_qty = 0,
    this.americanBolt_qty = 0,
    this.zink_qty = 0,
    this.jBolt_qty = 0,
    this.foundation_qty = 0,
    this.dcWire_meter = 0,
    this.acWire_meter = 0,
    this.extraPipes = 0,
    this.totalKg = 0,
    this.isMeterOrFeet = true,
    this.inverterPosition = "Ground Floor",
    this.structureType = "Hot dig Gi(Galvanised iron)",
    this.isSaved = false,
    this.selectedProjectType = "",
    this.selectedTechnology = "",
    this.selectedPanelWatt = "545",
    this.selectedKilowatt = "",
  });

  Building copyWith({
    String? id,
    String? name,
    String? projectType,
    String? customerName,
    String? customerMobile,
    List<LatLng>? terracePoints,
    List<LatLng>? panels,
    List<Walkway>? walkways,
    bool? isHorizontal,
    bool? isAlternate,
    double? padding,
    double? rowSpacing,
    int? selectedPanelCount,
    int? selectedRows,
    double? totalKw,
    String? terraceType,
    int? frontLegHeight,
    int? backLegHeight,
    String? mountingStyle,
    double? paneltotalWidth,
    double? paneltotalHeight,
    int? f6040,
    int? f4040,
    int? lAngle_qty,
    int? americanBolt_qty,
    int? zink_qty,
    int? jBolt_qty,
    int? foundation_qty,
    int? dcWire_meter,
    int? acWire_meter,
    int? extraPipes,
    double? totalKg,
    bool? isMeterOrFeet,
    String? inverterPosition,
    String? structureType,
    bool? isSaved,
    String? selectedProjectType,
    String? selectedTechnology,
    String? selectedPanelWatt,
    String? selectedKilowatt,
  }) {
    return Building(
      id: id ?? this.id,
      name: name ?? this.name,
      projectType: projectType ?? this.projectType,
      customerName: customerName ?? this.customerName,
      customerMobile: customerMobile ?? this.customerMobile,
      terracePoints: terracePoints ?? this.terracePoints,
      panels: panels ?? this.panels,
      walkways: walkways ?? this.walkways,
      isHorizontal: isHorizontal ?? this.isHorizontal,
      isAlternate: isAlternate ?? this.isAlternate,
      padding: padding ?? this.padding,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      selectedPanelCount: selectedPanelCount ?? this.selectedPanelCount,
      selectedRows: selectedRows ?? this.selectedRows,
      totalKw: totalKw ?? this.totalKw,
      terraceType: terraceType ?? this.terraceType,
      frontLegHeight: frontLegHeight ?? this.frontLegHeight,
      backLegHeight: backLegHeight ?? this.backLegHeight,
      mountingStyle: mountingStyle ?? this.mountingStyle,
      paneltotalWidth: paneltotalWidth ?? this.paneltotalWidth,
      paneltotalHeight: paneltotalHeight ?? this.paneltotalHeight,
      f6040: f6040 ?? this.f6040,
      f4040: f4040 ?? this.f4040,
      lAngle_qty: lAngle_qty ?? this.lAngle_qty,
      americanBolt_qty: americanBolt_qty ?? this.americanBolt_qty,
      zink_qty: zink_qty ?? this.zink_qty,
      jBolt_qty: jBolt_qty ?? this.jBolt_qty,
      foundation_qty: foundation_qty ?? this.foundation_qty,
      dcWire_meter: dcWire_meter ?? this.dcWire_meter,
      acWire_meter: acWire_meter ?? this.acWire_meter,
      extraPipes: extraPipes ?? this.extraPipes,
      totalKg: totalKg ?? this.totalKg,
      isMeterOrFeet: isMeterOrFeet ?? this.isMeterOrFeet,
      inverterPosition: inverterPosition ?? this.inverterPosition,
      structureType: structureType ?? this.structureType,
      isSaved: isSaved ?? this.isSaved,
      selectedProjectType: selectedProjectType ?? this.selectedProjectType,
      selectedTechnology: selectedTechnology ?? this.selectedTechnology,
      selectedPanelWatt: selectedPanelWatt ?? this.selectedPanelWatt,
      selectedKilowatt: selectedKilowatt ?? this.selectedKilowatt,
    );
  }
}

class UnifiedSurveyController extends GetxController {
  final ApiService _apiService = ApiService();

  var terraceTypesList = <CommonItemModel>[].obs;
  RxString selectedTerraceTypeId = ''.obs;

  var structureTypeList = <CommonItemModel>[].obs;
  RxString selectedStructureTypeId = ''.obs;

  var inverterPositionList = <CommonItemModel>[].obs;
  RxString selectedInverterPositionId = ''.obs;

  var distictList = <CommonItemModel>[].obs;
  RxString selectedDistrict = ''.obs;

  var categoryList = <CommonItemModel>[].obs;
  RxString selectedCategoryId = ''.obs;

  var subCategoryList = <CommonItemModel>[].obs;
  RxString selectedSubCategoryId = ''.obs;

  var projectTypeList = <CommonItemModel>[].obs;
  RxString selectedProjectTypeId = ''.obs;
  RxString selectedProjectType = ''.obs;

  var subprojectTypeList = <CommonItemModel>[].obs;
  RxString selectedSubprojectTypeId = ''.obs;

  var brandList = <CommonItemModel>[].obs;
  RxString selectedBrand = ''.obs;

  var technologyList = <CommonItemModel>[].obs;
  RxString selectedTechnologyId = ''.obs;

  var panelWattList = <CommonItemModel>[].obs;
  RxString selectedPanelWattId = ''.obs;
  RxString selectedPanelWatt = ''.obs;

  var noOfPanelList = <CommonItemModel>[].obs;
  RxString selectedNoOfPanels = ''.obs;

  var kilowattList = <CommonItemModel>[].obs;
  RxString selectedKilowattId = ''.obs;
  RxString selectedKilowatt = ''.obs;

  var buildingTypes = <CommonItemModel>[].obs;
  RxString selectedBuildingType = ''.obs;

  // Reactive variables
  var polygonPoints = <LatLng>[].obs;
  var polygonArea = 0.0.obs;
  var distanceMarkers = <Marker>{}.obs;
  var isSelectingArea = false.obs;
  var isEditingTerrace = false.obs;
  var isEditingTerraceLayout = false.obs;
  var showStreetView = false.obs;
  var pickedLocation = LatLng(22.260076, 70.787970).obs;
  var showInMeters = true.obs;
  var boundaryIcon = BitmapDescriptor.defaultMarker.obs;
  var walkWayIcon = BitmapDescriptor.defaultMarker.obs;
  var panelDragIcon = BitmapDescriptor.defaultMarker.obs;

  var currentMode = 1.obs;
  var isDrawingTerrace = false.obs;
  var hasTerrace = false.obs;
  var hasPanels = false.obs;
  var isSaved = false.obs;
  var isLoading = false.obs;
  var isDraggingPanels = false.obs;
  var editingTerraceIndex = (-1).obs;

  // Panel edit controls
  var paddingValue = 0.0.obs;
  var rowSpacingValue = 0.0.obs;
  var availableRowsForEdit = <int>[].obs;
  var groupRowsForSpace = 1.obs;
  var groupRowsForKW = 1.obs;

  // Walkway edit state
  var isEditingWalkway = false.obs;
  var selectedWalkwayIndex = (-1).obs;
  var isAddingWalkway = false.obs;

  var dragHandlePosition = LatLng(0, 0).obs;
  var originalPanelCenters = <LatLng>[].obs;
  LatLng? dragStartPoint;

  var buildings = <Building>[].obs;
  var selectedBuildingId = "".obs;

  Building? get currentBuilding {
    if (selectedBuildingId.isEmpty) return null;
    try {
      return buildings.firstWhere((b) => b.id == selectedBuildingId.value);
    } catch (e) {
      return null;
    }
  }

  var selectedPanelCount = 0.obs;
  var selectedRows = 1.obs;
  var availableRows = <int>[].obs;
  var isHorizontal = true.obs;
  var terraceType = "Rcc Roof".obs;
  var frontLegHeight = 0.obs;
  var backLegHeight = 0.obs;
  var isMeterOrFeet = true.obs;
  var inverterPosition = "Ground Floor".obs;
  var structureType = "Hot dig Gi(Galvanised iron)".obs;
  var totalPanelWidth = 0.0.obs;
  var totalPanelHeight = 0.0.obs;

  final List<String> projectTypes = ["Residential", "Commercial", "Industrial"];
  final List<String> technologies = ["Bifacial", "Topcon", "Mono Perc"];
  final List<String> panelWatts = ["540", "545", "550", "555", "560", "565", "570", "575"];
  final List<String> kilowattOptions = ["2.27", "3.24", "4.20", "5.25", "6.30", "7.35", "8.40", "9.45", "10.50"];
  final List<String> terraceTypes = ["Rcc Roof", "Slant Roof", "Ground Mountain"];
  final List<String> structureTypes = ["Hot dig Gi(Galvanised iron)", "Aluminium", "GI Structure"];
  final List<String> inverterPositions = ["Ground Floor", "Sidi Room", "Terrace", "Roof Top"];

  GoogleMapController? mapController;
  final double earthRadius = 6371000;

  RxList<Walkway> currentWalkways = <Walkway>[].obs;
  RxInt editingWalkwayIndex = (-1).obs;
  RxString selectedWalkwayWidth = "270".obs;
  RxList<LatLng> currentHandRailPoints = <LatLng>[].obs;
  RxBool isDrawingHandRail = false.obs;
  RxBool isHandRailComplete = false.obs;
  final RxSet<Polygon> solarPanelsPolygons = <Polygon>{}.obs;
  String userId = '';

  @override
  void onInit() {
    super.onInit();
    loadIcons();

    getId();
  }


  Future<void> getId()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    userId = sp.getString('uniqueId') ?? '';
    print('userId = $userId');
    getDistrict();
    getTerraceType();
    getStructureType();
    getInverterPositions();
    getCategory();
    getBuildingType();

  }


  Future<void> loadIcons() async {
    boundaryIcon.value = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(22, 22)),
      "assets/images/bcircle3.png",
    );
    walkWayIcon.value = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(10, 10)),
      "assets/images/wcircle.png",
    );
    panelDragIcon.value = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(22, 22)),
      "assets/images/panelDragHandle.png",
    );
  }

  bool isPolygonValid(List<LatLng> points) {
    if (points.length < 3) return true;
    for (int i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];
      for (int j = i + 2; j < points.length; j++) {
        final p3 = points[j];
        final p4 = points[(j + 1) % points.length];
        if (i == j || (i + 1) % points.length == j || (j + 1) % points.length == i) continue;
        if (_lineSegmentsIntersect(p1, p2, p3, p4)) return false;
      }
    }
    return true;
  }

  bool _lineSegmentsIntersect(LatLng p1, LatLng p2, LatLng p3, LatLng p4) {
    double orientation(LatLng a, LatLng b, LatLng c) {
      double val = (b.latitude - a.latitude) * (c.longitude - b.longitude) -
          (b.longitude - a.longitude) * (c.latitude - b.latitude);
      if (val.abs() < 1e-10) return 0;
      return val.sign;
    }
    double o1 = orientation(p1, p2, p3);
    double o2 = orientation(p1, p2, p4);
    double o3 = orientation(p3, p4, p1);
    double o4 = orientation(p3, p4, p2);
    if (o1 != o2 && o3 != o4) return true;
    if (o1 == 0 && _onSegment(p1, p3, p2)) return true;
    if (o2 == 0 && _onSegment(p1, p4, p2)) return true;
    if (o3 == 0 && _onSegment(p3, p1, p4)) return true;
    if (o4 == 0 && _onSegment(p3, p2, p4)) return true;
    return false;
  }

  bool _onSegment(LatLng p, LatLng q, LatLng r) {
    return q.latitude <= max(p.latitude, r.latitude) &&
        q.latitude >= min(p.latitude, r.latitude) &&
        q.longitude <= max(p.longitude, r.longitude) &&
        q.longitude >= min(p.longitude, r.longitude);
  }

  void createNewBuilding(String name, String customerName, String customerMobile, String projectType) {
    final newBuilding = Building(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      customerName: customerName,
      customerMobile: customerMobile,
      projectType: projectType,
    );
    buildings.add(newBuilding);
    selectedBuildingId.value = newBuilding.id;
    isSelectingArea.value = true;
    isDrawingTerrace.value = true;
    hasTerrace.value = false;
    hasPanels.value = false;
    isSaved.value = false;
    isEditingTerraceLayout.value = false;
    clearTerrace();
  }

  void clearTerrace() {
    polygonPoints.clear();
    polygonArea.value = 0.0;
    distanceMarkers.clear();
    solarPanelsPolygons.clear();
    currentWalkways.clear();
    currentHandRailPoints.clear();
    isDrawingHandRail.value = false;
    isHandRailComplete.value = false;
  }

  void addPolygonPoint(LatLng point) {
    if (isSelectingArea.value && isDrawingTerrace.value) {
      polygonPoints.add(point);
      updatePolygon();
    }
  }

  void undoLastPoint() {
    if (polygonPoints.isNotEmpty) {
      polygonPoints.removeLast();
      updatePolygon();
    }
  }

  void updatePolygonPoint(int index, LatLng newPosition) {
    if (index >= 0 && index < polygonPoints.length) {
      polygonPoints[index] = newPosition;
      updatePolygon(forceUpdate: true);
    }
  }

  void removePolygonPoint(int index) {
    if (index >= 0 && index < polygonPoints.length) {
      polygonPoints.removeAt(index);
      updatePolygon();
    }
  }

  void startEditingTerrace() {
    if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty) {
      polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
      isSelectingArea.value = true;
      isEditingTerrace.value = true;
      isDrawingTerrace.value = false;
      editingTerraceIndex.value = 0;
      isEditingTerraceLayout.value = true;
      selectedRows.value = currentBuilding!.selectedRows;
      isHorizontal.value = currentBuilding!.isHorizontal;
      paddingValue.value = currentBuilding!.padding;
      rowSpacingValue.value = currentBuilding!.rowSpacing;
      groupRowsForKW.value = currentBuilding!.rowSpacing > 0 ? 1 : 1;
      updateAvailableRowsForEdit();
      if (currentWalkways.isNotEmpty) {
        selectedWalkwayIndex.value = 0;
        editingWalkwayIndex.value = 0;
        isEditingWalkway.value = true;
      } else {
        stopEditingWalkway();
      }
    }
  }

  bool saveEditedTerrace() {
    if (polygonPoints.length < 3) return false;
    if (!isPolygonValid(polygonPoints)) return false;
    if (currentBuilding != null) {
      final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
      if (index != -1) {
        buildings[index] = buildings[index].copyWith(
          terracePoints: List<LatLng>.from(polygonPoints),
          isSaved: false,
        );
      }
    }
    isSelectingArea.value = false;
    isEditingTerrace.value = false;
    hasTerrace.value = true;
    editingTerraceIndex.value = -1;
    isEditingTerraceLayout.value = false;
    stopEditingWalkway();
    if (hasPanels.value) calculateAndShowPanels();
    return true;
  }

  void cancelEditingTerrace() {
    if (currentBuilding != null) {
      polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
    }
    isSelectingArea.value = false;
    isEditingTerrace.value = false;
    editingTerraceIndex.value = -1;
    isEditingTerraceLayout.value = false;
    stopEditingWalkway();
    updatePolygon();
  }

  bool completeTerraceDrawing() {
    if (polygonPoints.length < 3) return false;
    if (!isPolygonValid(polygonPoints)) return false;
    isSelectingArea.value = false;
    isDrawingTerrace.value = false;
    hasTerrace.value = true;
    if (currentBuilding != null) {
      final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
      if (index != -1) {
        buildings[index] = buildings[index].copyWith(
          terracePoints: List<LatLng>.from(polygonPoints),
        );
      }
    }
    editingTerraceIndex.value = 0;
    return true;
  }

  void saveStructureDetails({
    required String terraceTypeVal,
    required String structureTypeVal,
    required String inverterPositionVal,
    required bool isMeterOrFeetVal,
    required int frontLegHeightVal,
    required int backLegHeightVal,
  }) {
    terraceType.value = terraceTypeVal;
    structureType.value = structureTypeVal;
    inverterPosition.value = inverterPositionVal;
    isMeterOrFeet.value = isMeterOrFeetVal;
    frontLegHeight.value = frontLegHeightVal;
    backLegHeight.value = backLegHeightVal;
    if (currentBuilding != null) {
      final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
      if (index != -1) {
        buildings[index] = buildings[index].copyWith(
          terraceType: terraceTypeVal,
          structureType: structureTypeVal,
          inverterPosition: inverterPositionVal,
          isMeterOrFeet: isMeterOrFeetVal,
          frontLegHeight: frontLegHeightVal,
          backLegHeight: backLegHeightVal,
        );
      }
    }
  }

  void savePanelConfiguration({
    required String projectType,
    required String technology,
    required String panelWatt,
    required String kilowatt,
    required int panelCount,
  }) {
    selectedProjectTypeId.value = projectType;
    selectedTechnologyId.value = technology;
    selectedPanelWatt.value = panelWatt;
    selectedKilowatt.value = kilowatt;
    selectedPanelCount.value = panelCount;
    selectedRows.value = 1;
    isHorizontal.value = true;
    if (currentBuilding != null) {
      final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
      if (index != -1) {
        buildings[index] = buildings[index].copyWith(
          selectedProjectType: projectType,
          selectedTechnology: technology,
          selectedPanelWatt: panelWatt,
          selectedKilowatt: kilowatt,
          selectedPanelCount: panelCount,
          selectedRows: 1,
          isHorizontal: true,
        );
      }
    }
    calculateAndShowPanels();
  }

  void updateAvailableRows() {
    if (selectedPanelCount.value <= 0 || currentBuilding == null) {
      availableRows.value = [1];
      selectedRows.value = 1;
      return;
    }
    final feasibleRows = <int>[];
    for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
      if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
    }
    availableRows.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
    if (availableRows.isNotEmpty && !availableRows.contains(selectedRows.value)) {
      selectedRows.value = availableRows.first;
    }
  }

  void updateAvailableRowsForEdit() {
    if (selectedPanelCount.value <= 0 || currentBuilding == null) {
      availableRowsForEdit.value = [1];
      selectedRows.value = 1;
      return;
    }
    final feasibleRows = <int>[];
    for (int rows = 1; rows <= selectedPanelCount.value; rows++) {
      if (isRowConfigurationFeasible(rows)) feasibleRows.add(rows);
    }
    availableRowsForEdit.value = feasibleRows.isNotEmpty ? feasibleRows : [1];
    if (availableRowsForEdit.isNotEmpty && !availableRowsForEdit.contains(selectedRows.value)) {
      selectedRows.value = availableRowsForEdit.first;
    }
  }

  bool isRowConfigurationFeasible(int rows) {
    if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return false;
    final bounds = getPolygonBounds(currentBuilding!.terracePoints);
    final center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );
    final columns = (selectedPanelCount.value / rows).ceil();
    const double panelWidth = 1.13, panelHeight = 2.27;
    final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
    final double panelHeightDeg = panelHeight / 111111.0;
    double requiredWidth = isHorizontal.value ? columns * panelHeightDeg : columns * panelWidthDeg;
    double requiredHeight = isHorizontal.value ? rows * panelWidthDeg : rows * panelHeightDeg;
    double availableWidth = (bounds.northeast.longitude - bounds.southwest.longitude).abs();
    double availableHeight = (bounds.northeast.latitude - bounds.southwest.latitude).abs();
    return requiredWidth <= availableWidth && requiredHeight <= availableHeight;
  }

  void calculateAndShowPanels() {
    if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
    List<LatLng> centers;
    if (currentMode.value == 1) {
      centers = calculatePanelCentersWithRows(
        currentBuilding!.terracePoints,
        selectedPanelCount.value,
        selectedRows.value,
        isHorizontal.value,
        paddingValue.value,
        rowSpacingValue.value,
        groupRowsForKW.value,
      );
    } else {
      centers = calculatePanelCentersFull(
        currentBuilding!.terracePoints,
        isHorizontal.value,
        paddingValue.value,
        rowSpacingValue.value,
        groupRowsForSpace.value,
      );
    }
    totalPanelWidth.value = calculatePanelStructureWidth(centers, isHorizontal.value);
    totalPanelHeight.value = calculatePanelStructureHeight(centers, isHorizontal.value);
    final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (index != -1) {
      buildings[index] = buildings[index].copyWith(
        panels: centers,
        selectedPanelCount: selectedPanelCount.value,
        selectedRows: selectedRows.value,
        isHorizontal: isHorizontal.value,
        paneltotalWidth: totalPanelWidth.value,
        paneltotalHeight: totalPanelHeight.value,
        isSaved: false,
        padding: paddingValue.value,
        rowSpacing: rowSpacingValue.value,
      );
    }
    solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
    hasPanels.value = true;
    if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
    double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
    if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
  }

  void updatePanelsFromEditCard() {
    if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
    List<LatLng> centers;
    if (currentMode.value == 1) {
      centers = calculatePanelCentersWithRows(
        currentBuilding!.terracePoints,
        selectedPanelCount.value,
        selectedRows.value,
        isHorizontal.value,
        paddingValue.value,
        rowSpacingValue.value,
        groupRowsForKW.value,
      );
    } else {
      centers = calculatePanelCentersFull(
        currentBuilding!.terracePoints,
        isHorizontal.value,
        paddingValue.value,
        rowSpacingValue.value,
        groupRowsForSpace.value,
      );
    }
    final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (index != -1) {
      buildings[index] = buildings[index].copyWith(
        panels: centers,
        isHorizontal: isHorizontal.value,
        selectedRows: selectedRows.value,
        padding: paddingValue.value,
        rowSpacing: rowSpacingValue.value,
      );
    }
    solarPanelsPolygons.value = convertCentersToPolygons(centers, isHorizontal.value);
    if (centers.isNotEmpty) dragHandlePosition.value = getPanelsCenter(centers);
    double kw = (centers.length * int.parse(selectedPanelWatt.value)) / 1000;
    if (index != -1) buildings[index] = buildings[index].copyWith(totalKw: kw);
  }

  LatLng getPanelsCenter(List<LatLng> panels) {
    if (panels.isEmpty) return pickedLocation.value;
    double sumLat = 0, sumLng = 0;
    for (final panel in panels) {
      sumLat += panel.latitude;
      sumLng += panel.longitude;
    }
    return LatLng(sumLat / panels.length, sumLng / panels.length);
  }

  void moveAllPanels(double latDelta, double lngDelta) {
    if (editingTerraceIndex.value == -1) return;
    if (currentBuilding == null) return;
    final terrace = currentBuilding!;
    final List<LatLng> newCenters = [];
    for (final panel in terrace.panels) {
      final newPos = LatLng(panel.latitude + latDelta, panel.longitude + lngDelta);
      if (!_isPointInPolygon(newPos, terrace.terracePoints)) return;
      newCenters.add(newPos);
    }
    final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (index != -1) {
      buildings[index] = buildings[index].copyWith(panels: newCenters, isSaved: false);
    }
    solarPanelsPolygons.value = convertCentersToPolygons(newCenters, isHorizontal.value);
    if (newCenters.isNotEmpty) dragHandlePosition.value = getPanelsCenter(newCenters);
  }

  double calculatePanelStructureWidth(List<LatLng> panels, bool isHorizontal) {
    if (panels.isEmpty) return 0.0;
    final rows = <double, List<LatLng>>{};
    for (final panel in panels) {
      final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
      rows.putIfAbsent(rowKey, () => []).add(panel);
    }
    int maxPanelsInRow = 0;
    for (final row in rows.values) {
      if (row.length > maxPanelsInRow) maxPanelsInRow = row.length;
    }
    return isHorizontal ? maxPanelsInRow * 2.27 : maxPanelsInRow * 1.13;
  }

  double calculatePanelStructureHeight(List<LatLng> panels, bool isHorizontal) {
    if (panels.isEmpty) return 0.0;
    final rows = <double, List<LatLng>>{};
    for (final panel in panels) {
      final rowKey = double.parse(panel.latitude.toStringAsFixed(6));
      rows.putIfAbsent(rowKey, () => []).add(panel);
    }
    return isHorizontal ? rows.length * 1.13 : rows.length * 2.27;
  }

  // ========== PANEL CALCULATION METHODS ==========

  List<LatLng> calculatePanelCentersWithRows(
      List<LatLng> polygonPoints,
      int panelCount,
      int rows,
      bool isHorizontal,
      double padding,
      double rowSpacing,
      int groupRows,
      ) {
    if (polygonPoints.length < 3 || panelCount <= 0 || rows <= 0) return [];

    final bounds = getPolygonBounds(polygonPoints);
    final center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );

    final double paddingLat = padding / 111111.0;
    final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
    final double paddedSouth = bounds.southwest.latitude + paddingLat;
    final double paddedNorth = bounds.northeast.latitude - paddingLat;
    final double paddedWest = bounds.southwest.longitude + paddingLng;
    final double paddedEast = bounds.northeast.longitude - paddingLng;

    if (paddedSouth >= paddedNorth || paddedWest >= paddedEast) return [];

    final columns = (panelCount / rows).ceil();
    const double panelWidth = 1.13, panelHeight = 2.27;
    final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
    final double panelHeightDeg = panelHeight / 111111.0;

    double lngStep, latStep;
    if (isHorizontal) {
      lngStep = panelHeightDeg;
      latStep = panelWidthDeg;
    } else {
      lngStep = panelWidthDeg;
      latStep = panelHeightDeg;
    }

    final double rowSpacingDeg = rowSpacing / 111111.0;

    // Row tops without spacing
    double fullGridHeight = rows * latStep;
    double startY = paddedNorth - fullGridHeight;
    List<double> rowTops = List.generate(rows, (i) => startY + i * latStep);

    // Apply grouping offsets
    List<double> offsets = List.filled(rows, 0.0);
    for (int i = 0; i < rows; i++) {
      int groupsBefore = (i / groupRows).floor();
      offsets[i] = groupsBefore * rowSpacingDeg;
    }
    for (int i = 0; i < rows; i++) {
      rowTops[i] += offsets[i];
    }

    // Center the block vertically
    double blockTop = rowTops.first;
    double blockBottom = rowTops.last + latStep;
    double blockHeight = blockBottom - blockTop;
    double availableHeight = paddedNorth - paddedSouth;
    double deltaY = paddedSouth + (availableHeight - blockHeight) / 2 - blockTop;
    for (int i = 0; i < rows; i++) {
      rowTops[i] += deltaY;
    }

    // Generate panel centers, skipping those inside any walkway
    List<LatLng> centers = [];
    double rowStartLng = paddedWest + (paddedEast - paddedWest - (columns * lngStep)) / 2;
    int panelsPlaced = 0;

    for (int row = 0; row < rows; row++) {
      int panelsInRow = (row == rows - 1) ? panelCount - (rows - 1) * columns : columns;
      for (int col = 0; col < panelsInRow; col++) {
        double centerLng = rowStartLng + col * lngStep + lngStep / 2;
        double centerLat = rowTops[row] + latStep / 2;
        LatLng panelCenter = LatLng(centerLat, centerLng);

        if (!_isPointInPolygon(panelCenter, polygonPoints)) continue;

        bool insideWalkway = false;
        for (final walkway in currentWalkways) {
          if (_isPointInPolygon(panelCenter, walkway.points)) {
            insideWalkway = true;
            break;
          }
        }
        if (insideWalkway) continue;

        centers.add(panelCenter);
        panelsPlaced++;
      }
    }
    return centers;
  }

  List<LatLng> calculatePanelCentersFull(
      List<LatLng> polygonPoints,
      bool isHorizontal,
      double padding,
      double rowSpacing,
      int groupRows,
      ) {
    if (polygonPoints.length < 3) return [];

    final bounds = getPolygonBounds(polygonPoints);
    final center = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );

    final double paddingLat = padding / 111111.0;
    final double paddingLng = padding / (111111.0 * cos(center.latitude * pi / 180));
    final double startLat = bounds.southwest.latitude + paddingLat;
    final double endLat = bounds.northeast.latitude - paddingLat;
    final double startLng = bounds.southwest.longitude + paddingLng;
    final double endLng = bounds.northeast.longitude - paddingLng;

    if (startLat >= endLat || startLng >= endLng) return [];

    const double panelWidth = 1.13, panelHeight = 2.27;
    final double panelWidthDeg = panelWidth / (111111.0 * cos(center.latitude * pi / 180));
    final double panelHeightDeg = panelHeight / 111111.0;

    int cols, totalRows;
    if (isHorizontal) {
      cols = ((endLng - startLng) / panelHeightDeg).floor();
      totalRows = ((endLat - startLat) / panelWidthDeg).floor();
    } else {
      cols = ((endLng - startLng) / panelWidthDeg).floor();
      totalRows = ((endLat - startLat) / panelHeightDeg).floor();
    }

    if (cols <= 0 || totalRows <= 0) return [];

    final double stepLng = isHorizontal ? panelHeightDeg : panelWidthDeg;
    final double stepLat = isHorizontal ? panelWidthDeg : panelHeightDeg;
    final double rowSpacingDeg = rowSpacing / 111111.0;

    // Row tops without spacing
    double fullGridHeight = totalRows * stepLat;
    double startY = endLat - fullGridHeight;
    List<double> rowTops = List.generate(totalRows, (i) => startY + i * stepLat);

    // Apply grouping offsets
    List<double> offsets = List.filled(totalRows, 0.0);
    for (int i = 0; i < totalRows; i++) {
      int groupsBefore = (i / groupRows).floor();
      offsets[i] = groupsBefore * rowSpacingDeg;
    }
    for (int i = 0; i < totalRows; i++) {
      rowTops[i] += offsets[i];
    }

    // Center the block vertically
    double blockTop = rowTops.first;
    double blockBottom = rowTops.last + stepLat;
    double blockHeight = blockBottom - blockTop;
    double availableHeight = endLat - startLat;
    double deltaY = startLat + (availableHeight - blockHeight) / 2 - blockTop;
    for (int i = 0; i < totalRows; i++) {
      rowTops[i] += deltaY;
    }

    // Generate panel centers, skipping those inside any walkway
    List<LatLng> centers = [];
    double rowStartLng = startLng + (endLng - startLng - (cols * stepLng)) / 2;

    for (int row = 0; row < totalRows; row++) {
      for (int col = 0; col < cols; col++) {
        double centerLng = rowStartLng + col * stepLng + stepLng / 2;
        double centerLat = rowTops[row] + stepLat / 2;
        LatLng panelCenter = LatLng(centerLat, centerLng);

        if (!_isPointInPolygon(panelCenter, polygonPoints)) continue;

        bool insideWalkway = false;
        for (final walkway in currentWalkways) {
          if (_isPointInPolygon(panelCenter, walkway.points)) {
            insideWalkway = true;
            break;
          }
        }
        if (insideWalkway) continue;

        centers.add(panelCenter);
      }
    }
    return centers;
  }

  bool _isPointInPolygon(LatLng point, List<LatLng> polygon) {
    bool inside = false;
    for (int i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
      final xi = polygon[i].latitude, yi = polygon[i].longitude;
      final xj = polygon[j].latitude, yj = polygon[j].longitude;
      final intersect = ((yi > point.longitude) != (yj > point.longitude)) &&
          (point.latitude < (xj - xi) * (point.longitude - yi) / (yj - yi) + xi);
      if (intersect) inside = !inside;
    }
    return inside;
  }

  Set<Polygon> convertCentersToPolygons(List<LatLng> centers, bool isHorizontal) {
    return centers.map((center) => _createPanelPolygon(center, isHorizontal)).toSet();
  }

  Polygon _createPanelPolygon(LatLng center, bool isHorizontal, {int rowIndex = 0}) {
    final panelWidth = isHorizontal ? 2.27 : 1.13;
    final panelHeight = isHorizontal ? 1.13 : 2.27;
    final latDelta = panelHeight / 111111.0 / 2;
    final lngDelta = panelWidth / (111111.0 * cos(center.latitude * pi / 180)) / 2;
    return Polygon(
      polygonId: PolygonId('panel_${center.latitude}_${center.longitude}_$rowIndex'),
      points: [
        LatLng(center.latitude - latDelta, center.longitude - lngDelta),
        LatLng(center.latitude - latDelta, center.longitude + lngDelta),
        LatLng(center.latitude + latDelta, center.longitude + lngDelta),
        LatLng(center.latitude + latDelta, center.longitude - lngDelta),
      ],
      strokeWidth: 1,
      strokeColor: Colors.white,
      fillColor: Colors.blue.withOpacity(0.8),
    );
  }

  void saveTerrace() {
    if (currentBuilding == null) return;
    final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (index != -1) buildings[index] = buildings[index].copyWith(isSaved: true);
    isSaved.value = true;
    isEditingTerraceLayout.value = false;
    stopEditingWalkway();
  }

  void calculateBOM() {
    if (currentBuilding == null) return;
    double paneltotal_width = currentBuilding!.paneltotalWidth;
    double paneltotal_Height = currentBuilding!.paneltotalHeight;
    int nof_Rows = currentBuilding!.selectedRows;
    bool isMeterOrFeet = currentBuilding!.isMeterOrFeet;
    int nofPanels = currentBuilding!.panels.length;
    int nof_FrontLeg = (paneltotal_width / 1.5).round();
    int nof_BackLeg = (paneltotal_Height / 3.048).round();
    if (paneltotal_Height > 3.048) nof_BackLeg += 1;
    int legs;
    if (isMeterOrFeet) {
      double frontLegHeight = currentBuilding!.frontLegHeight / 3.281;
      double backLegHeight = currentBuilding!.backLegHeight / 3.281;
      legs = nof_FrontLeg * (frontLegHeight + backLegHeight).floor();
    } else {
      legs = nof_FrontLeg * (currentBuilding!.frontLegHeight + currentBuilding!.backLegHeight).toInt();
    }
    var rafter = nof_FrontLeg * nof_Rows;
    var perlin = nof_Rows * paneltotal_width * 2;
    double f6040 = (legs + rafter) * 0.8;
    int f6040_2 = f6040.floor();
    int f4040 = (perlin * 0.8).floor();
    var totalKg = (f6040_2 + f4040) * 3.28;
    double qty6040 = ((legs + rafter) * 3.28) / 20;
    int qty6040_1 = qty6040.floor();
    var qty4040 = (perlin * 3.28) / 20;
    int qty4040_1 = qty4040.floor();
    double borderTotalLength = 2 * (paneltotal_width + paneltotal_Height);
    int extraPipes = 0;
    if (isMeterOrFeet) {
      int epipes = (borderTotalLength / 6.096).round();
      extraPipes = currentBuilding!.backLegHeight >= 8 ? epipes : 0;
    } else {
      int epipes = (borderTotalLength / 6.096).round();
      extraPipes = currentBuilding!.backLegHeight >= 2.43 ? epipes : 0;
    }
    int langle_qty = legs * 2;
    int foundation_qty = legs * 2;
    int americanBolt_qty = langle_qty * 2;
    double kw = currentBuilding!.totalKw;
    int zink_qty = kw <= 3 ? 1 : kw <= 6 ? 2 : kw <= 9 ? 3 : kw <= 12 ? 4 : kw <= 15 ? 5 : kw <= 18 ? 6 : kw <= 21 ? 7 : kw <= 24 ? 8 : 9;
    int jBolt_qty = nofPanels * 4;
    int dcWire_qty = 25;
    int acWire_qty = 25;
    final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (index != -1) {
      buildings[index] = buildings[index].copyWith(
        f6040: qty6040_1,
        f4040: qty4040_1,
        totalKg: totalKg,
        lAngle_qty: langle_qty,
        americanBolt_qty: americanBolt_qty,
        zink_qty: zink_qty,
        jBolt_qty: jBolt_qty,
        foundation_qty: foundation_qty,
        dcWire_meter: dcWire_qty,
        acWire_meter: acWire_qty,
        extraPipes: extraPipes,
      );
    }
  }

  void switchMode(int mode) {
    if (currentMode.value == mode) return;
    currentMode.value = mode;
    if (currentBuilding != null && currentBuilding!.terracePoints.isNotEmpty && hasPanels.value) {
      calculateAndShowPanels();
    }
  }

  void deleteBuilding(String buildingId) {
    buildings.removeWhere((b) => b.id == buildingId);
    if (selectedBuildingId.value == buildingId) {
      if (buildings.isNotEmpty) selectBuilding(buildings.first.id);
      else {
        selectedBuildingId.value = "";
        hasTerrace.value = false;
        hasPanels.value = false;
        isSaved.value = false;
        isEditingTerraceLayout.value = false;
        clearTerrace();
        editingTerraceIndex.value = -1;
      }
    }
  }

  void selectBuilding(String buildingId) {
    if (selectedBuildingId.value == buildingId) return;
    selectedBuildingId.value = buildingId;
    if (currentBuilding != null) {
      polygonPoints.value = List<LatLng>.from(currentBuilding!.terracePoints);
      hasTerrace.value = currentBuilding!.terracePoints.isNotEmpty;
      hasPanels.value = currentBuilding!.panels.isNotEmpty;
      isSaved.value = currentBuilding!.isSaved;
      selectedPanelCount.value = currentBuilding!.selectedPanelCount;
      selectedRows.value = currentBuilding!.selectedRows;
      isHorizontal.value = currentBuilding!.isHorizontal;
      terraceType.value = currentBuilding!.terraceType;
      frontLegHeight.value = currentBuilding!.frontLegHeight;
      backLegHeight.value = currentBuilding!.backLegHeight;
      isMeterOrFeet.value = currentBuilding!.isMeterOrFeet;
      selectedProjectTypeId.value = currentBuilding!.selectedProjectType;
      selectedTechnologyId.value = currentBuilding!.selectedTechnology;
      selectedPanelWatt.value = currentBuilding!.selectedPanelWatt;
      selectedKilowattId.value = currentBuilding!.selectedKilowatt;
      paddingValue.value = currentBuilding!.padding;
      rowSpacingValue.value = currentBuilding!.rowSpacing;
      groupRowsForKW.value = currentBuilding!.rowSpacing > 0 ? 1 : 1;
      currentWalkways.value = List<Walkway>.from(currentBuilding!.walkways);
      if (currentBuilding!.panels.isNotEmpty) {
        solarPanelsPolygons.value = convertCentersToPolygons(currentBuilding!.panels, currentBuilding!.isHorizontal);
        dragHandlePosition.value = getPanelsCenter(currentBuilding!.panels);
      } else {
        solarPanelsPolygons.clear();
      }
      updatePolygon();
      editingTerraceIndex.value = hasTerrace.value ? 0 : -1;
    } else {
      clearTerrace();
      editingTerraceIndex.value = -1;
    }
  }

  // ========== WALKWAY METHODS ==========

  LatLngBounds? _getStructureBounds() {
    if (currentBuilding == null || currentBuilding!.panels.isEmpty) return null;
    double minLat = currentBuilding!.panels[0].latitude;
    double maxLat = currentBuilding!.panels[0].latitude;
    double minLng = currentBuilding!.panels[0].longitude;
    double maxLng = currentBuilding!.panels[0].longitude;
    for (final panel in currentBuilding!.panels) {
      minLat = min(minLat, panel.latitude);
      maxLat = max(maxLat, panel.latitude);
      minLng = min(minLng, panel.longitude);
      maxLng = max(maxLng, panel.longitude);
    }
    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  void startAddingWalkway() {
    if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;
    if (!isEditingTerraceLayout.value) {
      startEditingTerrace();
    }
    isAddingWalkway.value = true;
    isEditingWalkway.value = true;
    addWalkway();
    if (currentWalkways.isNotEmpty) {
      selectedWalkwayIndex.value = currentWalkways.length - 1;
      editingWalkwayIndex.value = selectedWalkwayIndex.value;
    }
  }

  void addWalkway() {
    if (currentBuilding == null || currentBuilding!.terracePoints.isEmpty) return;

    LatLngBounds bounds;
    bool hasStructure = currentBuilding!.panels.isNotEmpty;
    if (hasStructure) {
      bounds = _getStructureBounds()!;
    } else {
      bounds = getPolygonBounds(currentBuilding!.terracePoints);
    }

    final double widthMeters = double.parse(selectedWalkwayWidth.value) / 1000;
    final double centerLat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
    final double halfHeightDeg = widthMeters / 111111.0 / 2;
    final double topLat = centerLat + halfHeightDeg;
    final double bottomLat = centerLat - halfHeightDeg;
    final double lengthMeters = (bounds.northeast.longitude - bounds.southwest.longitude) *
        111111 *
        cos(centerLat * pi / 180);

    final List<LatLng> points = [
      LatLng(bottomLat, bounds.southwest.longitude),
      LatLng(bottomLat, bounds.northeast.longitude),
      LatLng(topLat, bounds.northeast.longitude),
      LatLng(topLat, bounds.southwest.longitude),
    ];

    currentWalkways.add(Walkway(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: 'Walkway ${currentWalkways.length + 1}',
      points: points,
      isHorizontal: true,
      width: widthMeters,
      length: lengthMeters,
      maxLength: lengthMeters,
    ));

    final index = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (index != -1) {
      buildings[index] = buildings[index].copyWith(walkways: List<Walkway>.from(currentWalkways));
    }
    if (hasPanels.value) calculateAndShowPanels();
  }

  void startEditingWalkway(int index) {
    if (index < 0 || index >= currentWalkways.length) return;
    if (!isEditingTerraceLayout.value) {
      startEditingTerrace();
    }
    selectedWalkwayIndex.value = index;
    editingWalkwayIndex.value = index;
    isEditingWalkway.value = true;
  }


  void stopEditingWalkway() {
    isEditingWalkway.value = false;
    selectedWalkwayIndex.value = -1;
    editingWalkwayIndex.value = -1;
    isAddingWalkway.value = false;
  }

  void updateWalkwayPoints(int index, List<LatLng> newPoints) {
    if (index < 0 || index >= currentWalkways.length) return;
    final walkway = currentWalkways[index];
    final bounds = getPolygonBounds(newPoints);
    double newLength;
    if (walkway.isHorizontal) {
      newLength = (bounds.northeast.longitude - bounds.southwest.longitude) *
          111111 *
          cos(bounds.southwest.latitude * pi / 180);
    } else {
      newLength = (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
    }
    final updatedWalkway = walkway.copyWith(points: newPoints, length: newLength);
    currentWalkways[index] = updatedWalkway;
    final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (buildingIndex != -1) {
      buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
    }
    if (hasPanels.value) calculateAndShowPanels();
    update();
  }

  void toggleWalkwayOrientation(int index) {
    if (index < 0 || index >= currentWalkways.length) return;
    final walkway = currentWalkways[index];
    final newOrientation = !walkway.isHorizontal;

    LatLngBounds bounds;
    bool hasStructure = currentBuilding!.panels.isNotEmpty;
    if (hasStructure) {
      bounds = _getStructureBounds()!;
    } else {
      bounds = getPolygonBounds(currentBuilding!.terracePoints);
    }

    final double widthMeters = walkway.width;
    List<LatLng> newPoints;
    if (newOrientation) {
      final double centerLat = (bounds.northeast.latitude + bounds.southwest.latitude) / 2;
      final double halfHeightDeg = widthMeters / 111111.0 / 2;
      final double topLat = centerLat + halfHeightDeg;
      final double bottomLat = centerLat - halfHeightDeg;
      final double lengthMeters = (bounds.northeast.longitude - bounds.southwest.longitude) *
          111111 *
          cos(centerLat * pi / 180);
      newPoints = [
        LatLng(bottomLat, bounds.southwest.longitude),
        LatLng(bottomLat, bounds.northeast.longitude),
        LatLng(topLat, bounds.northeast.longitude),
        LatLng(topLat, bounds.southwest.longitude),
      ];
      final updatedWalkway = walkway.copyWith(
        isHorizontal: true,
        points: newPoints,
        length: lengthMeters,
        maxLength: lengthMeters,
      );
      currentWalkways[index] = updatedWalkway;
    } else {
      final double centerLng = (bounds.northeast.longitude + bounds.southwest.longitude) / 2;
      final double halfWidthDeg = widthMeters / (111111.0 * cos(centerLng * pi / 180)) / 2;
      final double leftLng = centerLng - halfWidthDeg;
      final double rightLng = centerLng + halfWidthDeg;
      final double lengthMeters = (bounds.northeast.latitude - bounds.southwest.latitude) * 111111;
      newPoints = [
        LatLng(bounds.southwest.latitude, leftLng),
        LatLng(bounds.southwest.latitude, rightLng),
        LatLng(bounds.northeast.latitude, rightLng),
        LatLng(bounds.northeast.latitude, leftLng),
      ];
      final updatedWalkway = walkway.copyWith(
        isHorizontal: false,
        points: newPoints,
        length: lengthMeters,
        maxLength: lengthMeters,
      );
      currentWalkways[index] = updatedWalkway;
    }

    final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (buildingIndex != -1) {
      buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
    }
    if (hasPanels.value) calculateAndShowPanels();
    update();
  }


  void removeWalkway(int index) {
    if (index < 0 || index >= currentWalkways.length) return;
    currentWalkways.removeAt(index);
    final buildingIndex = buildings.indexWhere((b) => b.id == selectedBuildingId.value);
    if (buildingIndex != -1) {
      buildings[buildingIndex] = buildings[buildingIndex].copyWith(walkways: List<Walkway>.from(currentWalkways));
    }
    if (currentWalkways.isEmpty) stopEditingWalkway();
    else if (selectedWalkwayIndex.value >= currentWalkways.length) {
      selectedWalkwayIndex.value = currentWalkways.length - 1;
      editingWalkwayIndex.value = selectedWalkwayIndex.value;
    }
    if (hasPanels.value) calculateAndShowPanels();
    update();
  }

  LatLng getCenter(List<LatLng> points) {
    double lat = 0, lng = 0;
    for (final p in points) {
      lat += p.latitude;
      lng += p.longitude;
    }
    return LatLng(lat / points.length, lng / points.length);
  }

  LatLng getWalkwayEndPoint(Walkway walkway) {
    if (walkway.points.isEmpty) return const LatLng(0, 0);
    if (walkway.isHorizontal) {
      final p1 = walkway.points[1];
      final p2 = walkway.points[2];
      return LatLng((p1.latitude + p2.latitude) / 2, (p1.longitude + p2.longitude) / 2);
    } else {
      final p1 = walkway.points[0];
      final p2 = walkway.points[1];
      return LatLng((p1.latitude + p2.latitude) / 2, (p1.longitude + p2.longitude) / 2);
    }
  }

  void dragWalkway(int index, LatLng newPosition) {
    if (index < 0 || index >= currentWalkways.length) return;
    final walkway = currentWalkways[index];
    final endPoint = getWalkwayEndPoint(walkway);
    final translation = LatLng(
      newPosition.latitude - endPoint.latitude,
      newPosition.longitude - endPoint.longitude,
    );
    final newPoints = walkway.points
        .map((p) => LatLng(p.latitude + translation.latitude, p.longitude + translation.longitude))
        .toList();
    updateWalkwayPoints(index, newPoints);
  }

  // ========== UTILITY METHODS ==========

  Future<void> updatePolygon({bool forceUpdate = false}) async {
    if (!forceUpdate && polygonPoints.length < 2) return;
    distanceMarkers.clear();
    final List<LatLng> cleanPoints = List<LatLng>.from(polygonPoints);
    if (cleanPoints.length >= 3 && cleanPoints.first == cleanPoints.last) cleanPoints.removeLast();
    for (int i = 0; i < cleanPoints.length; i++) {
      final nextIndex = (i + 1) % cleanPoints.length;
      final distance = calculateDistance(cleanPoints[i], cleanPoints[nextIndex]);
      final converted = showInMeters.value ? distance : distance * 3.28084;
      final textMarker = await createTextMarker('${converted.toStringAsFixed(1)}${showInMeters.value ? 'm' : 'ft'}');
      final midpoint = LatLng(
        (cleanPoints[i].latitude + cleanPoints[nextIndex].latitude) / 2,
        (cleanPoints[i].longitude + cleanPoints[nextIndex].longitude) / 2,
      );
      distanceMarkers.add(Marker(
        markerId: MarkerId('distance_$i'),
        position: midpoint,
        icon: textMarker,
        anchor: const Offset(0.5, 0.5),
      ));
    }
    if (cleanPoints.length >= 3) {
      final closed = List<LatLng>.from(cleanPoints)..add(cleanPoints[0]);
      polygonArea.value = calculatePolygonArea(closed);
    } else {
      polygonArea.value = 0.0;
    }
  }

  double calculateDistance(LatLng start, LatLng end) {
    final lat1 = start.latitude * pi / 180;
    final lon1 = start.longitude * pi / 180;
    final lat2 = end.latitude * pi / 180;
    final lon2 = end.longitude * pi / 180;
    final dLat = lat2 - lat1;
    final dLon = lon2 - lon1;
    final a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double calculatePolygonArea(List<LatLng> points) {
    if (points.length < 3) return 0.0;
    double area = 0.0;
    for (int i = 0; i < points.length; i++) {
      final p1 = points[i];
      final p2 = points[(i + 1) % points.length];
      area += toRadians(p2.longitude - p1.longitude) *
          (2 + sin(toRadians(p1.latitude)) + sin(toRadians(p2.latitude)));
    }
    return (area * 6378137 * 6378137 / 2).abs();
  }

  double toRadians(double degree) => degree * pi / 180;

  LatLngBounds getPolygonBounds(List<LatLng> points) {
    if (points.isEmpty) return LatLngBounds(southwest: const LatLng(0, 0), northeast: const LatLng(0, 0));
    double minLat = points[0].latitude, maxLat = points[0].latitude;
    double minLng = points[0].longitude, maxLng = points[0].longitude;
    for (final p in points) {
      minLat = min(minLat, p.latitude);
      maxLat = max(maxLat, p.latitude);
      minLng = min(minLng, p.longitude);
      maxLng = max(maxLng, p.longitude);
    }
    return LatLngBounds(southwest: LatLng(minLat, minLng), northeast: LatLng(maxLat, maxLng));
  }

  void clearPolygon() {
    polygonPoints.clear();
    polygonArea.value = 0.0;
    distanceMarkers.clear();
    solarPanelsPolygons.clear();
    currentWalkways.clear();
  }

  Future<BitmapDescriptor> createTextMarker(String text) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          backgroundColor: Colors.black54,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset.zero);
    final image = await recorder.endRecording()
        .toImage(textPainter.width.ceil(), textPainter.height.ceil());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }

  void toggleBuildingSelection(String buildingId) {
    if (selectedBuildingId.value == buildingId) selectedBuildingId.value = '';
    else selectBuilding(buildingId);
  }

  // start hand rail drawing
  void startDrawingHandRail() {
    isDrawingHandRail.value = true;
    isHandRailComplete.value = false;
    update();
  }

  void toggleBorderSelection(int index) {}
  // hand rail
  void finishDrawingHandRail() {
    isDrawingHandRail.value = false;
    isHandRailComplete.value = true;
    update();
  }

  bool isPointNearBorder(LatLng tapPoint, LatLng lineStart, LatLng lineEnd) {
    const double threshold = 0.00005;
    if (lineStart == lineEnd) return false;
    final lineLength = calculateDistance(lineStart, lineEnd);
    final distance = ((lineEnd.latitude - lineStart.latitude) *
        (tapPoint.longitude - lineStart.longitude) -
        (lineEnd.longitude - lineStart.longitude) *
            (tapPoint.latitude - lineStart.latitude))
        .abs() /
        lineLength;
    return distance < threshold;
  }


  // hand rail function
  double calculateHandRailLength(List<LatLng> handRailPoints) {
    if (handRailPoints.isEmpty || handRailPoints.length % 2 != 0) return 0.0;
    double total = 0.0;
    for (int i = 0; i < handRailPoints.length; i += 2) {
      if (i + 1 < handRailPoints.length)
        total += calculateDistance(handRailPoints[i], handRailPoints[i + 1]);
    }
    return total;
  }

  // ==================== API INTEGRATION FOR COMPLETE SURVEY ====================

  Future<void> completeSurvey([Uint8List? screenshot]) async {

    String? imageBase64;
    if (screenshot != null) {
      imageBase64 = base64Encode(screenshot.toList());
      print('Image size: ${screenshot.length} bytes, Base64 length: ${imageBase64.length}');
    }



    if (currentBuilding == null) {
      Get.snackbar('Error', 'No building selected');
      return;
    }
    if (currentBuilding!.terracePoints.isEmpty) {
      Get.snackbar('Error', 'No terrace drawn');
      return;
    }
    if (currentBuilding!.panels.isEmpty) {
      Get.snackbar('Error', 'No panels placed');
      return;
    }

    // Recalculate BOM to ensure latest values
    calculateBOM();

    final building = currentBuilding!;
    // current  building


    // survey data
    final Map<String, dynamic> payload = {
      'userId' : userId,
      'name': building.name,
      'customerName': building.customerName,
      'customerMobile': building.customerMobile,
      'projectType': building.projectType,
      'selectedProjectTypeId': selectedProjectTypeId.value,
      'selectedTechnologyId': selectedTechnologyId.value,
      'selectedPanelWattId': selectedPanelWattId.value,
      'selectedPanelWatt': selectedPanelWatt.value,
      'selectedKilowattId': selectedKilowattId.value,
      'selectedKilowatt': selectedKilowattId.value,
      'selectedPanelCount': selectedPanelCount.value,
      'selectedRows': selectedRows.value,
      'isHorizontal': isHorizontal.value,
      'currentMode': currentMode.value,
      'padding': paddingValue.value,
      'rowSpacing': rowSpacingValue.value,
      'groupRowsForKW': groupRowsForKW.value,
      'groupRowsForSpace': groupRowsForSpace.value,
      'terraceType': terraceType.value,
      'structureType': structureType.value,
      'inverterPosition': inverterPosition.value,
      'isMeterOrFeet': isMeterOrFeet.value,
      'frontLegHeight': frontLegHeight.value,
      'backLegHeight': backLegHeight.value,
      'terracePoints': building.terracePoints.map((p) => {'lat': p.latitude, 'lng': p.longitude}).toList(),
      'panels': building.panels.map((p) => {'lat': p.latitude, 'lng': p.longitude}).toList(),
      'walkways': building.walkways.map((w) => {
        'id': w.id,
        'name': w.name,
        'points': w.points.map((p) => {'lat': p.latitude, 'lng': p.longitude}).toList(),
        'isHorizontal': w.isHorizontal,
        'width': w.width,
        'length': w.length,
        'maxLength': w.maxLength,
      }).toList(),
      'totalKw': building.totalKw,
      'paneltotalWidth': building.paneltotalWidth,
      'paneltotalHeight': building.paneltotalHeight,
      'isSaved': true,
      'f6040': building.f6040,
      'f4040': building.f4040,
      'extraPipes': building.extraPipes,
      'lAngle_qty': building.lAngle_qty,
      'americanBolt_qty': building.americanBolt_qty,
      'zink_qty': building.zink_qty,
      'jBolt_qty': building.jBolt_qty,
      'foundation_qty': building.foundation_qty,
      'dcWire_meter': building.dcWire_meter,
      'acWire_meter': building.acWire_meter,
      'totalKg': building.totalKg,
      'image' : imageBase64 ?? '',
    };

    isLoading.value = true;
    try {

      final response = await _apiService.saveSurvey(payload);
      final jsonResponse = json.decode(response.body);
      print('jsonResponse $jsonResponse');
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (jsonResponse['success'] == true) {
          // Update local state
          final index = buildings.indexWhere((b) => b.id == building.id);
          if (index != -1) {
            buildings[index] = buildings[index].copyWith(isSaved: true);
          }
          String surveyId = jsonResponse['buildingId'].toString();
          isSaved.value = true;
          showCustomSnackBar(Get.context!, message: jsonResponse['message'] ?? 'Survey completed and saved!', backgroundColor: Colors.green);
          Get.to(() => AddSurveyQuotation(
            surveyId: surveyId,
            quoteId: '',
            cname: building.customerName,
            cnumber: building.customerMobile,
            district: selectedDistrict.value,
            category: selectedCategoryId.value,
            subCategory: selectedSubCategoryId.value,
            projectType: selectedProjectTypeId.value,
            subProjectType: selectedSubprojectTypeId.value,
            brand: selectedBrand.value,
            technology: selectedTechnologyId.value,
            panelWatt: selectedPanelWattId.value,
            noOfSolarPanel: selectedNoOfPanels.value,
            kilowatt: selectedKilowattId.value,
            terraceTypeId: selectedTerraceTypeId.value,
          ));

        } else {
          showCustomSnackBar(Get.context!, message: jsonResponse['message'] ?? 'Failed to save survey', backgroundColor: Colors.red);
        }
      } else {
        showCustomSnackBar(Get.context!, message: 'Server error: ${response.statusCode}', backgroundColor: Colors.red);
      }
    } catch (e) {
      showCustomSnackBar(Get.context!, message:  'Network error: $e', backgroundColor: Colors.red);

    } finally {
      isLoading.value = false;
    }
  }

  // ==================== API CALLS ====================

  Future<void> getTerraceType() async {
    isLoading.value = true;
    http.Response response = await _apiService.getTerraceType();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      terraceTypesList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getStructureType() async {
    isLoading.value = true;
    http.Response response = await _apiService.getStructureType();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      structureTypeList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getInverterPositions() async {
    isLoading.value = true;
    http.Response response = await _apiService.getInverterPositions();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      inverterPositionList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getDistrict() async {
    isLoading.value = true;
    http.Response response = await _apiService.getDistrict_ForAddQuote(userId);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      distictList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }


  Future<void> getCategory() async {
    isLoading.value = true;
    http.Response response = await _apiService.getCategory();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      categoryList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getSubCategory() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSubCategory(selectedCategoryId.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      subCategoryList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getProjectTypes() async {
    isLoading.value = true;
    http.Response response = await _apiService.getProjectTypes(selectedSubCategoryId.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      projectTypeList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getSubProjectTypes() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSubProjectTypes(selectedProjectTypeId.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      subprojectTypeList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getSolarBrands() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSolarBrands();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      brandList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getTechnology() async {
    isLoading.value = true;
    http.Response response = await _apiService.getTechnology();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      technologyList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getSolarPanelWatt() async {
    isLoading.value = true;
    http.Response response = await _apiService.getSolarPanelWatt();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      panelWattList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getNoOfPanels() async {
    isLoading.value = true;
    http.Response response = await _apiService.getNoOfPanels(
      selectedCategory: selectedCategoryId.value,
      selectedSubCategory: selectedSubCategoryId.value,
      selectedProjectType: selectedProjectTypeId.value,
      brandId: selectedBrand.value,
      selectedTechnology: selectedTechnologyId.value,
      selectedPanelWatt: selectedPanelWattId.value,
    );
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data']['availableSolarPanelNumbers'];
      noOfPanelList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getKilowatt() async {
    isLoading.value = true;
    http.Response response = await _apiService.getKilowatt(selectedPanelWattId.value, selectedNoOfPanels.value);
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      kilowattList.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
      selectedKilowattId.value = kilowattList.first.id;
      selectedKilowatt.value = kilowattList.first.name;
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }

  Future<void> getBuildingType() async {
    isLoading.value = true;
    http.Response response = await _apiService.getBuildingtype();
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    if (jsonResponse['success'] == true) {
      List<dynamic> data = jsonResponse['data'];
      buildingTypes.value = data.map((item) => CommonItemModel.fromJson(item)).toList();
    } else {
      showCustomSnackBar(Get.context!, message: jsonResponse['message'], backgroundColor: Colors.red);
    }
    isLoading.value = false;
  }
}