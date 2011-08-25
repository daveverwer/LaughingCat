#import "LaughingCatViewController.h"

@implementation LaughingCatViewController

@synthesize catHeadButton = _catHeadButton;
@synthesize audioPlayer = _audioPlayer;

- (void)viewDidLoad
{
  [super viewDidLoad];

  // Load in the sound file ready for playing
  NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"Laugh" ofType:@"wav"];
  NSURL *soundURL = [NSURL fileURLWithPath:soundFilePath];
  self.audioPlayer = [[[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil] autorelease];
  [self.audioPlayer prepareToPlay];
}

- (IBAction)catHeadButtonTapped:(id)sender
{
  // Play the laugh sound file
  [self.audioPlayer stop];
  self.audioPlayer.currentTime = 0;
  [self.audioPlayer play];

  // Animate the cat's head up and down a few times
  [UIView animateWithDuration:0.1
                        delay:0
                      options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat
                   animations:^{
                     [UIView setAnimationRepeatCount:6];
                     self.catHeadButton.transform = CGAffineTransformMakeTranslation(-3, 10);
                   }
                   completion:^(BOOL finished) {
                     self.catHeadButton.transform = CGAffineTransformMakeTranslation(0, 0);
                   }];
}

- (void)dealloc
{
  [_catHeadButton release];
  [_audioPlayer release];
  [super dealloc];
}

@end
