project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime "On"
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	includedirs {

		"include"
	}

	files {

		"include/GLFW/glfw3.h",
		"include/GLFW/glfw3native.h",
		"src/glfw_config.h",
		"src/context.c",
		"src/init.c",
		"src/null_init.c",
		"src/null_joystick.c",
		"src/null_monitor.c",
		"src/null_window.c",
		"src/platform.c",
		"src/input.c",
		"src/monitor.c",
		"src/vulkan.c",
		"src/window.c",
		"src/osmesa_context.c",
		"src/egl_context.c"
	}

	filter "system:windows"

		systemversion "latest"

		defines {

			"_GLFW_WIN32",
			"_CRT_SECURE_NO_WARNINGS"
		}

		files {

			"src/win32_init.c",
			"src/win32_joystick.c",
			"src/win32_monitor.c",
			"src/win32_module.c",
			"src/win32_time.c",
			"src/win32_thread.c",
			"src/win32_window.c",
			"src/wgl_context.c"
		}

	filter "configurations:Debug"
		defines "VULTURE_DEBUG"
		runtime "Debug"
		symbols "On"

	filter "configurations:Release"
		defines "VULTURE_RELEASE"
		runtime "Debug"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		defines "VULTURE_DIST"
		runtime "Release"
		optimize "On"
