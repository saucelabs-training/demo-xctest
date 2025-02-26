DERIVED_DATA_PATH=build_counter_app
OUTPUT_DIR=../../app_binaries/fake_counter_all_binaries

build-for-testing:
	xcodebuild \
	  -scheme FakeCounterAppTest \
	  -sdk iphoneos \
	  -derivedDataPath $(DERIVED_DATA_PATH) \
	  build-for-testing

make-ipa-files: build-for-testing
	mkdir -p Payload
	cp -r $(DERIVED_DATA_PATH)/Build/Products/Debug-iphoneos/FakeCounterApp.app Payload
	zip -r $(OUTPUT_DIR)/FakeCounterApp.ipa Payload
	rm -rf Payload

	mkdir Payload
	cp -r $(DERIVED_DATA_PATH)/Build/Products/Debug-iphoneos/FakeCounterAppUITests-Runner.app Payload
	zip -r $(OUTPUT_DIR)/FakeCounterAppUITests-Runner.ipa Payload
	rm -rf Payload

	mkdir Payload
	cp -r $(DERIVED_DATA_PATH)/Build/Products/Debug-iphoneos/FakeCounterDuplicateApp.app Payload
	zip -r $(OUTPUT_DIR)/FakeCounterDuplicateApp.ipa Payload
	rm -rf Payload

	mkdir Payload
	cp -r $(DERIVED_DATA_PATH)/Build/Products/Debug-iphoneos/FakeCounterDuplicateAppUITests-Runner.app Payload
	zip -r $(OUTPUT_DIR)/FakeCounterDuplicateAppUITests-Runner.ipa Payload
	rm -rf Payload

	mkdir Payload
	cp -r $(DERIVED_DATA_PATH)/Build/Products/Debug-iphoneos/NoTestTargetAppUITests-Runner.app Payload
	zip -r $(OUTPUT_DIR)/NoTestTargetAppUITests-Runner.ipa Payload
	rm -rf Payload

	cp $(DERIVED_DATA_PATH)/Build/Products/FakeCounterAppTest*.xctestrun $(OUTPUT_DIR)/../fake_counter_xctestrun_file/all_test_types_xctestrun_file

	@echo "Build artifacts moved to $(OUTPUT_DIR)"
	ls $(OUTPUT_DIR)

.DEFAULT_GOAL := make-ipa-files