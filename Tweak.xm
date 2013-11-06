#import <UIKit/UIKit.h>
#import "substrate.h"


#define kAppleControlCenterSettingsIdentifier				@"com.apple.controlcenter.settings"
#define kAppleControlCenterBrightnessIdentifier				@"com.apple.controlcenter.brightness"
#define kAppleControlCenterMediaControlsIdentifier			@"com.apple.controlcenter.media-controls"
#define kAppleControlCenterAirStuffIdentifier				@"com.apple.controlcenter.air-stuff"
#define kAppleControlCenterQuickLaunchIdentifier			@"com.apple.controlcenter.quick-launch"


#define kHiddenSettingsControlHeight						35
#define kHiddenSettingsControlTag							0xbeef
#define kHiddenSettingsControlSectionIdentifier				@"me.devbug.controlcenter.hiddensettings7"
#define kHiddenSettingsControlCaption						@"SpringBoard Settings"



@interface SBPrototypeController : NSObject
+ (id)sharedInstance;
+ (void)reloadDefaults;
- (void)_hideSettings;
- (void)_showSettings;
- (void)showOrHide;
@end


@protocol SBControlCenterSectionViewControllerDelegate <NSObject>
- (void)sectionWantsControlCenterDismissal:(id)fp8;
- (void)section:(id)fp8 updateStatusText:(id)fp12 reason:(id)fp16;
- (void)noteSectionEnabledStateDidChange:(id)fp8;
@end

@interface SBControlCenterSectionViewController : UIViewController
+ (Class)viewClass;
- (void)setDelegate:(id)fp8;
- (id)delegate;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)noteSettingsDidUpdate:(id)fp8;
- (struct CGSize)contentSizeForOrientation:(int)fp8;
- (BOOL)enabledForOrientation:(int)fp8;
- (id)view;
/*
 com.apple.controlcenter.settings
 com.apple.controlcenter.brightness 
 com.apple.controlcenter.media-controls
 com.apple.controlcenter.air-stuff 
 com.apple.controlcenter.quick-launch 
 */
- (id)sectionIdentifier;
- (void)loadView;
@end

@class SBControlCenterViewController;

@interface SBControlCenterContentView : UIView {
	//NSMutableArray *_dividerViews;
	//UIViewController *_viewController;
	//SBControlCenterGrabberView *_grabberView;
	//SBCCSettingsSectionController *_settingsSection;
	//SBControlCenterSectionViewController *_brightnessSection;
	//SBControlCenterSectionViewController *_mediaControlsSection;
	//SBControlCenterSectionViewController *_airplaySection;
	//SBCCQuickLaunchSectionController *_quickLaunchSection;
}

- (void)setQuickLaunchSection:(id)fp8;
- (SBControlCenterSectionViewController *)quickLaunchSection;
- (void)setAirplaySection:(id)fp8;
- (SBControlCenterSectionViewController *)airplaySection;
- (void)setMediaControlsSection:(id)fp8;
- (SBControlCenterSectionViewController *)mediaControlsSection;
- (void)setBrightnessSection:(id)fp8;
- (SBControlCenterSectionViewController *)brightnessSection;
- (void)setSettingsSection:(id)fp8;
- (SBControlCenterSectionViewController *)settingsSection;
- (void)setGrabberView:(id)fp8;
- (id)grabberView;
- (void)setViewController:(id)fp8;
- (SBControlCenterViewController *)viewController;
- (void)controlCenterDidFinishTransition;
- (void)controlCenterWillBeginTransition;
- (void)controlCenterDidDismiss;
- (void)controlCenterWillPresent;
- (void)layoutSubviews;
- (void)_iPhone_layoutSubviewsInBounds:(struct CGRect)fp8 orientation:(int)fp24;
- (void)_iPad_layoutSubviewsInBounds:(struct CGRect)fp8 orientation:(int)fp24;
- (void)updateSectionVisibility:(id)fp8 animated:(BOOL)fp12;
- (void)updateEnabledSections;
- (void)_removeSectionController:(id)fp8;
- (void)_addSectionController:(id)fp8;
- (float)contentHeightForOrientation:(int)fp8;
- (id)_separatorAtIndex:(unsigned int)fp8;
- (id)_allSections;
@end

@interface SBControlCenterContentContainerView : UIView
- (SBControlCenterContentView *)contentView;
@end

@interface SBControlCenterContainerView : UIView
- (SBControlCenterContentContainerView *)contentContainerView;
@end

@interface SBControlCenterViewController : NSObject /* <..., SBControlCenterSectionViewControllerDelegate, ...>*/ {
	//SBControlCenterContainerView *_containerView;
}
@end

@interface SBControlCenterController : NSObject {
	//SBControlCenterWindow *_window;
	//SBControlCenterRootView *_rootView;
	//SBControlCenterViewController *_viewController;
}
+ (void)notifyControlCenterControl:(id)fp8 didActivate:(BOOL)fp12;
+ (id)sharedInstanceIfExists;
+ (id)sharedInstance;
+ (id)_sharedInstanceCreatingIfNeeded:(BOOL)fp8;
- (BOOL)isFullyRevealed;
- (BOOL)isTransitioning;
- (BOOL)isPresented;
- (id)coveredApplication;
- (BOOL)inGrabberOnlyMode;
- (BOOL)isUILocked;
- (id)_window;
- (BOOL)isGrabberVisible;
- (BOOL)isVisible;
@end

@interface SBUIControlCenterButton : UIButton @end

@interface SBCCButtonLikeSectionView : UIControl {
	//UIView *_darken;
	//SBUIControlCenterButton *_button;
	//SBUIControlCenterLabel *_label;
}
- (void)button:(id)fp8 didChangeState:(int)fp12;
- (void)buttonTapped:(id)fp8;
- (void)setSelected:(BOOL)fp8;
- (void)setHighlighted:(BOOL)fp8;
- (void)setEnabled:(BOOL)fp8;
- (void)layoutSubviews;
- (void)setImage:(id)fp8;
- (void)setText:(id)fp8;
- (void)setNumberOfLines:(int)fp8;
- (void)setFont:(id)fp8;
- (id)font;
- (BOOL)_shouldAnimatePropertyWithKey:(id)fp8;
- (void)dealloc;
- (id)initWithFrame:(struct CGRect)fp8;
@end


@interface SBControlCenterKnockoutView : UIView @end
@interface SBControlCenterSeparatorView : SBControlCenterKnockoutView @end


@interface SBCCHiddenSettingsSectionController : SBControlCenterSectionViewController
- (void)showSettingsTapped:(id)section;
@end

%subclass SBCCHiddenSettingsSectionController : SBControlCenterSectionViewController

+ (Class)viewClass {
	return %c(SBCCButtonLikeSectionView);
}

%new
- (void)showSettingsTapped:(id)section {
	[[%c(SBPrototypeController) sharedInstance] showOrHide];
}

- (void)viewDidLoad {
	%orig;
	
	SBCCButtonLikeSectionView *section = (SBCCButtonLikeSectionView *)self.view;
	[section setText:kHiddenSettingsControlCaption];
	[section addTarget:self action:@selector(showSettingsTapped:) forControlEvents:UIControlEventTouchUpInside];
	[section setFont:[UIFont systemFontOfSize:14]];
}

- (CGSize)contentSizeForOrientation:(int)orientation {
	CGSize size = %orig;
	
	size.height = (UIInterfaceOrientationIsPortrait(orientation) ? kHiddenSettingsControlHeight : kHiddenSettingsControlHeight * 2.0);
	
	return size;
}

- (id)sectionIdentifier {
	return kHiddenSettingsControlSectionIdentifier;
}

- (void)dealloc {
	%orig;
}

- (void)viewWillLayoutSubviews {
	%orig;
}

- (BOOL)enabledForOrientation:(int)orientation {
	return YES;
}

%end



static SBCCHiddenSettingsSectionController *hiddenSettingsController = nil;


%hook SBControlCenterContentView

- (id)_allSections {
	NSArray *sections = %orig;
	NSMutableArray *dividerViews = MSHookIvar<NSMutableArray *>(self, "_dividerViews");
	
	NSMutableArray *newSections = [NSMutableArray array];
	
	for (SBControlCenterSectionViewController *section in sections) {
		if ([section.sectionIdentifier isEqualToString:kAppleControlCenterQuickLaunchIdentifier]) {
			[newSections addObject:hiddenSettingsController];
		}
		[newSections addObject:section];
	}
	
	// divider should be "count of sections - 1"
	if (newSections.count - 1 > dividerViews.count) {
		SBControlCenterSeparatorView *seperator = [[%c(SBControlCenterSeparatorView) alloc] initWithFrame:CGRectMake(0,0,0,0)];
		[seperator setHidden:YES];
		[dividerViews addObject:seperator];
		[self addSubview:seperator];
		[seperator release];
	}
	
	return newSections;
}

- (void)_iPhone_layoutSubviewsInBounds:(CGRect)mainBounds orientation:(int)orientation {
	%orig;
	
	float height = [hiddenSettingsController contentSizeForOrientation:orientation].height;
	
	SBControlCenterSectionViewController *prevSection = nil;
	NSArray *allSections = [self _allSections];
	unsigned int dividerIndex = 0;
	for (SBControlCenterSectionViewController *section in allSections) {
		if (section == hiddenSettingsController) break;
		
		if ([section enabledForOrientation:orientation]) {
			prevSection = section;
			dividerIndex++;
		}
	}
	
	CGRect frame = prevSection.view.frame;
	if ([self.airplaySection enabledForOrientation:orientation])
		frame = self.airplaySection.view.frame;
	else {
		frame.size.height -= height;
		prevSection.view.frame = frame;
		
		NSMutableArray *dividerViews = MSHookIvar<NSMutableArray *>(self, "_dividerViews");
		
		CGRect rect;
		SBControlCenterSeparatorView *seperator = nil;
		
		for (unsigned int i=dividerIndex-1;i<dividerViews.count;i++) {
			seperator = dividerViews[i];
			rect = seperator.frame;
			rect.origin.y -= height;
			seperator.frame = rect;
		}
		
		if (UIInterfaceOrientationIsPortrait(orientation)) {
			seperator = dividerViews[2];
			seperator.hidden = YES;
			
			rect = self.quickLaunchSection.view.frame;
			rect.origin.y -= height;
			rect.size.height += height;
			self.quickLaunchSection.view.frame = rect;
		}
	}
	
	hiddenSettingsController.view.frame = CGRectMake(frame.origin.x, 
													 frame.origin.y + frame.size.height, 
													 frame.size.width, 
													 height);
}

- (void)_iPad_layoutSubviewsInBounds:(CGRect)mainBounds orientation:(int)orientation {
	%orig;
	
	// XXX To do
}

- (float)contentHeightForOrientation:(int)orientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) return %orig;
	if (!UIInterfaceOrientationIsPortrait(orientation)) return %orig;
	
	if ([self.airplaySection enabledForOrientation:orientation]) return %orig;
	
	return %orig - [hiddenSettingsController contentSizeForOrientation:orientation].height;
}

%end


%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
	%orig;
	
	hiddenSettingsController = [[%c(SBCCHiddenSettingsSectionController) alloc] init];
}

%end

