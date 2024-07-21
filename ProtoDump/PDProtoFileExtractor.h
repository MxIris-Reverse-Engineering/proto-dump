//
//  PDProtoFileExtractor.h
//  proto-dump
//
//  Copyright (c) 2013 Sean Patrick O'Brien. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@class PDProtoFile;

extern NSString * const PDProtoFileExtractorErrorDomain;

NS_ERROR_ENUM(PDProtoFileExtractorErrorDomain) {
    // The data doesn't contain any .proto descriptors.
    PDProtoFileExtractorErrorDataContainsNoProtobufDescriptors    = 1,
    
    // There was a missing dependency or a dependency loop in the descriptors.
    PDProtoFileExtractorErrorDependencySortingFailed            = 2,
    
    // A problem occured while generating source code for the descriptors.
    PDProtoFileExtractorErrorSourceGenerationFailed                = 3,
};


@interface PDProtoFileExtractor : NSObject

// Finds Protobuf descriptors in the data and returns them as instances of PDProtoFile.
+ (NSArray<PDProtoFile *> *)extractProtoFilesFromData:(NSData *)data error:(NSError **)errorPtr;

+ (BOOL)writeProtoFilesFromData:(NSData *)data toPath:(NSString *)outputPath error:(NSError * _Nullable *)error;

@end

NS_HEADER_AUDIT_END(nullability, sendability)
