

#import "TPPCollectionViewController.h"
#import "TPPUICollectionViewCell.h"

@implementation TPPCollectionViewController

-(void)viewDidLoad{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.topItem.title = @"PhotoPhun";
    
    [self refreshPhotos];
}

-(void)refreshPhotos{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"https://swapi.co/api/people"];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    
    NSURLSessionDownloadTask *task = [session
        downloadTaskWithRequest:request
        completionHandler: ^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error){
            NSString *reponseText = [[NSString alloc] initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
            NSLog(@"ResponseText: %@", reponseText);
    }];
    
    [task resume];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 49;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TPPUICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoPhunCell" forIndexPath:indexPath];
    
    cell.photoView.image = [UIImage imageNamed: @"tallBike"];
    
    return cell;
}

@end
