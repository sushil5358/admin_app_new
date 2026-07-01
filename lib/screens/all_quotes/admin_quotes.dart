// lib/view/quotations_screen.dart - Admin Version (Using Your AppColors)
import 'package:admin_app_new/screens/all_quotes/quick_quote_admin.dart';
import 'package:admin_app_new/screens/all_quotes/survey_quote_admin.dart';

import 'package:admin_app_new/screens/unfied_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import '../../appColors.dart';
import '../../controller/admin_quotes_controller.dart';
import '../../models/comanItem_model.dart';
import '../add_quotation_companyUser.dart';


class QuotesManagementScreen extends StatefulWidget {
  const QuotesManagementScreen({super.key});

  @override
  State<QuotesManagementScreen> createState() => _QuotesManagementScreenState();
}

class _QuotesManagementScreenState extends State<QuotesManagementScreen> with SingleTickerProviderStateMixin {
  AdminQuotesController controller = Get.put(AdminQuotesController());
  late TabController _tabController;


  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Get.delete<AdminQuotesController>();
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: AppColors.backgroundGrey,
      appBar: AppBar(
        title: const Text(
          'Quotes',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.black87,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 1,
        shadowColor: AppColors.shadowGrey.withOpacity(0.3),

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primaryBlue,
          labelColor: AppColors.primaryBlue,
          unselectedLabelColor: AppColors.grey,
          tabs: const [
            Tab(text: 'Quick Quotes'),
            Tab(text: 'Survey Quote'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: AppColors.primaryBlue),
            onPressed: () {
              _showFilterBottomSheet(context);
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          QuickQuoteAdmin(),
          SurveyQuoteAdmin(),

          // Survey Quote Tab

        ],
      ),
      floatingActionButton: _tabController.index == 0
          ? FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  AddQuoteScreen(quoteId: '',)),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Quote'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      )
          : FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  UnifiedSurveyScreen(willQuote: 'yes',)),
          );
        },
        icon: const Icon(Icons.article_outlined),
        label: const Text('New Survey'),
        backgroundColor: AppColors.primaryBlue,
        foregroundColor: Colors.white,
      ),
    );
  }


  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.7,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filter Data',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 16),


                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Project Type Multi-Select



                          // select district
                          const Text(
                            'Select Districts',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return MultiSelectDialogField(

                              initialValue: controller.districtsList.where((p) {
                                return controller.selectedDistrictIds.value
                                    .contains(p.id);
                              },).toList(),
                              items: controller.districtsList.map((element) {
                                return MultiSelectItem(element, element.name);
                              },).toList(),
                              title: const Text('Select Districts'),
                              buttonText: const Text('Select Districts'),
                              buttonIcon: const Icon(Icons.business_center),

                              decoration: BoxDecoration(

                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onConfirm: (List<CommonItemModel> val) {
                                String selectedIds = val.map((e) => e.id,).join(
                                    ',');
                                controller.selectedDistrictIds.value =
                                    selectedIds;
                              },
                            );
                          }),
                          const SizedBox(height: 20),


                          // select partner types



                          // Category Multi-Select
                          const Text(
                            'Select Category',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return MultiSelectDialogField(
                              initialValue: controller.categoryList.where((e) {
                                return controller.selectedCategoryIds.contains(
                                    e.id);
                              },).toList(),
                              items: controller.categoryList
                                  .map((cat) {
                                return MultiSelectItem<CommonItemModel>(
                                    cat, cat.name);
                              })
                                  .toList(),
                              title: const Text('Select Category'),
                              buttonText: const Text('Select Category'),
                              buttonIcon: const Icon(Icons.category),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onConfirm: (List<CommonItemModel> e) {
                                String selectedIds = e.map((e) => e.id,).join(
                                    ',');
                                print('selectedIds $selectedIds');
                                controller.selectedCategoryIds.value =
                                    selectedIds;
                                controller.getSubCategory();
                              },
                            );
                          }),
                          const SizedBox(height: 20),

                          // Sub Category Multi-Select
                          const Text(
                            'Select Sub Category',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return MultiSelectDialogField(
                              initialValue: controller.subcategoryList.where((
                                  p0) {
                                return controller.selectedSubCategoryIds.value
                                    .contains(p0.id);
                              },).toList(),
                              items: controller.subcategoryList
                                  .map((cat) {
                                return MultiSelectItem<CommonItemModel>(
                                    cat, cat.name);
                              })
                                  .toList(),
                              title: const Text('Select Sub Category'),
                              buttonText: const Text('Select Sub Category'),
                              buttonIcon: const Icon(
                                  Icons.subdirectory_arrow_right),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onConfirm: (List<CommonItemModel> e) {
                                String selectedIds = e.map((e) => e.id,).join(
                                    ',');
                                print('selectedIds $selectedIds');
                                controller.selectedSubCategoryIds.value =
                                    selectedIds;
                                controller.getProjectTypes();
                              },
                            );
                          }),
                          const SizedBox(height: 20),

                          // project type multi-select
                          const Text(
                            'Select Project Type',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return MultiSelectDialogField(
                              initialValue: controller.projectTypeList
                                  .where((p0) {
                                return controller.selectedProjectTypeIds.value
                                    .contains(p0.id);
                              },).toList(),
                              items: controller.projectTypeList
                                  .map((cat) {
                                return MultiSelectItem<CommonItemModel>(
                                    cat, cat.name);
                              })
                                  .toList(),
                              title: const Text('Select Project Type'),
                              buttonText: const Text('Select Project Type'),
                              buttonIcon: const Icon(Icons.business_center),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onConfirm: (List<CommonItemModel> e) {
                                String selectedIds = e.map((e) => e.id,).join(
                                    ',');
                                print('selectedIds $selectedIds');
                                controller.selectedProjectTypeIds.value = selectedIds;

                                controller.getSubProjectTypes();
                              },
                            );
                          }),
                          const SizedBox(height: 20),


                          // sub project type multi-select
                          const Text(
                            'Select Sub Project Type',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            return MultiSelectDialogField(
                              initialValue: controller.subProjectTypeList
                                  .where((p0) {
                                return controller.selectedSubPorjectTypeIds
                                    .value.contains(p0.id);
                              },).toList(),
                              items: controller.subProjectTypeList
                                  .map((cat) {
                                return MultiSelectItem<CommonItemModel>(
                                    cat, cat.name);
                              })
                                  .toList(),
                              title: const Text('Select Sub Project Type'),
                              buttonText: const Text('Select Sub Project Type'),
                              buttonIcon: const Icon(Icons.electrical_services),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              onConfirm: (List<CommonItemModel> e) {
                                String selectedIds = e.map((e) => e.id,).join(
                                    ',');
                                print('selectedIds $selectedIds');
                                controller.selectedSubPorjectTypeIds.value =
                                    selectedIds;
                              },
                            );
                          }),
                          const SizedBox(height: 20),



                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Divider(),
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            controller.selectedDistrictIds.value = '';
                            controller.selectedCategoryIds.value = '';
                            controller.selectedSubCategoryIds.value = '';
                            controller.selectedProjectTypeIds.value = '';
                            controller.selectedSubPorjectTypeIds.value = '';
                            controller.getQuickQuote();
                            controller.getSurveyQuote();
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.red.shade400),
                            foregroundColor: Colors.red.shade700,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Clear All'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.getQuickQuote();
                            controller.getSurveyQuote();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Apply Filters',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }


}