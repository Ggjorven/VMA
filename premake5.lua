project "VMA"
	kind "StaticLib"
	language "C++"
	cppdialect "C++14"

	architecture "x86_64"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"src/**.h",
		"src/**.hpp",
		"src/**.cpp",

        "src/Common.h",
        "src/Common.cpp",
        "src/SparseBindingTest.h",
        "src/SparseBindingTest.cpp",
        "src/Tests.h"
        "src/Tests.cpp",
        "src/VmaUsage.h",
        "src/VmaUsage.cpp",
	}

	includedirs
	{
		"include"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "On"

		includedirs
		{
			"%{Dependencies.Vulkan.Windows.IncludeDir}"
		}

	filter "system:linux"
		pic "On"
		systemversion "latest"
		staticruntime "On"

		includedirs
		{
			"%{Dependencies.Vulkan.Linux.IncludeDir}"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "Full"
