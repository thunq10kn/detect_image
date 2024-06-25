/// Generated file. Do not edit.
///
/// Original: lib/src/common/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 112 (56 per locale)
///
/// Built on 2024-06-25 at 03:26 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ja(languageCode: 'ja', build: _StringsJa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get title => 'SMOOOZ';
	String get homeTitle => 'SMOOOZ Home Page';

	/// ErrorScreen
	late final _StringsErrorScreenEn errorScreen = _StringsErrorScreenEn._(_root);

	/// EmptyPlaceholderWidget
	late final _StringsEmptyPlaceholderWidgetEn emptyPlaceholderWidget = _StringsEmptyPlaceholderWidgetEn._(_root);

	/// LoginScreen
	late final _StringsLoginScreenEn loginScreen = _StringsLoginScreenEn._(_root);

	/// SignUpScreen
	late final _StringsSignUpScreenEn signUpScreen = _StringsSignUpScreenEn._(_root);

	/// ErrorDialog
	late final _StringsDialogsEn dialogs = _StringsDialogsEn._(_root);

	/// ConfirmDialog
	late final _StringsConfirmDialogEn confirmDialog = _StringsConfirmDialogEn._(_root);

	/// LoginSmsCodeScreen
	late final _StringsLoginSmsCodeScreenEn loginSmsCodeScreen = _StringsLoginSmsCodeScreenEn._(_root);

	late final _StringsAppBarTitleEn appBarTitle = _StringsAppBarTitleEn._(_root);
	late final _StringsMypageScreenEn mypageScreen = _StringsMypageScreenEn._(_root);
	late final _StringsSettingsScreenEn settingsScreen = _StringsSettingsScreenEn._(_root);
	late final _StringsNotificationsScreenEn notificationsScreen = _StringsNotificationsScreenEn._(_root);
}

// Path: errorScreen
class _StringsErrorScreenEn {
	_StringsErrorScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get error => 'Error';
	String get unknownErrorOccurred => 'An unknown error occurred';
	String get notFound404 => '404 NOT FOUND\nPage not found';
}

// Path: emptyPlaceholderWidget
class _StringsEmptyPlaceholderWidgetEn {
	_StringsEmptyPlaceholderWidgetEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get goHome => 'Go Home';
}

// Path: loginScreen
class _StringsLoginScreenEn {
	_StringsLoginScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get enterEmailAddress => 'Please enter\nyour email address and password';
	String get emailAddress => 'Email address';
	String get password => 'Password';
	String get forgotPassword => 'Forgot password?';
	String get login => 'Login';
	String get enterPhoneNumber => 'Please enter\nyour phone number';
	String get sendAuthorizationCode => 'Send your authentication code\nvia SMS';
	String get phoneNumber => 'Phone number';
	String get skip => 'Skip';
}

// Path: signUpScreen
class _StringsSignUpScreenEn {
	_StringsSignUpScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get registerEmailAddress => 'Please register\nyour email address and password';
	String get emailAddress => 'Email address';
	String get password => 'Password';
	String get forgotPassword => 'Forgot password?';
	String get register => 'Register';
}

// Path: dialogs
class _StringsDialogsEn {
	_StringsDialogsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get error => 'Error';
	String get ok => 'OK';
}

// Path: confirmDialog
class _StringsConfirmDialogEn {
	_StringsConfirmDialogEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get confirm => 'Confirm';
	String get yes => 'Yes';
	String get no => 'No';
}

// Path: loginSmsCodeScreen
class _StringsLoginSmsCodeScreenEn {
	_StringsLoginSmsCodeScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get missingParameters => 'Please try SMS authentication again\ndue to missing parameters';
	String get enterCode => 'Please enter the code sent to you';
	String get resend => 'Resend Code';
	String get canResend => ' seconds later, you can resend the code.';
	String get resent => ' resent';
}

// Path: appBarTitle
class _StringsAppBarTitleEn {
	_StringsAppBarTitleEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get search => 'Search';
	String get users => 'Users';
	String get message => 'Message';
	String get mypage => 'My Page';
	String get settings => 'Settings';
	String get profile => 'Photo Approval';
	String get home => 'Home';
	String get ageVerification => 'Age Verification';
	String get report => 'Report';
	String get notifications => 'Notifications';
}

// Path: mypageScreen
class _StringsMypageScreenEn {
	_StringsMypageScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get ageVerification => 'Age Verification';
	String get coinsHeld => 'Coins Held';
	String get planStatus => 'Plan Status';
	String get settings => 'Settings';
	String get notifications => 'Notifications';
}

// Path: settingsScreen
class _StringsSettingsScreenEn {
	_StringsSettingsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get mainSettings => 'Main Settings';
	String get notificationSettings => 'Notification Settings';
	String get blockUser => 'Block User';
	String get otherSettings => 'Other Settings';
	String get operatorCompany => 'Operator Company';
	String get terms => 'Terms';
	String get privacyPolicy => 'Privacy Policy';
	String get indicationBasedOnSpecialCommercialLaw => 'Indication based on Special Commercial Law';
	String get license => 'License';
	String get help => 'Help';
	String get contactUs => 'Contact Us';
}

// Path: notificationsScreen
class _StringsNotificationsScreenEn {
	_StringsNotificationsScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
}

// Path: <root>
class _StringsJa implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsJa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsJa _root = this; // ignore: unused_field

	// Translations
	@override String get title => 'SMOOOZ';
	@override String get homeTitle => 'SMOOOZ ホームページ';

	/// ErrorScreen
	@override late final _StringsErrorScreenJa errorScreen = _StringsErrorScreenJa._(_root);

	/// EmptyPlaceholderWidget
	@override late final _StringsEmptyPlaceholderWidgetJa emptyPlaceholderWidget = _StringsEmptyPlaceholderWidgetJa._(_root);

	/// LoginScreen
	@override late final _StringsLoginScreenJa loginScreen = _StringsLoginScreenJa._(_root);

	/// SignUpScreen
	@override late final _StringsSignUpScreenJa signUpScreen = _StringsSignUpScreenJa._(_root);

	/// ErrorDialog
	@override late final _StringsDialogsJa dialogs = _StringsDialogsJa._(_root);

	/// ConfirmDialog
	@override late final _StringsConfirmDialogJa confirmDialog = _StringsConfirmDialogJa._(_root);

	/// LoginSmsCodeScreen
	@override late final _StringsLoginSmsCodeScreenJa loginSmsCodeScreen = _StringsLoginSmsCodeScreenJa._(_root);

	@override late final _StringsAppBarTitleJa appBarTitle = _StringsAppBarTitleJa._(_root);
	@override late final _StringsMypageScreenJa mypageScreen = _StringsMypageScreenJa._(_root);
	@override late final _StringsSettingsScreenJa settingsScreen = _StringsSettingsScreenJa._(_root);
	@override late final _StringsNotificationsScreenJa notificationsScreen = _StringsNotificationsScreenJa._(_root);
}

// Path: errorScreen
class _StringsErrorScreenJa implements _StringsErrorScreenEn {
	_StringsErrorScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get error => 'エラー';
	@override String get unknownErrorOccurred => '不明なエラーが発生しました';
	@override String get notFound404 => '404 NOT FOUND\nページが見つかりませんでした';
}

// Path: emptyPlaceholderWidget
class _StringsEmptyPlaceholderWidgetJa implements _StringsEmptyPlaceholderWidgetEn {
	_StringsEmptyPlaceholderWidgetJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get goHome => 'ホームへ戻る';
}

// Path: loginScreen
class _StringsLoginScreenJa implements _StringsLoginScreenEn {
	_StringsLoginScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get enterEmailAddress => 'メールアドレスとパスワードを\n入力してください';
	@override String get emailAddress => 'メールアドレス';
	@override String get password => 'パスワード';
	@override String get forgotPassword => 'パスワードを忘れた場合';
	@override String get login => 'ログイン';
	@override String get enterPhoneNumber => '電話番号を\n入力してください';
	@override String get sendAuthorizationCode => 'SMSで認証コードを\n送信します';
	@override String get phoneNumber => '電話番号';
	@override String get skip => 'スキップする';
}

// Path: signUpScreen
class _StringsSignUpScreenJa implements _StringsSignUpScreenEn {
	_StringsSignUpScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get registerEmailAddress => 'メールアドレスとパスワードを\n登録してください';
	@override String get emailAddress => 'メールアドレス';
	@override String get password => 'パスワード';
	@override String get forgotPassword => 'パスワードを忘れた場合';
	@override String get register => '登録する';
}

// Path: dialogs
class _StringsDialogsJa implements _StringsDialogsEn {
	_StringsDialogsJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get error => 'エラー';
	@override String get ok => 'OK';
}

// Path: confirmDialog
class _StringsConfirmDialogJa implements _StringsConfirmDialogEn {
	_StringsConfirmDialogJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get confirm => '確認';
	@override String get yes => 'はい';
	@override String get no => 'いいえ';
}

// Path: loginSmsCodeScreen
class _StringsLoginSmsCodeScreenJa implements _StringsLoginSmsCodeScreenEn {
	_StringsLoginSmsCodeScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get missingParameters => 'パラメーターが不足しているため、\nもう一度 SMS 認証をお試しください';
	@override String get enterCode => '送信されたコードを\n入力してください';
	@override String get resend => '再送信する';
	@override String get canResend => '秒後にコードを再送信できます';
	@override String get resent => 'に送信されました';
}

// Path: appBarTitle
class _StringsAppBarTitleJa implements _StringsAppBarTitleEn {
	_StringsAppBarTitleJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get search => 'さがす';
	@override String get users => 'ユーザー';
	@override String get message => 'メッセージ';
	@override String get mypage => 'マイページ';
	@override String get settings => '設定';
	@override String get home => 'ホーム';
	@override String get profile => '写真承認';
	@override String get ageVerification => '年齢確認';
	@override String get report => '通報';
	@override String get notifications => 'お知らせ';
}

// Path: mypageScreen
class _StringsMypageScreenJa implements _StringsMypageScreenEn {
	_StringsMypageScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get ageVerification => '年齢確認';
	@override String get coinsHeld => '保有コイン';
	@override String get planStatus => '会員ステータス';
	@override String get settings => '設定';
	@override String get notifications => 'お知らせ';
}

// Path: settingsScreen
class _StringsSettingsScreenJa implements _StringsSettingsScreenEn {
	_StringsSettingsScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
	@override String get mainSettings => '各種設定';
	@override String get notificationSettings => '通知設定';
	@override String get blockUser => 'ブロックユーザー';
	@override String get otherSettings => 'その他';
	@override String get operatorCompany => '運営会社';
	@override String get terms => '利用規約';
	@override String get privacyPolicy => 'プライバシーポリシー';
	@override String get indicationBasedOnSpecialCommercialLaw => '特商法に基づく表示';
	@override String get license => 'ライセンス';
	@override String get help => 'ヘルプ';
	@override String get contactUs => 'お問い合せ';
}

// Path: notificationsScreen
class _StringsNotificationsScreenJa implements _StringsNotificationsScreenEn {
	_StringsNotificationsScreenJa._(this._root);

	@override final _StringsJa _root; // ignore: unused_field

	// Translations
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'SMOOOZ';
			case 'homeTitle': return 'SMOOOZ Home Page';
			case 'errorScreen.error': return 'Error';
			case 'errorScreen.unknownErrorOccurred': return 'An unknown error occurred';
			case 'errorScreen.notFound404': return '404 NOT FOUND\nPage not found';
			case 'emptyPlaceholderWidget.goHome': return 'Go Home';
			case 'loginScreen.enterEmailAddress': return 'Please enter\nyour email address and password';
			case 'loginScreen.emailAddress': return 'Email address';
			case 'loginScreen.password': return 'Password';
			case 'loginScreen.forgotPassword': return 'Forgot password?';
			case 'loginScreen.login': return 'Login';
			case 'loginScreen.enterPhoneNumber': return 'Please enter\nyour phone number';
			case 'loginScreen.sendAuthorizationCode': return 'Send your authentication code\nvia SMS';
			case 'loginScreen.phoneNumber': return 'Phone number';
			case 'loginScreen.skip': return 'Skip';
			case 'signUpScreen.registerEmailAddress': return 'Please register\nyour email address and password';
			case 'signUpScreen.emailAddress': return 'Email address';
			case 'signUpScreen.password': return 'Password';
			case 'signUpScreen.forgotPassword': return 'Forgot password?';
			case 'signUpScreen.register': return 'Register';
			case 'dialogs.error': return 'Error';
			case 'dialogs.ok': return 'OK';
			case 'confirmDialog.confirm': return 'Confirm';
			case 'confirmDialog.yes': return 'Yes';
			case 'confirmDialog.no': return 'No';
			case 'loginSmsCodeScreen.missingParameters': return 'Please try SMS authentication again\ndue to missing parameters';
			case 'loginSmsCodeScreen.enterCode': return 'Please enter the code sent to you';
			case 'loginSmsCodeScreen.resend': return 'Resend Code';
			case 'loginSmsCodeScreen.canResend': return ' seconds later, you can resend the code.';
			case 'loginSmsCodeScreen.resent': return ' resent';
			case 'appBarTitle.search': return 'Search';
			case 'appBarTitle.users': return 'Users';
			case 'appBarTitle.message': return 'Message';
			case 'appBarTitle.mypage': return 'My Page';
			case 'appBarTitle.settings': return 'Settings';
			case 'appBarTitle.profile': return 'Photo Approval';
			case 'appBarTitle.home': return 'Home';
			case 'appBarTitle.ageVerification': return 'Age Verification';
			case 'appBarTitle.report': return 'Report';
			case 'appBarTitle.notifications': return 'Notifications';
			case 'mypageScreen.ageVerification': return 'Age Verification';
			case 'mypageScreen.coinsHeld': return 'Coins Held';
			case 'mypageScreen.planStatus': return 'Plan Status';
			case 'mypageScreen.settings': return 'Settings';
			case 'mypageScreen.notifications': return 'Notifications';
			case 'settingsScreen.mainSettings': return 'Main Settings';
			case 'settingsScreen.notificationSettings': return 'Notification Settings';
			case 'settingsScreen.blockUser': return 'Block User';
			case 'settingsScreen.otherSettings': return 'Other Settings';
			case 'settingsScreen.operatorCompany': return 'Operator Company';
			case 'settingsScreen.terms': return 'Terms';
			case 'settingsScreen.privacyPolicy': return 'Privacy Policy';
			case 'settingsScreen.indicationBasedOnSpecialCommercialLaw': return 'Indication based on Special Commercial Law';
			case 'settingsScreen.license': return 'License';
			case 'settingsScreen.help': return 'Help';
			case 'settingsScreen.contactUs': return 'Contact Us';
			default: return null;
		}
	}
}

extension on _StringsJa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'SMOOOZ';
			case 'homeTitle': return 'SMOOOZ ホームページ';
			case 'errorScreen.error': return 'エラー';
			case 'errorScreen.unknownErrorOccurred': return '不明なエラーが発生しました';
			case 'errorScreen.notFound404': return '404 NOT FOUND\nページが見つかりませんでした';
			case 'emptyPlaceholderWidget.goHome': return 'ホームへ戻る';
			case 'loginScreen.enterEmailAddress': return 'メールアドレスとパスワードを\n入力してください';
			case 'loginScreen.emailAddress': return 'メールアドレス';
			case 'loginScreen.password': return 'パスワード';
			case 'loginScreen.forgotPassword': return 'パスワードを忘れた場合';
			case 'loginScreen.login': return 'ログイン';
			case 'loginScreen.enterPhoneNumber': return '電話番号を\n入力してください';
			case 'loginScreen.sendAuthorizationCode': return 'SMSで認証コードを\n送信します';
			case 'loginScreen.phoneNumber': return '電話番号';
			case 'loginScreen.skip': return 'スキップする';
			case 'signUpScreen.registerEmailAddress': return 'メールアドレスとパスワードを\n登録してください';
			case 'signUpScreen.emailAddress': return 'メールアドレス';
			case 'signUpScreen.password': return 'パスワード';
			case 'signUpScreen.forgotPassword': return 'パスワードを忘れた場合';
			case 'signUpScreen.register': return '登録する';
			case 'dialogs.error': return 'エラー';
			case 'dialogs.ok': return 'OK';
			case 'confirmDialog.confirm': return '確認';
			case 'confirmDialog.yes': return 'はい';
			case 'confirmDialog.no': return 'いいえ';
			case 'loginSmsCodeScreen.missingParameters': return 'パラメーターが不足しているため、\nもう一度 SMS 認証をお試しください';
			case 'loginSmsCodeScreen.enterCode': return '送信されたコードを\n入力してください';
			case 'loginSmsCodeScreen.resend': return '再送信する';
			case 'loginSmsCodeScreen.canResend': return '秒後にコードを再送信できます';
			case 'loginSmsCodeScreen.resent': return 'に送信されました';
			case 'appBarTitle.search': return 'さがす';
			case 'appBarTitle.users': return 'ユーザー';
			case 'appBarTitle.message': return 'メッセージ';
			case 'appBarTitle.mypage': return 'マイページ';
			case 'appBarTitle.settings': return '設定';
			case 'appBarTitle.home': return 'ホーム';
			case 'appBarTitle.profile': return '写真承認';
			case 'appBarTitle.ageVerification': return '年齢確認';
			case 'appBarTitle.report': return '通報';
			case 'appBarTitle.notifications': return 'お知らせ';
			case 'mypageScreen.ageVerification': return '年齢確認';
			case 'mypageScreen.coinsHeld': return '保有コイン';
			case 'mypageScreen.planStatus': return '会員ステータス';
			case 'mypageScreen.settings': return '設定';
			case 'mypageScreen.notifications': return 'お知らせ';
			case 'settingsScreen.mainSettings': return '各種設定';
			case 'settingsScreen.notificationSettings': return '通知設定';
			case 'settingsScreen.blockUser': return 'ブロックユーザー';
			case 'settingsScreen.otherSettings': return 'その他';
			case 'settingsScreen.operatorCompany': return '運営会社';
			case 'settingsScreen.terms': return '利用規約';
			case 'settingsScreen.privacyPolicy': return 'プライバシーポリシー';
			case 'settingsScreen.indicationBasedOnSpecialCommercialLaw': return '特商法に基づく表示';
			case 'settingsScreen.license': return 'ライセンス';
			case 'settingsScreen.help': return 'ヘルプ';
			case 'settingsScreen.contactUs': return 'お問い合せ';
			default: return null;
		}
	}
}
