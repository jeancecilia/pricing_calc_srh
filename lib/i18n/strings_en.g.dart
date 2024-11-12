///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsLandingEn landing = _TranslationsLandingEn._(_root);
	@override String get feedbackDialogTitle => 'We Value Your Feedback';
	@override String get feedbackDialogCloseWaitMessage => 'Please wait for 5 seconds';
	@override String get feedbackDialogDescription => 'Help us improve by sharing your experience with the price calculator.';
	@override String get question1 => 'Q.1 How much time did using this calculator save you compared to traditional methods?';
	@override List<String> get timeSavingsOptions => [
		'No time savings',
		'Less than 5 minutes',
		'5-15 minutes',
		'15-30 minutes',
		'More than 30 minutes',
	];
	@override String get question2 => 'Q.2 How easy was it to use the price calculator?';
	@override List<String> get easeOptions => [
		'Very difficult',
		'Difficult',
		'Neutral',
		'Easy',
		'Very easy',
	];
	@override String get question3 => 'Q.3 How accurate were the price suggestions compared to your expectations?';
	@override List<String> get accuracyOptions => [
		'Very inaccurate',
		'Inaccurate',
		'Neutral',
		'Accurate',
		'Very accurate',
	];
	@override String get question4 => 'Q.4 How satisfied are you with the price suggestions provided by the calculator?';
	@override List<String> get satisfactionOptions => [
		'Very dissatisfied',
		'Dissatisfied',
		'Neutral',
		'Satisfied',
		'Very satisfied',
	];
	@override String get submitButtonLabel => 'Submit Feedback';
	@override String get submittingLabel => 'Submitting...';
	@override String get errorMessageIncomplete => 'Please answer all questions';
	@override String get successMessage => 'Feedback submitted successfully';
	@override String get errorMessageGeneral => 'Something went wrong';
	@override String get fixedCostComment => 'Fixed costs are costs that do not change with the level of production or output.';
	@override String get variableCostComment => 'Variable costs are costs that change in proportion to the changes in output or production.';
	@override String get productionQuantity => 'Output quantity per month. Approximately how many units of the product are produced per month?';
	@override String get yourPriceSuggestion => 'Your Price Suggestion';
	@override String get perUnit => 'Per Unit';
	@override String get profitMargin => 'Profit Margin';
}

// Path: landing
class _TranslationsLandingEn implements TranslationsLandingDe {
	_TranslationsLandingEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsLandingNavigationEn navigation = _TranslationsLandingNavigationEn._(_root);
	@override String get hero_title => 'Simplify Your Pricing Strategy – An App Tailored for SMEs';
	@override String get hero_subtitle => 'Optimize your prices and boost your profits with automated calculations.';
	@override String get try_demo => 'Try Demo';
	@override String get features_title => 'Our Key Features';
	@override String get feature_subtitle => 'Explore how we help businesses across various industries achieve growth, optimize operations, and navigate challenges with our expert consulting services.';
	@override List<dynamic> get features => [
		_TranslationsLanding$features$0i0$En._(_root),
		_TranslationsLanding$features$0i1$En._(_root),
		_TranslationsLanding$features$0i2$En._(_root),
	];
	@override String get pricing_calculator_header => 'Instant Pricing Calculator';
	@override String get benefits_subtitle => 'Explore how we help businesses across various industries achieve growth, optimize operations, and navigate challenges with our expert consulting services.';
	@override String get benefits_title => 'Benefits for SMEs';
	@override String get slider_label => 'The percentage of profit you want to add to cover costs and earn profit';
	@override List<dynamic> get benefits => [
		_TranslationsLanding$benefits$0i0$En._(_root),
		_TranslationsLanding$benefits$0i1$En._(_root),
		_TranslationsLanding$benefits$0i2$En._(_root),
		_TranslationsLanding$benefits$0i3$En._(_root),
	];
	@override String get testimonials => 'Testimonials';
	@override String get testimonial_title => 'Our Satisfied Clients';
	@override String get faq_title => 'Frequently Asked Questions';
	@override String get contacts_title => 'Ready to Transform Your Business?';
	@override String get start_your_free_trial => 'Start Your Free Trial';
	@override String get privacy_policy => 'Privacy Policy';
	@override String get terms_and_conditions => 'Terms & Conditions';
	@override String get cookie_policy => 'Cookie Policy';
	@override String get label => 'Label';
	@override String get cost_type => 'Cost Type';
	@override String get price => 'Price';
	@override String get comment => 'Comment';
	@override String get cost_category => 'Cost Category';
	@override String get cost_euro => 'Cost (€)';
	@override String get fixed_cost => 'Fixed Cost';
	@override String get variable_cost => 'Variable Cost';
	@override String get add_row => 'Add Row';
	@override String get set_profit_margin => 'Set Profit Margin';
	@override String get calculate_price => 'Calculate Price';
	@override String get please_fill_all_fields => 'Please fill all fields';
}

// Path: landing.navigation
class _TranslationsLandingNavigationEn implements TranslationsLandingNavigationDe {
	_TranslationsLandingNavigationEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get home => 'Home';
	@override String get features => 'Features';
	@override String get pricing_calculator => 'Pricing Calculator';
	@override String get benefits => 'Benefits';
	@override String get testimonials => 'Testimonials';
	@override String get faq => 'FAQ';
	@override String get contact_us => 'Contact Us';
	@override String get login => 'Login';
	@override String get calculate => 'Calculate';
}

// Path: landing.features.0
class _TranslationsLanding$features$0i0$En implements TranslationsLanding$features$0i0$De {
	_TranslationsLanding$features$0i0$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Instant Price Calculations';
	@override String get description => 'Input your costs and instantly receive an accurate price based on your desired profit margin. No complex calculations needed!';
}

// Path: landing.features.1
class _TranslationsLanding$features$0i1$En implements TranslationsLanding$features$0i1$De {
	_TranslationsLanding$features$0i1$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Real-Time Price Simulations';
	@override String get description => 'Adjust costs or profit margins and instantly see the updated price, helping you explore different scenarios.';
}

// Path: landing.features.2
class _TranslationsLanding$features$0i2$En implements TranslationsLanding$features$0i2$De {
	_TranslationsLanding$features$0i2$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Clear & Simple Dashboard';
	@override String get description => 'View all key metrics at a glance, enabling you to make informed pricing decisions quickly.';
}

// Path: landing.benefits.0
class _TranslationsLanding$benefits$0i0$En implements TranslationsLanding$benefits$0i0$De {
	_TranslationsLanding$benefits$0i0$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Automated Price Calculations';
	@override String get content => 'Input your costs and instantly receive an accurate price based on your desired profit margin. No complex calculations needed!';
}

// Path: landing.benefits.1
class _TranslationsLanding$benefits$0i1$En implements TranslationsLanding$benefits$0i1$De {
	_TranslationsLanding$benefits$0i1$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Save Time';
	@override String get content => 'Automated calculations save you up to 30 minutes per pricing task';
}

// Path: landing.benefits.2
class _TranslationsLanding$benefits$0i2$En implements TranslationsLanding$benefits$0i2$De {
	_TranslationsLanding$benefits$0i2$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cost-effective';
	@override String get content => 'Affordable for SMEs with no need for additional tools.';
}

// Path: landing.benefits.3
class _TranslationsLanding$benefits$0i3$En implements TranslationsLanding$benefits$0i3$De {
	_TranslationsLanding$benefits$0i3$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Simplicity';
	@override String get content => 'No complex IT needed; easy to use for everyone';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'landing.navigation.home': return 'Home';
			case 'landing.navigation.features': return 'Features';
			case 'landing.navigation.pricing_calculator': return 'Pricing Calculator';
			case 'landing.navigation.benefits': return 'Benefits';
			case 'landing.navigation.testimonials': return 'Testimonials';
			case 'landing.navigation.faq': return 'FAQ';
			case 'landing.navigation.contact_us': return 'Contact Us';
			case 'landing.navigation.login': return 'Login';
			case 'landing.navigation.calculate': return 'Calculate';
			case 'landing.hero_title': return 'Simplify Your Pricing Strategy – An App Tailored for SMEs';
			case 'landing.hero_subtitle': return 'Optimize your prices and boost your profits with automated calculations.';
			case 'landing.try_demo': return 'Try Demo';
			case 'landing.features_title': return 'Our Key Features';
			case 'landing.feature_subtitle': return 'Explore how we help businesses across various industries achieve growth, optimize operations, and navigate challenges with our expert consulting services.';
			case 'landing.features.0.title': return 'Instant Price Calculations';
			case 'landing.features.0.description': return 'Input your costs and instantly receive an accurate price based on your desired profit margin. No complex calculations needed!';
			case 'landing.features.1.title': return 'Real-Time Price Simulations';
			case 'landing.features.1.description': return 'Adjust costs or profit margins and instantly see the updated price, helping you explore different scenarios.';
			case 'landing.features.2.title': return 'Clear & Simple Dashboard';
			case 'landing.features.2.description': return 'View all key metrics at a glance, enabling you to make informed pricing decisions quickly.';
			case 'landing.pricing_calculator_header': return 'Instant Pricing Calculator';
			case 'landing.benefits_subtitle': return 'Explore how we help businesses across various industries achieve growth, optimize operations, and navigate challenges with our expert consulting services.';
			case 'landing.benefits_title': return 'Benefits for SMEs';
			case 'landing.slider_label': return 'The percentage of profit you want to add to cover costs and earn profit';
			case 'landing.benefits.0.title': return 'Automated Price Calculations';
			case 'landing.benefits.0.content': return 'Input your costs and instantly receive an accurate price based on your desired profit margin. No complex calculations needed!';
			case 'landing.benefits.1.title': return 'Save Time';
			case 'landing.benefits.1.content': return 'Automated calculations save you up to 30 minutes per pricing task';
			case 'landing.benefits.2.title': return 'Cost-effective';
			case 'landing.benefits.2.content': return 'Affordable for SMEs with no need for additional tools.';
			case 'landing.benefits.3.title': return 'Simplicity';
			case 'landing.benefits.3.content': return 'No complex IT needed; easy to use for everyone';
			case 'landing.testimonials': return 'Testimonials';
			case 'landing.testimonial_title': return 'Our Satisfied Clients';
			case 'landing.faq_title': return 'Frequently Asked Questions';
			case 'landing.contacts_title': return 'Ready to Transform Your Business?';
			case 'landing.start_your_free_trial': return 'Start Your Free Trial';
			case 'landing.privacy_policy': return 'Privacy Policy';
			case 'landing.terms_and_conditions': return 'Terms & Conditions';
			case 'landing.cookie_policy': return 'Cookie Policy';
			case 'landing.label': return 'Label';
			case 'landing.cost_type': return 'Cost Type';
			case 'landing.price': return 'Price';
			case 'landing.comment': return 'Comment';
			case 'landing.cost_category': return 'Cost Category';
			case 'landing.cost_euro': return 'Cost (€)';
			case 'landing.fixed_cost': return 'Fixed Cost';
			case 'landing.variable_cost': return 'Variable Cost';
			case 'landing.add_row': return 'Add Row';
			case 'landing.set_profit_margin': return 'Set Profit Margin';
			case 'landing.calculate_price': return 'Calculate Price';
			case 'landing.please_fill_all_fields': return 'Please fill all fields';
			case 'feedbackDialogTitle': return 'We Value Your Feedback';
			case 'feedbackDialogCloseWaitMessage': return 'Please wait for 5 seconds';
			case 'feedbackDialogDescription': return 'Help us improve by sharing your experience with the price calculator.';
			case 'question1': return 'Q.1 How much time did using this calculator save you compared to traditional methods?';
			case 'timeSavingsOptions.0': return 'No time savings';
			case 'timeSavingsOptions.1': return 'Less than 5 minutes';
			case 'timeSavingsOptions.2': return '5-15 minutes';
			case 'timeSavingsOptions.3': return '15-30 minutes';
			case 'timeSavingsOptions.4': return 'More than 30 minutes';
			case 'question2': return 'Q.2 How easy was it to use the price calculator?';
			case 'easeOptions.0': return 'Very difficult';
			case 'easeOptions.1': return 'Difficult';
			case 'easeOptions.2': return 'Neutral';
			case 'easeOptions.3': return 'Easy';
			case 'easeOptions.4': return 'Very easy';
			case 'question3': return 'Q.3 How accurate were the price suggestions compared to your expectations?';
			case 'accuracyOptions.0': return 'Very inaccurate';
			case 'accuracyOptions.1': return 'Inaccurate';
			case 'accuracyOptions.2': return 'Neutral';
			case 'accuracyOptions.3': return 'Accurate';
			case 'accuracyOptions.4': return 'Very accurate';
			case 'question4': return 'Q.4 How satisfied are you with the price suggestions provided by the calculator?';
			case 'satisfactionOptions.0': return 'Very dissatisfied';
			case 'satisfactionOptions.1': return 'Dissatisfied';
			case 'satisfactionOptions.2': return 'Neutral';
			case 'satisfactionOptions.3': return 'Satisfied';
			case 'satisfactionOptions.4': return 'Very satisfied';
			case 'submitButtonLabel': return 'Submit Feedback';
			case 'submittingLabel': return 'Submitting...';
			case 'errorMessageIncomplete': return 'Please answer all questions';
			case 'successMessage': return 'Feedback submitted successfully';
			case 'errorMessageGeneral': return 'Something went wrong';
			case 'fixedCostComment': return 'Fixed costs are costs that do not change with the level of production or output.';
			case 'variableCostComment': return 'Variable costs are costs that change in proportion to the changes in output or production.';
			case 'productionQuantity': return 'Output quantity per month. Approximately how many units of the product are produced per month?';
			case 'yourPriceSuggestion': return 'Your Price Suggestion';
			case 'perUnit': return 'Per Unit';
			case 'profitMargin': return 'Profit Margin';
			default: return null;
		}
	}
}

