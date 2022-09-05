#import "hexConverter.h"

//for the preferences:

//path to the preference file of the tweak
#define prefs @"/var/mobile/Library/Preferences/com.eliofegh.uiswitch-changer.plist"


NSMutableDictionary *MutDiction;

//for the light mode options
static bool isEnabled;
static bool itEnabled;
NSString *stringAnswer;
NSString *sStringAnswer;
UIColor *answer;
UIColor *sAnswer;

//for the dark mode options
static bool isEnabledD;
static bool itEnabledD;
NSString *stringAnswerD;
NSString *sStringAnswerD;
UIColor *answerD;
UIColor *sAnswerD;


void loadprefs(){

 MutDiction = [[NSMutableDictionary alloc] initWithContentsOfFile: prefs];

isEnabled = [[MutDiction objectForKey: @ "enableis"]boolValue];

itEnabled = [[MutDiction objectForKey: @ "enableit"]boolValue];

 stringAnswer = [MutDiction objectForKey: @ "enablevs"];

 sStringAnswer = [MutDiction objectForKey: @ "senablevs"];

   if(stringAnswer)
 answer = [UIColor colorWithHexString:stringAnswer];

  if(sStringAnswer)
 sAnswer = [UIColor colorWithHexString:sStringAnswer];


isEnabledD = [[MutDiction objectForKey: @ "enableisD"]boolValue];

itEnabledD = [[MutDiction objectForKey: @ "enableitD"]boolValue];

 stringAnswerD = [MutDiction objectForKey: @ "enablevsD"];

 sStringAnswerD = [MutDiction objectForKey: @ "senablevsD"];

   if(stringAnswerD)
 answerD = [UIColor colorWithHexString:stringAnswerD];

  if(sStringAnswerD)
 sAnswerD = [UIColor colorWithHexString:sStringAnswerD];

}

//to know when it's light or dark mode
@interface UITraitCollection (twk)

- (NSInteger)userInterfaceStyle;

@end

static NSString *interface;

%hook UISwitch

//to change the on color:
-(BOOL)isOn{

UITraitCollection *myMode;


myMode = self.traitCollection;



interface = [NSString stringWithFormat:@"%ld\n",[myMode userInterfaceStyle]]; //we got the value of the interfaceStyle

if(isEnabled){

  
 if([interface containsString:@"1"]){ 	//if it's 1 then it's light mode

 [self setOnTintColor: answer];
}
}

if(isEnabledD){

if([interface containsString:@"2"]){	//if it's 2 then it's dark mode

 [self setOnTintColor: answerD];
}



}

if(itEnabled){

if([interface containsString:@"1"]){
[self setThumbTintColor: sAnswer];		//this is the same concept but for the thumb color:
}
}

if(itEnabledD){
if([interface containsString:@"2"]){
[self setThumbTintColor: sAnswerD];
}

}


return %orig;			//return %orig if the user don't have the options enabled in settings

}


-(void)setOnTintColor:(id)arg1{

 UITraitCollection *myMode;


myMode = self.traitCollection;



interface = [NSString stringWithFormat:@"%ld\n",[myMode userInterfaceStyle]];


 if(isEnabled){

if([interface containsString:@"1"]){
  return  %orig(answer);
}
}
 
 if(isEnabledD){

if([interface containsString:@"2"]){
  return %orig(answerD);
}

}


 %orig(arg1);

}


%end





%ctor{

  loadprefs();

//for the post notification
CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadprefs, CFSTR("com.eliofegh.uiswitch-changer.settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);


}



