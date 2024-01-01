from conan import ConanFile
from conan.tools.cmake import CMake


class CodePP(ConanFile):
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeToolchain", "CMakeDeps"

    def requirements(self):
        # self.requires("hdf5/[>=1.14]")
        pass

    def build_requirements(self):
        self.tool_requires("cmake/[>=3.22.6]")
        self.tool_requires("ninja/[>=1]")

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
