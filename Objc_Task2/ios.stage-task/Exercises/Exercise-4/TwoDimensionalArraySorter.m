#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil || array.count == 0 || ![array[0] isKindOfClass:NSArray.class]){
        return @[];
    }
    
    NSMutableArray *numbersArray = [NSMutableArray new];
    NSMutableArray *stringsArray = [NSMutableArray new];
    NSMutableArray *fullArray = [NSMutableArray new];
    
    for (NSArray *subArray in array) {
            if ([subArray.firstObject isKindOfClass:NSNumber.class]) {
                [numbersArray addObjectsFromArray:(subArray)];
                [numbersArray sortUsingSelector:@selector(compare:)];
            } else if ([subArray.firstObject isKindOfClass:NSString.class]) {
                [stringsArray addObjectsFromArray:(subArray)];
                [stringsArray sortUsingSelector:@selector(compare:)];
            }
    }
    
    if (numbersArray.count == 0) {
        [fullArray addObjectsFromArray:stringsArray];
    } else if (stringsArray.count == 0) {
        [fullArray addObjectsFromArray:numbersArray];
    } else {
        [fullArray addObject:numbersArray];
        [fullArray addObject:[stringsArray reverseObjectEnumerator].allObjects];
    }

    return fullArray;
}


    


@end
