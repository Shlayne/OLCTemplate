include "BuildExtensions.lua"

workspace "__WORKSPACE_NAME__"
	architecture "x86_64"
	startproject "__PROJECT_NAME__"
	configurations { "Debug", "Release", "Dist" }
	flags { "MultiProcessorCompile" }

	folder { "filter:Solution Items",
		-- Visual Studio
		".editorconfig",

		-- Git
		".gitignore",
		".gitattributes",
		
		-- Misc
		"README.md",
	}

	folder { "filter:Build Scripts",
		-- Scripts
		"Scripts/GenerateProjects.bat",
		"Scripts/PreBuild.bat",

		-- Lua Scripts
		"BuildAll.lua",
		"BuildDependencies.lua",
		"BuildExtensions.lua",

		-- Project Build Scripts
		"__PROJECT_NAME__/Build__PROJECT_NAME__.lua",

		-- Dependency Project Build Scripts
		--	"__PROJECT_NAME__/Dependencies/__DEPENDENCY_NAME__/Build__DEPENDENCY_NAME__.lua",
	}
	
TargetDir = "%{wks.location}/bin/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
OBJDir = "%{wks.location}/bin-int/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/%{prj.name}"
RunPreBuild = "pushd \"%{wks.location}\" && \"Scripts/PreBuild.bat\" && popd"

-- Add any projects here with 'include "Build__EXAMPLE_PROJECT_NAME__.lua"'
include "__PROJECT_NAME__/Build__PROJECT_NAME__.lua"
