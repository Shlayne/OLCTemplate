project "OLCTemplate"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++20"
	cdialect "C17"
	staticruntime "On"

	targetdir ("%{wks.location}/bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. OutputDir .. "/%{prj.name}")

	files {
		"src/**.h",
		"src/**.c",
		"src/**.hpp",
		"src/**.cpp",
		"src/**.inl",
		"src/**.ixx"
	}

	includedirs {
		-- Add any project source directories here.
		"src",
		--	"%{wks.location}/__PROJECT_NAME__/src",

		-- Add any dependency includes here.
		"%{IncludeDir.olc}",
		"%{IncludeDir.stb}",
	}

	-- Add any links dependency libs via their project names here.
	links {
		"olc",
		"stb",
	}

	filter "system:windows"
		systemversion "latest"
		usestdpreproc "On"
		buildoptions "/wd5105" -- Until Microsoft updates Windows 10 to not have terrible code (aka never), this must be here to prevent a warning.
		defines "SYSTEM_WINDOWS"

		-- Modules are OP.
		scanformoduledependencies "True"
		enablemodules "On"

		-- msvc doesn't provide __VA_OPT__ by default; this fixes that.
		usestdpreproc "On"

		-- Required because visual studio precompiled their module ifc's
		-- with dynamic linking and imprecise floating point operations.
		staticruntime "Off"
		floatingpoint "None"

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
		kind "WindowedApp"
		runtime "Release"
		optimize "Full"
		symbols "Off"
		defines "CONFIG_DIST"
