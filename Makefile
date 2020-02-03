noop:

debug:
	mkdir -p build
	cd build && cmake .. -DCMAKE_BUILD_TYPE=Debug

release:
	mkdir -p build_release
	cd build_release && cmake .. -DCMAKE_BUILD_TYPE=Release
