.PHONY: default
default:
	mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. && make -j$(nprocs)

.PHONY: debug
debug:
	mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j$(nprocs)

.PHONY: test
test: debug
	build/lasutils_tests_suite --reporter=spec

.PHONY: clean
clean:
	rm -rf build
