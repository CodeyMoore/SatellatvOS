#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// Settings toggles
BOOL kEnabled;
BOOL kUnrestict;

// plist where user settings are stored.
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.codeymoore.satellatvos.plist"

%hook SKPaymentTransaction
- (long long) transactionState { 
	if (kEnabled) { // this sets transactionState to SKPaymentTransactionStatePurchased
		return TRUE;
	} else {
	%orig;
	}
}

- (void) _setTransactionState: (long long) arg1 {
	if (kEnabled) {
		arg1 = TRUE;
	} else {
	%orig;
	}

}
%end

%hook SKPaymentQueue
+ (bool) canMakePayments {
	if (kUnrestict) { // allow restricted users to fake purchase
		return TRUE;
	} else {
	%orig;
	}
}
%end

%hook SKReceiptRefreshRequest
- (bool) _wantsRevoked {
	return false; // make the receipt not revoked
}

- (bool) _wantsExpired {
	return false; // make the receipt not expired
}
%end


static void loadPrefs() {

	NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
  
	  //our preference values that write to a plist file when a user selects somethings
	kEnabled = [([prefs objectForKey:@"kEnabled"] ?: @(YES)) boolValue];
}
