//
//  ProtoDumpUnitTests.m
//  ProtoDumpUnitTests
//
//  Copyright (c) 2013 Sean Patrick O'Brien. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "PDProtoFile.h"
#import "PDProtoFileExtractor.h"


@interface ProtoDumpUnitTests : XCTestCase

@end

@implementation ProtoDumpUnitTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExtractingAddressBook
{
	NSBundle *bundle = [NSBundle bundleForClass:[self class]];
	NSString *inputDataPath = @"/Volumes/FrameworkLab/Numbers/Frameworks/TSUtility.framework/Versions/A/TSUtility";
	
	NSData *inputData = [NSData dataWithContentsOfFile:inputDataPath];
	
//	XCTAssertNotNil(inputData, @"Unable to load input data");
//	XCTAssertNotNil(expectedOutputData, @"Unable to load expected output data");
//	XCTAssertNotNil(expectedOutputString, @"Unable to create expected output string");
	
	if (inputData == nil) {
		return;
	}
    NSError *error = nil;
    
    [PDProtoFileExtractor writeProtoFilesFromData:inputData toPath:@"/Volumes/FrameworkLab/Numbers/Proto" error:&error];
    
    NSLog(@"%@", error);
    
//	NSError *error = nil;
//	NSArray *protoFiles = [PDProtoFileExtractor extractProtoFilesFromData:inputData error:&error];
//    for (PDProtoFile *file in protoFiles) {
//        NSLog(@"Path: %@", file.path);
//        NSLog(@"%@", file.source);
//    }
//	XCTAssertNotNil(protoFiles, @"Unable to extract Protobuf descriptors: %@", error);
//	
//	XCTAssert(protoFiles.count == 1, @"Unexpected number of protobuf descriptors");
//	
//	PDProtoFile *protoFile = protoFiles.lastObject;
//	XCTAssertEqualObjects(protoFile.source, expectedOutputString, @"Extracted .proto doesn't match expected output. \"%@\" vs \"%@\"", expectedOutputString, protoFile.source);
}

@end
