#include <opencv2/core.hpp>

using namespace std;
using namespace cv;

extern "C" {
	// Attributes to prevent 'unused' function from being removed and to make it visible
	__attribute__((visibility("default"))) __attribute__((used))
	const char* version() {
		return CV_VERSION;
	}
}