build-fake-counter-app:
	cd app_source/FakeCounterApp && $(MAKE) --no-builtin-rules

.DEFAULT_GOAL := build-fake-counter-app