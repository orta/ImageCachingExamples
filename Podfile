use_frameworks!
target 'ImageCachingExamples' do
  pod "SDWebImage"

  target 'ImageCachingExamplesTests' do
    inherit! :search_paths

    pod "Quick"
    pod "Nimble-Snapshots"
    
    # Temporary, should be removed post CP 1.0
    # https://github.com/facebook/ios-snapshot-test-case/pull/141
    pod 'FBSnapshotTestCase', git: 'https://github.com/orta/ios-snapshot-test-case.git'
  end
end