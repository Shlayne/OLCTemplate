project "olc"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	cdialect "C17"
	staticruntime "On"

	enablemodules "Off"

	prebuildcommands "%{RunPreBuild}"
	targetdir "%{TargetDir}"
	objdir "%{OBJDir}"

	files {
		"include/olcPixelGameEngine.h",
		"src/olcPixelGameEngine.cpp",
	}

	includedirs {
		"include",

		-- Add any project source directories here.
		-- "%{wks.location}/__PROJECT_NAME__/src",

		-- Add any dependency includes here.
		"%{IncludeDirs.stb}",
	}

	filter "system:windows"
		systemversion "latest"
		usestdpreproc "On" -- msvc doesn't provide __VA_OPT__ by default; this fixes that.
		buildoptions "/wd5105" -- Prevents a warning produced at WinBase.h:9528.
		defines "SYSTEM_WINDOWS"

		-- These two are required because visual studio precompiled their module
		-- ifc's with dynamic runtime and imprecise floating point operations.
		-- If modules aren't working, uncomment these two lines.
		--	staticruntime "Off"
		--	floatingpoint "None"

	filter "configurations:Debug"
		runtime "Debug"
		optimize "Debug"
		symbols "Full"
		defines "CONFIG_DEBUG"

	filter "configurations:Release"
		runtime "Release"
		optimize "On"
		symbols "On"
		defines "CONFIG_RELEASE"

	filter "configurations:Dist"
		runtime "Release"
		optimize "Full"
		symbols "Off"
		defines "CONFIG_DIST"
