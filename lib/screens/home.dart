import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/widgets/theme/colors.dart';
import 'package:little_library/widgets/book_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<String> tabs = <String>[
      'All',
      'Fiction',
      'Non-Fiction',
      'Textbooks',
      'Kids',
      'Self-help',
      'Comics',
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: AppColors.background2,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Books',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(height: size.height * 0.04),
                        TextFormField(
                          controller: _searchController,
                          decoration: kSearchTextField.copyWith(
                            filled: true,
                            hintText: 'Search for a book name or location',
                            suffixIcon: const Icon(
                              Icons.search,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  toolbarHeight: 190,
                  collapsedHeight: 200,
                  pinned: true,
                  // expandedHeight: 170,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: TabBar(
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        indicator: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(22),
                        ),
                        isScrollable: true,
                        unselectedLabelColor: AppColors.primaryText,
                        labelColor: AppColors.primaryText,
                        indicatorColor: AppColors.primary,
                        tabs:
                            tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            color: AppColors.background1,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 260),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return BookCard();
                    },
                    itemCount: 20,
                    // separatorBuilder: (BuildContext context, int index) {
                    //   return const Divider();
                    // },
                  ),
                ),
                Container(
                  child: const Text("Articles Body"),
                ),
                Container(
                  child: const Text("User Body"),
                ),
                Container(
                  child: const Text("Home Body"),
                ),
                Container(
                  child: const Text("Articles Body"),
                ),
                Container(
                  child: const Text("User Body"),
                ),
                Container(
                  child: const Text("User Body"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
