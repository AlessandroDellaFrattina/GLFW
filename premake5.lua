project "GLFW"
	kind "StaticLib"
	language "C"
	staticruntime (sruntime)
	targetdir (bin)
	objdir (binint)

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

	filter "system:linux"
		defines "_GLFW_X11"

		files {

			"src/x11_init.c",
			"src/x11_monitor.c",
			"src/x11_window.c",
			"src/xkb_unicode.c",
			"src/posix_time.c",
			"src/posix_thread.c",
			"src/posix_module.c",
			"src/posix_poll.c",
			"src/glx_context.c",
			"src/linux_joystick.c"
		}

	filter "system:macosx"
		defines "_GLFW_COCOA"

		externalincludedirs {

			"include"
		}

		files {

			"src/cocoa_init.m",
			"src/cocoa_joystick.m",
			"src/cocoa_monitor.m",
			"src/cocoa_time.c",
			"src/cocoa_window.m",
			"src/posix_thread.c",
			"src/posix_module.c",
			"src/nsgl_context.m"
		}

	filter "configurations:Debug"
		runtime (debugruntime)
		symbols (debugsymbols)
		optimize (debugoptimize)

	filter "configurations:Release"
		runtime (releaseruntime)
		symbols (releasesymbols)
		optimize (releaseoptimize)

	filter "configurations:Dist"
		runtime (distruntime)
		symbols (distsymbols)
		optimize (distoptimize)
