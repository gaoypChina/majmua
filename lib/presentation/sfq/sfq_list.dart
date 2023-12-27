import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/strings/app_constraints.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/data/repositories/sfq_data_repository.dart';
import 'package:majmua/domain/entities/sfq_entity.dart';
import 'package:majmua/domain/usecases/sfq_use_case.dart';
import 'package:majmua/presentation/sfq/sfq_item.dart';
import 'package:majmua/presentation/state/sfq_state.dart';
import 'package:majmua/presentation/widgets/error_data_text.dart';
import 'package:majmua/presentation/widgets/user_back_button.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SFQList extends StatefulWidget {
  const SFQList({
    super.key,
    required this.bucketSFQList,
  });

  final PageStorageBucket bucketSFQList;

  @override
  State<SFQList> createState() => _SFQListState();
}

class _SFQListState extends State<SFQList> {
  final SFQUseCase _sfqUseCase = SFQUseCase(SFQDataRepository());
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const UserBackButton(),
        title: Text(appLocale!.sfq),
        actions: [
          IconButton(
            onPressed: () {
              _itemScrollController.scrollTo(
                index: Provider.of<SFQState>(context, listen: false).getRandomNumber,
                duration: const Duration(milliseconds: 750),
              );
            },
            splashRadius: 20,
            icon: Image.asset(
              'assets/icons/refresh.png',
              width: 20,
              height: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<SFQEntity>>(
        future: _sfqUseCase.fetchAllSupplications(tableName: appLocale.sfqTableName),
        builder: (BuildContext context, AsyncSnapshot<List<SFQEntity>> snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return PageStorage(
              bucket: widget.bucketSFQList,
              child: ScrollablePositionedList.builder(
                key: const PageStorageKey<String>(AppConstraints.keyBucketSFQListChapters),
                itemScrollController: _itemScrollController,
                padding: AppStyles.mainMardingMini,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final SFQEntity model = snapshot.data![index];
                  return SFQItem(
                    model: model,
                    index: index,
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorDataText(errorText: snapshot.error.toString());
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
