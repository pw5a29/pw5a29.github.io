#import "../PS.h"

@interface UIKeyboardEmoji : NSObject
+ (UIKeyboardEmoji *)emojiWithString:(NSString *)string withVariantMask:(int)mask;
@end

@interface UIKeyboardEmojiCategory : NSObject
@property (retain, nonatomic) NSMutableArray *emoji;
@end

BOOL vulcanAdded;
BOOL flagsAdded;

static UIKeyboardEmoji *emojiFromString(NSString *string, int variant)
{
	UIKeyboardEmoji *emoji = [NSClassFromString(@"UIKeyboardEmoji") emojiWithString:string withVariantMask:variant];
	return emoji;
}

%hook UIKeyboardEmojiCategory

+ (UIKeyboardEmojiCategory *)categoryForType:(int)type
{
	UIKeyboardEmojiCategory *category = %orig;
	NSMutableArray *emojis = category.emoji;
	if (emojis.count > 0) {
		if (type == 1 && !vulcanAdded) {
			[emojis addObject:emojiFromString(@"🖖", @"unicode == 0xD83D", 2)];
			vulcanAdded = YES;
		}
		else if (type == 6 && !flagsAdded) {
			NSString *flagsString = @"🇦🇫 🇦🇱 🇩🇿 🇦🇸 🇦🇩 🇦🇴 🇦🇮 🇦🇬 🇦🇷 🇦🇲 🇦🇼 🇦🇺 🇦🇹 🇦🇿 🇧🇸 🇧🇭 🇧🇩 🇧🇧 🇧🇾 🇧🇪 🇧🇿 🇧🇯 🇧🇲 🇧🇹 🇧🇴 🇧🇦 🇧🇼 🇧🇷 🇧🇳 🇧🇬 🇧🇫 🇧🇮 🇰🇭 🇨🇲 🇨🇦 🇨🇻 🇰🇾 🇨🇫 🇨🇱 🇨🇴 🇰🇲 🇨🇩 🇨🇬 🇨🇰 🇨🇷 🇭🇷 🇨🇺 🇨🇼 🇨🇾 🇨🇿 🇩🇰 🇩🇯 🇩🇲 🇩🇴 🇪🇨 🇪🇬 🇸🇻 🇬🇶 🇪🇷 🇪🇪 🇪🇹 🇫🇴 🇫🇯 🇫🇮 🇫🇷 🇬🇫 🇹🇫 🇬🇦 🇬🇲 🇬🇪 🇬🇭 🇬🇮 🇬🇷 🇬🇩 🇬🇵 🇬🇺 🇬🇹 🇬🇳 🇬🇼 🇬🇾 🇭🇹 🇭🇳 🇭🇰 🇭🇺 🇮🇸 🇮🇳 🇮🇩 🇮🇷 🇮🇶 🇮🇪 🇮🇱 🇨🇮 🇯🇲 🇯🇴 🇰🇿 🇰🇪 🇰🇮 🇰🇼 🇰🇬 🇱🇦 🇱🇻 🇱🇧 🇱🇸 🇱🇷 🇱🇾 🇱🇮 🇱🇹 🇱🇺 🇲🇴 🇲🇰 🇲🇬 🇲🇼 🇲🇾 🇲🇻 🇲🇱 🇲🇹 🇲🇶 🇲🇷 🇲🇽 🇲🇩 🇲🇳 🇲🇪 🇲🇸 🇲🇦 🇲🇿 🇲🇲 🇳🇦 🇳🇵 🇳🇱 🇳🇨 🇳🇿 🇳🇮 🇳🇪 🇳🇬 🇳🇺 🇰🇵 🇲🇵 🇳🇴 🇴🇲 🇵🇰 🇵🇼 🇵🇸 🇵🇦 🇵🇬 🇵🇾 🇵🇪 🇵🇭 🇵🇱 🇵🇹 🇵🇷 🇶🇦 🇷🇴 🇷🇼 🇼🇸 🇸🇲 🇸🇹 🇸🇦 🇸🇳 🇷🇸 🇸🇨 🇸🇱 🇸🇬 🇸🇰 🇸🇮 🇸🇧 🇸🇴 🇿🇦 🇸🇸 🇱🇰 🇸🇩 🇸🇷 🇸🇿 🇸🇪 🇨🇭 🇸🇾 🇹🇯 🇹🇿 🇹🇭 🇹🇱 🇹🇬 🇹🇴 🇹🇹 🇹🇳 🇹🇷 🇹🇲 🇹🇨 🇹🇻 🇺🇬 🇺🇦 🇦🇪 🇺🇾 🇺🇿 🇻🇺 🇻🇪 🇻🇳 🇾🇪 🇿🇲 🇿🇼";
			NSArray *flags = [flagsString componentsSeparatedByString:@" "];
			for (int i = 0; i < flags.count; i++) {
				[emojis addObject:emojiFromString(flags[i], 0)];
			}
			flagsAdded = YES;
		}
	}
	return category;
}

- (void)releaseCategories
{
	%orig;
	vulcanAdded = NO;
	flagsAdded = NO;
}

%end