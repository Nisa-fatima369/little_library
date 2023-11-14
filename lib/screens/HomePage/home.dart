import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/book_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  leading: const SizedBox.shrink(),
                  leadingWidth: 0.0,
                  backgroundColor: AppColors.background1,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'All Books',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
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
                  toolbarHeight: 140,
                  collapsedHeight: 150,
                  pinned: true,
                  // expandedHeight: 170,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        indicator: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        splashBorderRadius: BorderRadius.circular(28),
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
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 210),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const BookCard();
                  },
                  itemCount: 10,
                ),
              ),
              const Text("Articles Body"),
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
    );
  }
}
