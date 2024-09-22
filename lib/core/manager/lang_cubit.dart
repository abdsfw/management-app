import 'package:bloc/bloc.dart';
import 'package:mangment_app/constant.dart';
import 'package:mangment_app/core/cache/cashe_helper.dart';
import 'package:mangment_app/core/enums/lang_enum.dart';
import 'package:meta/meta.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<LangState> {
  LangCubit() : super(LangInitial());
  String lang = 'en';
  Future<void> setLangAttribute() async {
    lang = await CasheHelper.getData(key: Constant.kLang);
    emit(LangInitial());
  }

  Future<void> changeLang({required String selectedLang}) async {
    if (lang != selectedLang) {
      lang = selectedLang;
      CasheHelper.setData(key: Constant.kLang, value: selectedLang);
      emit(LangInitial());
    }
  }
}
