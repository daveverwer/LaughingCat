@interface LaughingCatViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIButton *catHeadButton;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

- (IBAction)catHeadButtonTapped:(id)sender;

@end
