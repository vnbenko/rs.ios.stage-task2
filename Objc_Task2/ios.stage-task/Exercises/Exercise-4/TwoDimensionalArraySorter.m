#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    NSSortDescriptor* sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                     ascending:YES
                                                                      selector:@selector(localizedCompare:)];
    
    NSArray *obtainedArray = [self obtainArray:array];
    
    if ([obtainedArray.firstObject isKindOfClass:[NSNumber class]]) {
        return [obtainedArray sortedArrayUsingSelector:@selector(compare:)];
        
    } else if ([obtainedArray.firstObject isKindOfClass:[NSString class]]) {
        return [obtainedArray sortedArrayUsingDescriptors:@[sortDescriptor]];
    }
    return @[];    
}

- (NSArray *) obtainArray:(NSArray *)array {
    NSMutableArray *newArray = [NSMutableArray new];
    
    for (NSArray *subarray in array) {
        if ([subarray isKindOfClass:[NSArray class]]) {
            [newArray addObjectsFromArray:subarray];
        }
    }
    return newArray;
}


@end
