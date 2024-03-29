# Generated with: ./c2nim --dynlib:libglfw --typeprefixes ~/Projects/turbo-mush/glfw.h
when defined(windows):
    const libglfw = "glfw.dll"
elif defined(macosx):
    const libglfw = "libglfw.dylib"
else:
    const libglfw = "libglfw.so"

type TGLFWwindow* = cint # this is just an opaque type
type TGLFWmonitor* = cint # this is just an opaque type



#************************************************************************
#  GLFW 3.0 - www.glfw.org
#  A library for OpenGL, window and input
# ------------------------------------------------------------------------
#  Copyright (c) 2002-2006 Marcus Geelnard
#  Copyright (c) 2006-2010 Camilla Berglund <elmindreda@elmindreda.org>
#
#  This software is provided 'as-is', without any express or implied
#  warranty. In no event will the authors be held liable for any damages
#  arising from the use of this software.
#
#  Permission is granted to anyone to use this software for any purpose,
#  including commercial applications, and to alter it and redistribute it
#  freely, subject to the following restrictions:
#
#  1. The origin of this software must not be misrepresented; you must not
#     claim that you wrote the original software. If you use this software
#     in a product, an acknowledgment in the product documentation would
#     be appreciated but is not required.
#
#  2. Altered source versions must be plainly marked as such, and must not
#     be misrepresented as being the original software.
#
#  3. This notice may not be removed or altered from any source
#     distribution.
#
# ***********************************************************************
#************************************************************************
#  Doxygen documentation
# ***********************************************************************
#! @defgroup clipboard Clipboard support
#
#! @defgroup context Context handling
#
#! @defgroup error Error handling
#
#! @defgroup init Initialization and version information
#
#! @defgroup input Input handling
#
#! @defgroup monitor Monitor handling
#
#   This is the reference documentation for monitor related functions and types.
#   For more information, see the @ref monitor.
#
#! @defgroup time Time input
#
#! @defgroup window Window handling
#
#   This is the reference documentation for window related functions and types,
#   including creation, deletion and event polling.  For more information, see
#   the @ref window.
#
#************************************************************************
#  Global definitions
# ***********************************************************************
# ------------------- BEGIN SYSTEM/COMPILER SPECIFIC --------------------
# Please report any problems that you find with your compiler, which may
#  be solved in this section! There are several compilers that I have not
#  been able to test this file with yet.
#
#  First: If we are we on Windows, we want a single define for it (_WIN32)
#  (Note: For Cygwin the compiler flag -mwin32 should be used, but to
#  make sure that things run smoothly for Cygwin users, we add __CYGWIN__
#  to the list of "valid Win32 identifiers", which removes the need for
#  -mwin32)
#

# -------------------- END SYSTEM/COMPILER SPECIFIC ---------------------
#************************************************************************
#  GLFW API tokens
# ***********************************************************************
#! @name GLFW version macros
#   @{
#! @brief The major version number of the GLFW library.
#
#   This is incremented when the API is changed in non-compatible ways.
#   @ingroup init
#

const
  GLFW_VERSION_MAJOR* = 3

#! @brief The minor version number of the GLFW library.
#
#   This is incremented when features are added to the API but it remains
#   backward-compatible.
#   @ingroup init
#

const
  GLFW_VERSION_MINOR* = 0

#! @brief The revision number of the GLFW library.
#
#   This is incremented when a bug fix release is made that does not contain any
#   API changes.
#   @ingroup init
#

const
  GLFW_VERSION_REVISION* = 3

#! @}
#! @name Key and button actions
#   @{
#! @brief The key or button was released.
#   @ingroup input
#

const
  GLFW_RELEASE* = 0

#! @brief The key or button was pressed.
#   @ingroup input
#

const
  GLFW_PRESS* = 1

#! @brief The key was held down until it repeated.
#   @ingroup input
#

const
  GLFW_REPEAT* = 2

#! @}
#! @defgroup keys Keyboard keys
#
#  These key codes are inspired by the *USB HID Usage Tables v1.12* (p. 53-60),
#  but re-arranged to map to 7-bit ASCII for printable keys (function keys are
#  put in the 256+ range).
#
#  The naming of the key codes follow these rules:
#   - The US keyboard layout is used
#   - Names of printable alpha-numeric characters are used (e.g. "A", "R",
#     "3", etc.)
#   - For non-alphanumeric characters, Unicode:ish names are used (e.g.
#     "COMMA", "LEFT_SQUARE_BRACKET", etc.). Note that some names do not
#     correspond to the Unicode standard (usually for brevity)
#   - Keys that lack a clear US mapping are named "WORLD_x"
#   - For non-printable keys, custom names are used (e.g. "F4",
#     "BACKSPACE", etc.)
#
#   @ingroup input
#   @{
#
# The unknown key

const
  GLFW_KEY_UNKNOWN* = - 1

# Printable keys

const
  GLFW_KEY_SPACE* = 32
  GLFW_KEY_APOSTROPHE* = 39   # '
  GLFW_KEY_COMMA* = 44        # ,
  GLFW_KEY_MINUS* = 45        # -
  GLFW_KEY_PERIOD* = 46       # .
  GLFW_KEY_SLASH* = 47        # /
  GLFW_KEY_0* = 48
  GLFW_KEY_1* = 49
  GLFW_KEY_2* = 50
  GLFW_KEY_3* = 51
  GLFW_KEY_4* = 52
  GLFW_KEY_5* = 53
  GLFW_KEY_6* = 54
  GLFW_KEY_7* = 55
  GLFW_KEY_8* = 56
  GLFW_KEY_9* = 57
  GLFW_KEY_SEMICOLON* = 59    # ;
  GLFW_KEY_EQUAL* = 61        # =
  GLFW_KEY_A* = 65
  GLFW_KEY_B* = 66
  GLFW_KEY_C* = 67
  GLFW_KEY_D* = 68
  GLFW_KEY_E* = 69
  GLFW_KEY_F* = 70
  GLFW_KEY_G* = 71
  GLFW_KEY_H* = 72
  GLFW_KEY_I* = 73
  GLFW_KEY_J* = 74
  GLFW_KEY_K* = 75
  GLFW_KEY_L* = 76
  GLFW_KEY_M* = 77
  GLFW_KEY_N* = 78
  GLFW_KEY_O* = 79
  GLFW_KEY_P* = 80
  GLFW_KEY_Q* = 81
  GLFW_KEY_R* = 82
  GLFW_KEY_S* = 83
  GLFW_KEY_T* = 84
  GLFW_KEY_U* = 85
  GLFW_KEY_V* = 86
  GLFW_KEY_W* = 87
  GLFW_KEY_X* = 88
  GLFW_KEY_Y* = 89
  GLFW_KEY_Z* = 90
  GLFW_KEY_LEFT_BRACKET* = 91 # [
  GLFW_KEY_BACKSLASH* = 92    # \
  GLFW_KEY_RIGHT_BRACKET* = 93 # ]
  GLFW_KEY_GRAVE_ACCENT* = 96 # `
  GLFW_KEY_WORLD_1* = 161     # non-US #1
  GLFW_KEY_WORLD_2* = 162     # non-US #2

# Function keys

const
  GLFW_KEY_ESCAPE* = 256
  GLFW_KEY_ENTER* = 257
  GLFW_KEY_TAB* = 258
  GLFW_KEY_BACKSPACE* = 259
  GLFW_KEY_INSERT* = 260
  GLFW_KEY_DELETE* = 261
  GLFW_KEY_RIGHT* = 262
  GLFW_KEY_LEFT* = 263
  GLFW_KEY_DOWN* = 264
  GLFW_KEY_UP* = 265
  GLFW_KEY_PAGE_UP* = 266
  GLFW_KEY_PAGE_DOWN* = 267
  GLFW_KEY_HOME* = 268
  GLFW_KEY_END* = 269
  GLFW_KEY_CAPS_LOCK* = 280
  GLFW_KEY_SCROLL_LOCK* = 281
  GLFW_KEY_NUM_LOCK* = 282
  GLFW_KEY_PRINT_SCREEN* = 283
  GLFW_KEY_PAUSE* = 284
  GLFW_KEY_F1* = 290
  GLFW_KEY_F2* = 291
  GLFW_KEY_F3* = 292
  GLFW_KEY_F4* = 293
  GLFW_KEY_F5* = 294
  GLFW_KEY_F6* = 295
  GLFW_KEY_F7* = 296
  GLFW_KEY_F8* = 297
  GLFW_KEY_F9* = 298
  GLFW_KEY_F10* = 299
  GLFW_KEY_F11* = 300
  GLFW_KEY_F12* = 301
  GLFW_KEY_F13* = 302
  GLFW_KEY_F14* = 303
  GLFW_KEY_F15* = 304
  GLFW_KEY_F16* = 305
  GLFW_KEY_F17* = 306
  GLFW_KEY_F18* = 307
  GLFW_KEY_F19* = 308
  GLFW_KEY_F20* = 309
  GLFW_KEY_F21* = 310
  GLFW_KEY_F22* = 311
  GLFW_KEY_F23* = 312
  GLFW_KEY_F24* = 313
  GLFW_KEY_F25* = 314
  GLFW_KEY_KP_0* = 320
  GLFW_KEY_KP_1* = 321
  GLFW_KEY_KP_2* = 322
  GLFW_KEY_KP_3* = 323
  GLFW_KEY_KP_4* = 324
  GLFW_KEY_KP_5* = 325
  GLFW_KEY_KP_6* = 326
  GLFW_KEY_KP_7* = 327
  GLFW_KEY_KP_8* = 328
  GLFW_KEY_KP_9* = 329
  GLFW_KEY_KP_DECIMAL* = 330
  GLFW_KEY_KP_DIVIDE* = 331
  GLFW_KEY_KP_MULTIPLY* = 332
  GLFW_KEY_KP_SUBTRACT* = 333
  GLFW_KEY_KP_ADD* = 334
  GLFW_KEY_KP_ENTER* = 335
  GLFW_KEY_KP_EQUAL* = 336
  GLFW_KEY_LEFT_SHIFT* = 340
  GLFW_KEY_LEFT_CONTROL* = 341
  GLFW_KEY_LEFT_ALT* = 342
  GLFW_KEY_LEFT_SUPER* = 343
  GLFW_KEY_RIGHT_SHIFT* = 344
  GLFW_KEY_RIGHT_CONTROL* = 345
  GLFW_KEY_RIGHT_ALT* = 346
  GLFW_KEY_RIGHT_SUPER* = 347
  GLFW_KEY_MENU* = 348
  GLFW_KEY_LAST* = GLFW_KEY_MENU

#! @}
#! @defgroup mods Modifier key flags
#   @ingroup input
#   @{
#! @brief If this bit is set one or more Shift keys were held down.
#

const
  GLFW_MOD_SHIFT* = 0x00000001

#! @brief If this bit is set one or more Control keys were held down.
#

const
  GLFW_MOD_CONTROL* = 0x00000002

#! @brief If this bit is set one or more Alt keys were held down.
#

const
  GLFW_MOD_ALT* = 0x00000004

#! @brief If this bit is set one or more Super keys were held down.
#

const
  GLFW_MOD_SUPER* = 0x00000008

#! @}
#! @defgroup buttons Mouse buttons
#   @ingroup input
#   @{

const
  GLFW_MOUSE_BUTTON_1* = 0
  GLFW_MOUSE_BUTTON_2* = 1
  GLFW_MOUSE_BUTTON_3* = 2
  GLFW_MOUSE_BUTTON_4* = 3
  GLFW_MOUSE_BUTTON_5* = 4
  GLFW_MOUSE_BUTTON_6* = 5
  GLFW_MOUSE_BUTTON_7* = 6
  GLFW_MOUSE_BUTTON_8* = 7
  GLFW_MOUSE_BUTTON_LAST* = GLFW_MOUSE_BUTTON_8
  GLFW_MOUSE_BUTTON_LEFT* = GLFW_MOUSE_BUTTON_1
  GLFW_MOUSE_BUTTON_RIGHT* = GLFW_MOUSE_BUTTON_2
  GLFW_MOUSE_BUTTON_MIDDLE* = GLFW_MOUSE_BUTTON_3

#! @}
#! @defgroup joysticks Joysticks
#   @ingroup input
#   @{

const
  GLFW_JOYSTICK_1* = 0
  GLFW_JOYSTICK_2* = 1
  GLFW_JOYSTICK_3* = 2
  GLFW_JOYSTICK_4* = 3
  GLFW_JOYSTICK_5* = 4
  GLFW_JOYSTICK_6* = 5
  GLFW_JOYSTICK_7* = 6
  GLFW_JOYSTICK_8* = 7
  GLFW_JOYSTICK_9* = 8
  GLFW_JOYSTICK_10* = 9
  GLFW_JOYSTICK_11* = 10
  GLFW_JOYSTICK_12* = 11
  GLFW_JOYSTICK_13* = 12
  GLFW_JOYSTICK_14* = 13
  GLFW_JOYSTICK_15* = 14
  GLFW_JOYSTICK_16* = 15
  GLFW_JOYSTICK_LAST* = GLFW_JOYSTICK_16

#! @}
#! @defgroup errors Error codes
#   @ingroup error
#   @{
#! @brief GLFW has not been initialized.
#

const
  GLFW_NOT_INITIALIZED* = 0x00010001

#! @brief No context is current for this thread.
#

const
  GLFW_NO_CURRENT_CONTEXT* = 0x00010002

#! @brief One of the enum parameters for the function was given an invalid
#   enum.
#

const
  GLFW_INVALID_ENUM* = 0x00010003

#! @brief One of the parameters for the function was given an invalid value.
#

const
  GLFW_INVALID_VALUE* = 0x00010004

#! @brief A memory allocation failed.
#

const
  GLFW_OUT_OF_MEMORY* = 0x00010005

#! @brief GLFW could not find support for the requested client API on the
#   system.
#

const
  GLFW_API_UNAVAILABLE* = 0x00010006

#! @brief The requested client API version is not available.
#

const
  GLFW_VERSION_UNAVAILABLE* = 0x00010007

#! @brief A platform-specific error occurred that does not match any of the
#   more specific categories.
#

const
  GLFW_PLATFORM_ERROR* = 0x00010008

#! @brief The clipboard did not contain data in the requested format.
#

const
  GLFW_FORMAT_UNAVAILABLE* = 0x00010009

#! @}

const
  GLFW_FOCUSED* = 0x00020001
  GLFW_ICONIFIED* = 0x00020002
  GLFW_RESIZABLE* = 0x00020003
  GLFW_VISIBLE* = 0x00020004
  GLFW_DECORATED* = 0x00020005
  GLFW_RED_BITS* = 0x00021001
  GLFW_GREEN_BITS* = 0x00021002
  GLFW_BLUE_BITS* = 0x00021003
  GLFW_ALPHA_BITS* = 0x00021004
  GLFW_DEPTH_BITS* = 0x00021005
  GLFW_STENCIL_BITS* = 0x00021006
  GLFW_ACCUM_RED_BITS* = 0x00021007
  GLFW_ACCUM_GREEN_BITS* = 0x00021008
  GLFW_ACCUM_BLUE_BITS* = 0x00021009
  GLFW_ACCUM_ALPHA_BITS* = 0x0002100A
  GLFW_AUX_BUFFERS* = 0x0002100B
  GLFW_STEREO* = 0x0002100C
  GLFW_SAMPLES* = 0x0002100D
  GLFW_SRGB_CAPABLE* = 0x0002100E
  GLFW_REFRESH_RATE* = 0x0002100F
  GLFW_CLIENT_API* = 0x00022001
  GLFW_CONTEXT_VERSION_MAJOR* = 0x00022002
  GLFW_CONTEXT_VERSION_MINOR* = 0x00022003
  GLFW_CONTEXT_REVISION* = 0x00022004
  GLFW_CONTEXT_ROBUSTNESS* = 0x00022005
  GLFW_OPENGL_FORWARD_COMPAT* = 0x00022006
  GLFW_OPENGL_DEBUG_CONTEXT* = 0x00022007
  GLFW_OPENGL_PROFILE* = 0x00022008
  GLFW_OPENGL_API* = 0x00030001
  GLFW_OPENGL_ES_API* = 0x00030002
  GLFW_NO_ROBUSTNESS* = 0
  GLFW_NO_RESET_NOTIFICATION* = 0x00031001
  GLFW_LOSE_CONTEXT_ON_RESET* = 0x00031002
  GLFW_OPENGL_ANY_PROFILE* = 0
  GLFW_OPENGL_CORE_PROFILE* = 0x00032001
  GLFW_OPENGL_COMPAT_PROFILE* = 0x00032002
  GLFW_CURSOR* = 0x00033001
  GLFW_STICKY_KEYS* = 0x00033002
  GLFW_STICKY_MOUSE_BUTTONS* = 0x00033003
  GLFW_CURSOR_NORMAL* = 0x00034001
  GLFW_CURSOR_HIDDEN* = 0x00034002
  GLFW_CURSOR_DISABLED* = 0x00034003
  GLFW_CONNECTED* = 0x00040001
  GLFW_DISCONNECTED* = 0x00040002

#************************************************************************
#  GLFW API types
# ***********************************************************************
#! @brief Client API function pointer type.
#
#   Generic function pointer used for returning client API function pointers
#   without forcing a cast from a regular pointer.
#
#   @ingroup context
#

type
  TGLFWglproc* = proc ()

#! @brief Opaque monitor object.
#
#   Opaque monitor object.
#
#   @ingroup monitor
#


#! @brief Opaque window object.
#
#   Opaque window object.
#
#   @ingroup window
#


#! @brief The function signature for error callbacks.
#
#   This is the function signature for error callback functions.
#
#   @param[in] error An [error code](@ref errors).
#   @param[in] description A UTF-8 encoded string describing the error.
#
#   @sa glfwSetErrorCallback
#
#   @ingroup error
#

type
  TGLFWerrorfun* = proc (a2: cint; a3: cstring)

#! @brief The function signature for window position callbacks.
#
#   This is the function signature for window position callback functions.
#
#   @param[in] window The window that the user moved.
#   @param[in] xpos The new x-coordinate, in screen coordinates, of the
#   upper-left corner of the client area of the window.
#   @param[in] ypos The new y-coordinate, in screen coordinates, of the
#   upper-left corner of the client area of the window.
#
#   @sa glfwSetWindowPosCallback
#
#   @ingroup window
#

type
  TGLFWwindowposfun* = proc (a2: ptr TGLFWwindow; a3: cint; a4: cint)

#! @brief The function signature for window resize callbacks.
#
#   This is the function signature for window size callback functions.
#
#   @param[in] window The window that the user resized.
#   @param[in] width The new width, in screen coordinates, of the window.
#   @param[in] height The new height, in screen coordinates, of the window.
#
#   @sa glfwSetWindowSizeCallback
#
#   @ingroup window
#

type
  TGLFWwindowsizefun* = proc (a2: ptr TGLFWwindow; a3: cint; a4: cint)

#! @brief The function signature for window close callbacks.
#
#   This is the function signature for window close callback functions.
#
#   @param[in] window The window that the user attempted to close.
#
#   @sa glfwSetWindowCloseCallback
#
#   @ingroup window
#

type
  TGLFWwindowclosefun* = proc (a2: ptr TGLFWwindow)

#! @brief The function signature for window content refresh callbacks.
#
#   This is the function signature for window refresh callback functions.
#
#   @param[in] window The window whose content needs to be refreshed.
#
#   @sa glfwSetWindowRefreshCallback
#
#   @ingroup window
#

type
  TGLFWwindowrefreshfun* = proc (a2: ptr TGLFWwindow)

#! @brief The function signature for window focus/defocus callbacks.
#
#   This is the function signature for window focus callback functions.
#
#   @param[in] window The window that was focused or defocused.
#   @param[in] focused `GL_TRUE` if the window was focused, or `GL_FALSE` if
#   it was defocused.
#
#   @sa glfwSetWindowFocusCallback
#
#   @ingroup window
#

type
  TGLFWwindowfocusfun* = proc (a2: ptr TGLFWwindow; a3: cint)

#! @brief The function signature for window iconify/restore callbacks.
#
#   This is the function signature for window iconify/restore callback
#   functions.
#
#   @param[in] window The window that was iconified or restored.
#   @param[in] iconified `GL_TRUE` if the window was iconified, or `GL_FALSE`
#   if it was restored.
#
#   @sa glfwSetWindowIconifyCallback
#
#   @ingroup window
#

type
  TGLFWwindowiconifyfun* = proc (a2: ptr TGLFWwindow; a3: cint)

#! @brief The function signature for framebuffer resize callbacks.
#
#   This is the function signature for framebuffer resize callback
#   functions.
#
#   @param[in] window The window whose framebuffer was resized.
#   @param[in] width The new width, in pixels, of the framebuffer.
#   @param[in] height The new height, in pixels, of the framebuffer.
#
#   @sa glfwSetFramebufferSizeCallback
#
#   @ingroup window
#

type
  TGLFWframebuffersizefun* = proc (a2: ptr TGLFWwindow; a3: cint; a4: cint)

#! @brief The function signature for mouse button callbacks.
#
#   This is the function signature for mouse button callback functions.
#
#   @param[in] window The window that received the event.
#   @param[in] button The [mouse button](@ref buttons) that was pressed or
#   released.
#   @param[in] action One of `GLFW_PRESS` or `GLFW_RELEASE`.
#   @param[in] mods Bit field describing which [modifier keys](@ref mods) were
#   held down.
#
#   @sa glfwSetMouseButtonCallback
#
#   @ingroup input
#

type
  TGLFWmousebuttonfun* = proc (a2: ptr TGLFWwindow; a3: cint; a4: cint; a5: cint)

#! @brief The function signature for cursor position callbacks.
#
#   This is the function signature for cursor position callback functions.
#
#   @param[in] window The window that received the event.
#   @param[in] xpos The new x-coordinate of the cursor.
#   @param[in] ypos The new y-coordinate of the cursor.
#
#   @sa glfwSetCursorPosCallback
#
#   @ingroup input
#

type
  TGLFWcursorposfun* = proc (a2: ptr TGLFWwindow; a3: cdouble; a4: cdouble)

#! @brief The function signature for cursor enter/leave callbacks.
#
#   This is the function signature for cursor enter/leave callback functions.
#
#   @param[in] window The window that received the event.
#   @param[in] entered `GL_TRUE` if the cursor entered the window's client
#   area, or `GL_FALSE` if it left it.
#
#   @sa glfwSetCursorEnterCallback
#
#   @ingroup input
#

type
  TGLFWcursorenterfun* = proc (a2: ptr TGLFWwindow; a3: cint)

#! @brief The function signature for scroll callbacks.
#
#   This is the function signature for scroll callback functions.
#
#   @param[in] window The window that received the event.
#   @param[in] xoffset The scroll offset along the x-axis.
#   @param[in] yoffset The scroll offset along the y-axis.
#
#   @sa glfwSetScrollCallback
#
#   @ingroup input
#

type
  TGLFWscrollfun* = proc (a2: ptr TGLFWwindow; a3: cdouble; a4: cdouble)

#! @brief The function signature for keyboard key callbacks.
#
#   This is the function signature for keyboard key callback functions.
#
#   @param[in] window The window that received the event.
#   @param[in] key The [keyboard key](@ref keys) that was pressed or released.
#   @param[in] scancode The system-specific scancode of the key.
#   @param[in] action @ref GLFW_PRESS, @ref GLFW_RELEASE or @ref GLFW_REPEAT.
#   @param[in] mods Bit field describing which [modifier keys](@ref mods) were
#   held down.
#
#   @sa glfwSetKeyCallback
#
#   @ingroup input
#

type
  TGLFWkeyfun* = proc (a2: ptr TGLFWwindow; a3: cint; a4: cint; a5: cint;
                       a6: cint)

#! @brief The function signature for Unicode character callbacks.
#
#   This is the function signature for Unicode character callback functions.
#
#   @param[in] window The window that received the event.
#   @param[in] character The Unicode code point of the character.
#
#   @sa glfwSetCharCallback
#
#   @ingroup input
#

type
  TGLFWcharfun* = proc (a2: ptr TGLFWwindow; a3: cuint)

#! @brief The function signature for monitor configuration callbacks.
#
#   This is the function signature for monitor configuration callback functions.
#
#   @param[in] monitor The monitor that was connected or disconnected.
#   @param[in] event One of `GLFW_CONNECTED` or `GLFW_DISCONNECTED`.
#
#   @sa glfwSetMonitorCallback
#
#   @ingroup monitor
#

type
  TGLFWmonitorfun* = proc (a2: ptr TGLFWmonitor; a3: cint)

#! @brief Video mode type.
#
#   This describes a single video mode.
#
#   @ingroup monitor
#

type
  TGLFWvidmode* {.pure, final.} = object
    width*: cint #! The width, in screen coordinates, of the video mode.
    height*: cint #! The bit depth of the red channel of the video mode.
                  #
    redBits*: cint #! The bit depth of the green channel of the video mode.
                   #
    greenBits*: cint #! The bit depth of the blue channel of the video mode.
                     #
    blueBits*: cint           #! The refresh rate, in Hz, of the video mode.
                              #
    refreshRate*: cint


#! @brief Gamma ramp.
#
#   This describes the gamma ramp for a monitor.
#
#   @sa glfwGetGammaRamp glfwSetGammaRamp
#
#   @ingroup monitor
#

type
  TGLFWgammaramp* {.pure, final.} = object
    red*: ptr cushort #! An array of value describing the response of the red channel.
                      #
    green*: ptr cushort #! An array of value describing the response of the blue channel.
                        #
    blue*: ptr cushort        #! The number of elements in each array.
                              #
    size*: cuint


#************************************************************************
#  GLFW API functions
# ***********************************************************************
#! @brief Initializes the GLFW library.
#
#   This function initializes the GLFW library.  Before most GLFW functions can
#   be used, GLFW must be initialized, and before a program terminates GLFW
#   should be terminated in order to free any resources allocated during or
#   after initialization.
#
#   If this function fails, it calls @ref glfwTerminate before returning.  If it
#   succeeds, you should call @ref glfwTerminate before the program exits.
#
#   Additional calls to this function after successful initialization but before
#   termination will succeed but will do nothing.
#
#   @return `GL_TRUE` if successful, or `GL_FALSE` if an error occurred.
#
#   @par New in GLFW 3
#   This function no longer registers @ref glfwTerminate with `atexit`.
#
#   @note This function may only be called from the main thread.
#
#   @note This function may take several seconds to complete on some systems,
#   while on other systems it may take only a fraction of a second to complete.
#
#   @note **Mac OS X:** This function will change the current directory of the
#   application to the `Contents/Resources` subdirectory of the application's
#   bundle, if present.
#
#   @sa glfwTerminate
#
#   @ingroup init
#

proc glfwInit*(): cint {.importc: "glfwInit", dynlib: libglfw.}
#! @brief Terminates the GLFW library.
#
#   This function destroys all remaining windows, frees any allocated resources
#   and sets the library to an uninitialized state.  Once this is called, you
#   must again call @ref glfwInit successfully before you will be able to use
#   most GLFW functions.
#
#   If GLFW has been successfully initialized, this function should be called
#   before the program exits.  If initialization fails, there is no need to call
#   this function, as it is called by @ref glfwInit before it returns failure.
#
#   @remarks This function may be called before @ref glfwInit.
#
#   @note This function may only be called from the main thread.
#
#   @warning No window's context may be current on another thread when this
#   function is called.
#
#   @sa glfwInit
#
#   @ingroup init
#

proc glfwTerminate*() {.importc: "glfwTerminate", dynlib: libglfw.}
#! @brief Retrieves the version of the GLFW library.
#
#   This function retrieves the major, minor and revision numbers of the GLFW
#   library.  It is intended for when you are using GLFW as a shared library and
#   want to ensure that you are using the minimum required version.
#
#   @param[out] major Where to store the major version number, or `NULL`.
#   @param[out] minor Where to store the minor version number, or `NULL`.
#   @param[out] rev Where to store the revision number, or `NULL`.
#
#   @remarks This function may be called before @ref glfwInit.
#
#   @remarks This function may be called from any thread.
#
#   @sa glfwGetVersionString
#
#   @ingroup init
#

proc glfwGetVersion*(major: ptr cint; minor: ptr cint; rev: ptr cint) {.
    importc: "glfwGetVersion", dynlib: libglfw.}
#! @brief Returns a string describing the compile-time configuration.
#
#   This function returns a static string generated at compile-time according to
#   which configuration macros were defined.  This is intended for use when
#   submitting bug reports, to allow developers to see which code paths are
#   enabled in a binary.
#
#   The format of the string is as follows:
#   - The version of GLFW
#   - The name of the window system API
#   - The name of the context creation API
#   - Any additional options or APIs
#
#   For example, when compiling GLFW 3.0 with MinGW using the Win32 and WGL
#   back ends, the version string may look something like this:
#
#       3.0.0 Win32 WGL MinGW
#
#   @return The GLFW version string.
#
#   @remarks This function may be called before @ref glfwInit.
#
#   @remarks This function may be called from any thread.
#
#   @sa glfwGetVersion
#
#   @ingroup init
#

proc glfwGetVersionString*(): cstring {.importc: "glfwGetVersionString",
                                        dynlib: libglfw.}
#! @brief Sets the error callback.
#
#   This function sets the error callback, which is called with an error code
#   and a human-readable description each time a GLFW error occurs.
#
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @remarks This function may be called before @ref glfwInit.
#
#   @note The error callback is called by the thread where the error was
#   generated.  If you are using GLFW from multiple threads, your error callback
#   needs to be written accordingly.
#
#   @note Because the description string provided to the callback may have been
#   generated specifically for that error, it is not guaranteed to be valid
#   after the callback has returned.  If you wish to use it after that, you need
#   to make your own copy of it before returning.
#
#   @ingroup error
#

proc glfwSetErrorCallback*(cbfun: TGLFWerrorfun): TGLFWerrorfun {.
    importc: "glfwSetErrorCallback", dynlib: libglfw.}
#! @brief Returns the currently connected monitors.
#
#   This function returns an array of handles for all currently connected
#   monitors.
#
#   @param[out] count Where to store the size of the returned array.  This is
#   set to zero if an error occurred.
#   @return An array of monitor handles, or `NULL` if an error occurred.
#
#   @note The returned array is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @note The returned array is valid only until the monitor configuration
#   changes.  See @ref glfwSetMonitorCallback to receive notifications of
#   configuration changes.
#
#   @sa glfwGetPrimaryMonitor
#
#   @ingroup monitor
#

proc glfwGetMonitors*(count: ptr cint): ptr ptr TGLFWmonitor {.
    importc: "glfwGetMonitors", dynlib: libglfw.}
#! @brief Returns the primary monitor.
#
#   This function returns the primary monitor.  This is usually the monitor
#   where elements like the Windows task bar or the OS X menu bar is located.
#
#   @return The primary monitor, or `NULL` if an error occurred.
#
#   @sa glfwGetMonitors
#
#   @ingroup monitor
#

proc glfwGetPrimaryMonitor*(): ptr TGLFWmonitor {.
    importc: "glfwGetPrimaryMonitor", dynlib: libglfw.}
#! @brief Returns the position of the monitor's viewport on the virtual screen.
#
#   This function returns the position, in screen coordinates, of the upper-left
#   corner of the specified monitor.
#
#   @param[in] monitor The monitor to query.
#   @param[out] xpos Where to store the monitor x-coordinate, or `NULL`.
#   @param[out] ypos Where to store the monitor y-coordinate, or `NULL`.
#
#   @ingroup monitor
#

proc glfwGetMonitorPos*(monitor: ptr TGLFWmonitor; xpos: ptr cint;
                        ypos: ptr cint) {.importc: "glfwGetMonitorPos",
    dynlib: libglfw.}
#! @brief Returns the physical size of the monitor.
#
#   This function returns the size, in millimetres, of the display area of the
#   specified monitor.
#
#   @param[in] monitor The monitor to query.
#   @param[out] width Where to store the width, in mm, of the monitor's display
#   area, or `NULL`.
#   @param[out] height Where to store the height, in mm, of the monitor's
#   display area, or `NULL`.
#
#   @note Some operating systems do not provide accurate information, either
#   because the monitor's EDID data is incorrect, or because the driver does not
#   report it accurately.
#
#   @ingroup monitor
#

proc glfwGetMonitorPhysicalSize*(monitor: ptr TGLFWmonitor; width: ptr cint;
                                 height: ptr cint) {.
    importc: "glfwGetMonitorPhysicalSize", dynlib: libglfw.}
#! @brief Returns the name of the specified monitor.
#
#   This function returns a human-readable name, encoded as UTF-8, of the
#   specified monitor.
#
#   @param[in] monitor The monitor to query.
#   @return The UTF-8 encoded name of the monitor, or `NULL` if an error
#   occurred.
#
#   @note The returned string is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @ingroup monitor
#

proc glfwGetMonitorName*(monitor: ptr TGLFWmonitor): cstring {.
    importc: "glfwGetMonitorName", dynlib: libglfw.}
#! @brief Sets the monitor configuration callback.
#
#   This function sets the monitor configuration callback, or removes the
#   currently set callback.  This is called when a monitor is connected to or
#   disconnected from the system.
#
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @bug **X11:** This callback is not yet called on monitor configuration
#   changes.
#
#   @ingroup monitor
#

proc glfwSetMonitorCallback*(cbfun: TGLFWmonitorfun): TGLFWmonitorfun {.
    importc: "glfwSetMonitorCallback", dynlib: libglfw.}
#! @brief Returns the available video modes for the specified monitor.
#
#   This function returns an array of all video modes supported by the specified
#   monitor.  The returned array is sorted in ascending order, first by color
#   bit depth (the sum of all channel depths) and then by resolution area (the
#   product of width and height).
#
#   @param[in] monitor The monitor to query.
#   @param[out] count Where to store the number of video modes in the returned
#   array.  This is set to zero if an error occurred.
#   @return An array of video modes, or `NULL` if an error occurred.
#
#   @note The returned array is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @note The returned array is valid only until this function is called again
#   for the specified monitor.
#
#   @sa glfwGetVideoMode
#
#   @ingroup monitor
#

proc glfwGetVideoModes*(monitor: ptr TGLFWmonitor; count: ptr cint): ptr TGLFWvidmode {.
    importc: "glfwGetVideoModes", dynlib: libglfw.}
#! @brief Returns the current mode of the specified monitor.
#
#   This function returns the current video mode of the specified monitor.  If
#   you are using a full screen window, the return value will therefore depend
#   on whether it is focused.
#
#   @param[in] monitor The monitor to query.
#   @return The current mode of the monitor, or `NULL` if an error occurred.
#
#   @note The returned struct is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @sa glfwGetVideoModes
#
#   @ingroup monitor
#

proc glfwGetVideoMode*(monitor: ptr TGLFWmonitor): ptr TGLFWvidmode {.
    importc: "glfwGetVideoMode", dynlib: libglfw.}
#! @brief Generates a gamma ramp and sets it for the specified monitor.
#
#   This function generates a 256-element gamma ramp from the specified exponent
#   and then calls @ref glfwSetGammaRamp with it.
#
#   @param[in] monitor The monitor whose gamma ramp to set.
#   @param[in] gamma The desired exponent.
#
#   @ingroup monitor
#

proc glfwSetGamma*(monitor: ptr TGLFWmonitor; gamma: cfloat) {.
    importc: "glfwSetGamma", dynlib: libglfw.}
#! @brief Retrieves the current gamma ramp for the specified monitor.
#
#   This function retrieves the current gamma ramp of the specified monitor.
#
#   @param[in] monitor The monitor to query.
#   @return The current gamma ramp, or `NULL` if an error occurred.
#
#   @note The value arrays of the returned ramp are allocated and freed by GLFW.
#   You should not free them yourself.
#
#   @ingroup monitor
#

proc glfwGetGammaRamp*(monitor: ptr TGLFWmonitor): ptr TGLFWgammaramp {.
    importc: "glfwGetGammaRamp", dynlib: libglfw.}
#! @brief Sets the current gamma ramp for the specified monitor.
#
#   This function sets the current gamma ramp for the specified monitor.
#
#   @param[in] monitor The monitor whose gamma ramp to set.
#   @param[in] ramp The gamma ramp to use.
#
#   @note Gamma ramp sizes other than 256 are not supported by all hardware.
#
#   @ingroup monitor
#

proc glfwSetGammaRamp*(monitor: ptr TGLFWmonitor; ramp: ptr TGLFWgammaramp) {.
    importc: "glfwSetGammaRamp", dynlib: libglfw.}
#! @brief Resets all window hints to their default values.
#
#   This function resets all window hints to their
#   [default values](@ref window_hints_values).
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwWindowHint
#
#   @ingroup window
#

proc glfwDefaultWindowHints*() {.importc: "glfwDefaultWindowHints",
                                 dynlib: libglfw.}
#! @brief Sets the specified window hint to the desired value.
#
#   This function sets hints for the next call to @ref glfwCreateWindow.  The
#   hints, once set, retain their values until changed by a call to @ref
#   glfwWindowHint or @ref glfwDefaultWindowHints, or until the library is
#   terminated with @ref glfwTerminate.
#
#   @param[in] target The [window hint](@ref window_hints) to set.
#   @param[in] hint The new value of the window hint.
#
#   @par New in GLFW 3
#   Hints are no longer reset to their default values on window creation.  To
#   set default hint values, use @ref glfwDefaultWindowHints.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwDefaultWindowHints
#
#   @ingroup window
#

proc glfwWindowHint*(target: cint; hint: cint) {.importc: "glfwWindowHint",
    dynlib: libglfw.}
#! @brief Creates a window and its associated context.
#
#   This function creates a window and its associated context.  Most of the
#   options controlling how the window and its context should be created are
#   specified through @ref glfwWindowHint.
#
#   Successful creation does not change which context is current.  Before you
#   can use the newly created context, you need to make it current using @ref
#   glfwMakeContextCurrent.
#
#   Note that the created window and context may differ from what you requested,
#   as not all parameters and hints are
#   [hard constraints](@ref window_hints_hard).  This includes the size of the
#   window, especially for full screen windows.  To retrieve the actual
#   attributes of the created window and context, use queries like @ref
#   glfwGetWindowAttrib and @ref glfwGetWindowSize.
#
#   To create a full screen window, you need to specify the monitor to use.  If
#   no monitor is specified, windowed mode will be used.  Unless you have a way
#   for the user to choose a specific monitor, it is recommended that you pick
#   the primary monitor.  For more information on how to retrieve monitors, see
#   @ref monitor_monitors.
#
#   To create the window at a specific position, make it initially invisible
#   using the `GLFW_VISIBLE` window hint, set its position and then show it.
#
#   If a full screen window is active, the screensaver is prohibited from
#   starting.
#
#   @param[in] width The desired width, in screen coordinates, of the window.
#   This must be greater than zero.
#   @param[in] height The desired height, in screen coordinates, of the window.
#   This must be greater than zero.
#   @param[in] title The initial, UTF-8 encoded window title.
#   @param[in] monitor The monitor to use for full screen mode, or `NULL` to use
#   windowed mode.
#   @param[in] share The window whose context to share resources with, or `NULL`
#   to not share resources.
#   @return The handle of the created window, or `NULL` if an error occurred.
#
#   @remarks **Windows:** If the executable has an icon resource named
#   `GLFW_ICON,` it will be set as the icon for the window.  If no such icon is
#   present, the `IDI_WINLOGO` icon will be used instead.
#
#   @remarks **Mac OS X:** The GLFW window has no icon, as it is not a document
#   window, but the dock icon will be the same as the application bundle's icon.
#   Also, the first time a window is opened the menu bar is populated with
#   common commands like Hide, Quit and About.  The (minimal) about dialog uses
#   information from the application's bundle.  For more information on bundles,
#   see the Bundle Programming Guide provided by Apple.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwDestroyWindow
#
#   @ingroup window
#

proc glfwCreateWindow*(width: cint; height: cint; title: cstring;
                       monitor: ptr TGLFWmonitor; share: ptr TGLFWwindow): ptr TGLFWwindow {.
    importc: "glfwCreateWindow", dynlib: libglfw.}
#! @brief Destroys the specified window and its context.
#
#   This function destroys the specified window and its context.  On calling
#   this function, no further callbacks will be called for that window.
#
#   @param[in] window The window to destroy.
#
#   @note This function may only be called from the main thread.
#
#   @note This function may not be called from a callback.
#
#   @note If the window's context is current on the main thread, it is
#   detached before being destroyed.
#
#   @warning The window's context must not be current on any other thread.
#
#   @sa glfwCreateWindow
#
#   @ingroup window
#

proc glfwDestroyWindow*(window: ptr TGLFWwindow) {.importc: "glfwDestroyWindow",
    dynlib: libglfw.}
#! @brief Checks the close flag of the specified window.
#
#   This function returns the value of the close flag of the specified window.
#
#   @param[in] window The window to query.
#   @return The value of the close flag.
#
#   @remarks This function may be called from secondary threads.
#
#   @ingroup window
#

proc glfwWindowShouldClose*(window: ptr TGLFWwindow): cint {.
    importc: "glfwWindowShouldClose", dynlib: libglfw.}
#! @brief Sets the close flag of the specified window.
#
#   This function sets the value of the close flag of the specified window.
#   This can be used to override the user's attempt to close the window, or
#   to signal that it should be closed.
#
#   @param[in] window The window whose flag to change.
#   @param[in] value The new value.
#
#   @remarks This function may be called from secondary threads.
#
#   @ingroup window
#

proc glfwSetWindowShouldClose*(window: ptr TGLFWwindow; value: cint) {.
    importc: "glfwSetWindowShouldClose", dynlib: libglfw.}
#! @brief Sets the title of the specified window.
#
#   This function sets the window title, encoded as UTF-8, of the specified
#   window.
#
#   @param[in] window The window whose title to change.
#   @param[in] title The UTF-8 encoded window title.
#
#   @note This function may only be called from the main thread.
#
#   @ingroup window
#

proc glfwSetWindowTitle*(window: ptr TGLFWwindow; title: cstring) {.
    importc: "glfwSetWindowTitle", dynlib: libglfw.}
#! @brief Retrieves the position of the client area of the specified window.
#
#   This function retrieves the position, in screen coordinates, of the
#   upper-left corner of the client area of the specified window.
#
#   @param[in] window The window to query.
#   @param[out] xpos Where to store the x-coordinate of the upper-left corner of
#   the client area, or `NULL`.
#   @param[out] ypos Where to store the y-coordinate of the upper-left corner of
#   the client area, or `NULL`.
#
#   @sa glfwSetWindowPos
#
#   @ingroup window
#

proc glfwGetWindowPos*(window: ptr TGLFWwindow; xpos: ptr cint; ypos: ptr cint) {.
    importc: "glfwGetWindowPos", dynlib: libglfw.}
#! @brief Sets the position of the client area of the specified window.
#
#   This function sets the position, in screen coordinates, of the upper-left
#   corner of the client area of the window.
#
#   If the specified window is a full screen window, this function does nothing.
#
#   If you wish to set an initial window position you should create a hidden
#   window (using @ref glfwWindowHint and `GLFW_VISIBLE`), set its position and
#   then show it.
#
#   @param[in] window The window to query.
#   @param[in] xpos The x-coordinate of the upper-left corner of the client area.
#   @param[in] ypos The y-coordinate of the upper-left corner of the client area.
#
#   @note It is very rarely a good idea to move an already visible window, as it
#   will confuse and annoy the user.
#
#   @note This function may only be called from the main thread.
#
#   @note The window manager may put limits on what positions are allowed.
#
#   @bug **X11:** Some window managers ignore the set position of hidden (i.e.
#   unmapped) windows, instead placing them where it thinks is appropriate once
#   they are shown.
#
#   @sa glfwGetWindowPos
#
#   @ingroup window
#

proc glfwSetWindowPos*(window: ptr TGLFWwindow; xpos: cint; ypos: cint) {.
    importc: "glfwSetWindowPos", dynlib: libglfw.}
#! @brief Retrieves the size of the client area of the specified window.
#
#   This function retrieves the size, in screen coordinates, of the client area
#   of the specified window.
#
#   @param[in] window The window whose size to retrieve.
#   @param[out] width Where to store the width, in screen coordinates, of the
#   client area, or `NULL`.
#   @param[out] height Where to store the height, in screen coordinates, of the
#   client area, or `NULL`.
#
#   @sa glfwSetWindowSize
#
#   @ingroup window
#

proc glfwGetWindowSize*(window: ptr TGLFWwindow; width: ptr cint;
                        height: ptr cint) {.importc: "glfwGetWindowSize",
    dynlib: libglfw.}
#! @brief Sets the size of the client area of the specified window.
#
#   This function sets the size, in screen coordinates, of the client area of
#   the specified window.
#
#   For full screen windows, this function selects and switches to the resolution
#   closest to the specified size, without affecting the window's context.  As
#   the context is unaffected, the bit depths of the framebuffer remain
#   unchanged.
#
#   @param[in] window The window to resize.
#   @param[in] width The desired width of the specified window.
#   @param[in] height The desired height of the specified window.
#
#   @note This function may only be called from the main thread.
#
#   @note The window manager may put limits on what window sizes are allowed.
#
#   @sa glfwGetWindowSize
#
#   @ingroup window
#

proc glfwSetWindowSize*(window: ptr TGLFWwindow; width: cint; height: cint) {.
    importc: "glfwSetWindowSize", dynlib: libglfw.}
#! @brief Retrieves the size of the framebuffer of the specified window.
#
#   This function retrieves the size, in pixels, of the framebuffer of the
#   specified window.
#
#   @param[in] window The window whose framebuffer to query.
#   @param[out] width Where to store the width, in pixels, of the framebuffer,
#   or `NULL`.
#   @param[out] height Where to store the height, in pixels, of the framebuffer,
#   or `NULL`.
#
#   @sa glfwSetFramebufferSizeCallback
#
#   @ingroup window
#

proc glfwGetFramebufferSize*(window: ptr TGLFWwindow; width: ptr cint;
                             height: ptr cint) {.
    importc: "glfwGetFramebufferSize", dynlib: libglfw.}
#! @brief Iconifies the specified window.
#
#   This function iconifies/minimizes the specified window, if it was previously
#   restored.  If it is a full screen window, the original monitor resolution is
#   restored until the window is restored.  If the window is already iconified,
#   this function does nothing.
#
#   @param[in] window The window to iconify.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwRestoreWindow
#
#   @ingroup window
#

proc glfwIconifyWindow*(window: ptr TGLFWwindow) {.importc: "glfwIconifyWindow",
    dynlib: libglfw.}
#! @brief Restores the specified window.
#
#   This function restores the specified window, if it was previously
#   iconified/minimized.  If it is a full screen window, the resolution chosen
#   for the window is restored on the selected monitor.  If the window is
#   already restored, this function does nothing.
#
#   @param[in] window The window to restore.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwIconifyWindow
#
#   @ingroup window
#

proc glfwRestoreWindow*(window: ptr TGLFWwindow) {.importc: "glfwRestoreWindow",
    dynlib: libglfw.}
#! @brief Makes the specified window visible.
#
#   This function makes the specified window visible, if it was previously
#   hidden.  If the window is already visible or is in full screen mode, this
#   function does nothing.
#
#   @param[in] window The window to make visible.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwHideWindow
#
#   @ingroup window
#

proc glfwShowWindow*(window: ptr TGLFWwindow) {.importc: "glfwShowWindow",
    dynlib: libglfw.}
#! @brief Hides the specified window.
#
#   This function hides the specified window, if it was previously visible.  If
#   the window is already hidden or is in full screen mode, this function does
#   nothing.
#
#   @param[in] window The window to hide.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwShowWindow
#
#   @ingroup window
#

proc glfwHideWindow*(window: ptr TGLFWwindow) {.importc: "glfwHideWindow",
    dynlib: libglfw.}
#! @brief Returns the monitor that the window uses for full screen mode.
#
#   This function returns the handle of the monitor that the specified window is
#   in full screen on.
#
#   @param[in] window The window to query.
#   @return The monitor, or `NULL` if the window is in windowed mode.
#
#   @ingroup window
#

proc glfwGetWindowMonitor*(window: ptr TGLFWwindow): ptr TGLFWmonitor {.
    importc: "glfwGetWindowMonitor", dynlib: libglfw.}
#! @brief Returns an attribute of the specified window.
#
#   This function returns an attribute of the specified window.  There are many
#   attributes, some related to the window and others to its context.
#
#   @param[in] window The window to query.
#   @param[in] attrib The [window attribute](@ref window_attribs) whose value to
#   return.
#   @return The value of the attribute, or zero if an error occurred.
#
#   @ingroup window
#

proc glfwGetWindowAttrib*(window: ptr TGLFWwindow; attrib: cint): cint {.
    importc: "glfwGetWindowAttrib", dynlib: libglfw.}
#! @brief Sets the user pointer of the specified window.
#
#   This function sets the user-defined pointer of the specified window.  The
#   current value is retained until the window is destroyed.  The initial value
#   is `NULL`.
#
#   @param[in] window The window whose pointer to set.
#   @param[in] pointer The new value.
#
#   @sa glfwGetWindowUserPointer
#
#   @ingroup window
#

proc glfwSetWindowUserPointer*(window: ptr TGLFWwindow; pointer: pointer) {.
    importc: "glfwSetWindowUserPointer", dynlib: libglfw.}
#! @brief Returns the user pointer of the specified window.
#
#   This function returns the current value of the user-defined pointer of the
#   specified window.  The initial value is `NULL`.
#
#   @param[in] window The window whose pointer to return.
#
#   @sa glfwSetWindowUserPointer
#
#   @ingroup window
#

proc glfwGetWindowUserPointer*(window: ptr TGLFWwindow): pointer {.
    importc: "glfwGetWindowUserPointer", dynlib: libglfw.}
#! @brief Sets the position callback for the specified window.
#
#   This function sets the position callback of the specified window, which is
#   called when the window is moved.  The callback is provided with the screen
#   position of the upper-left corner of the client area of the window.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup window
#

proc glfwSetWindowPosCallback*(window: ptr TGLFWwindow; cbfun: TGLFWwindowposfun): TGLFWwindowposfun {.
    importc: "glfwSetWindowPosCallback", dynlib: libglfw.}
#! @brief Sets the size callback for the specified window.
#
#   This function sets the size callback of the specified window, which is
#   called when the window is resized.  The callback is provided with the size,
#   in screen coordinates, of the client area of the window.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup window
#

proc glfwSetWindowSizeCallback*(window: ptr TGLFWwindow;
                                cbfun: TGLFWwindowsizefun): TGLFWwindowsizefun {.
    importc: "glfwSetWindowSizeCallback", dynlib: libglfw.}
#! @brief Sets the close callback for the specified window.
#
#   This function sets the close callback of the specified window, which is
#   called when the user attempts to close the window, for example by clicking
#   the close widget in the title bar.
#
#   The close flag is set before this callback is called, but you can modify it
#   at any time with @ref glfwSetWindowShouldClose.
#
#   The close callback is not triggered by @ref glfwDestroyWindow.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @remarks **Mac OS X:** Selecting Quit from the application menu will
#   trigger the close callback for all windows.
#
#   @ingroup window
#

proc glfwSetWindowCloseCallback*(window: ptr TGLFWwindow;
                                 cbfun: TGLFWwindowclosefun): TGLFWwindowclosefun {.
    importc: "glfwSetWindowCloseCallback", dynlib: libglfw.}
#! @brief Sets the refresh callback for the specified window.
#
#   This function sets the refresh callback of the specified window, which is
#   called when the client area of the window needs to be redrawn, for example
#   if the window has been exposed after having been covered by another window.
#
#   On compositing window systems such as Aero, Compiz or Aqua, where the window
#   contents are saved off-screen, this callback may be called only very
#   infrequently or never at all.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @note On compositing window systems such as Aero, Compiz or Aqua, where the
#   window contents are saved off-screen, this callback may be called only very
#   infrequently or never at all.
#
#   @ingroup window
#

proc glfwSetWindowRefreshCallback*(window: ptr TGLFWwindow;
                                   cbfun: TGLFWwindowrefreshfun): TGLFWwindowrefreshfun {.
    importc: "glfwSetWindowRefreshCallback", dynlib: libglfw.}
#! @brief Sets the focus callback for the specified window.
#
#   This function sets the focus callback of the specified window, which is
#   called when the window gains or loses focus.
#
#   After the focus callback is called for a window that lost focus, synthetic
#   key and mouse button release events will be generated for all such that had
#   been pressed.  For more information, see @ref glfwSetKeyCallback and @ref
#   glfwSetMouseButtonCallback.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup window
#

proc glfwSetWindowFocusCallback*(window: ptr TGLFWwindow;
                                 cbfun: TGLFWwindowfocusfun): TGLFWwindowfocusfun {.
    importc: "glfwSetWindowFocusCallback", dynlib: libglfw.}
#! @brief Sets the iconify callback for the specified window.
#
#   This function sets the iconification callback of the specified window, which
#   is called when the window is iconified or restored.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup window
#

proc glfwSetWindowIconifyCallback*(window: ptr TGLFWwindow;
                                   cbfun: TGLFWwindowiconifyfun): TGLFWwindowiconifyfun {.
    importc: "glfwSetWindowIconifyCallback", dynlib: libglfw.}
#! @brief Sets the framebuffer resize callback for the specified window.
#
#   This function sets the framebuffer resize callback of the specified window,
#   which is called when the framebuffer of the specified window is resized.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup window
#

proc glfwSetFramebufferSizeCallback*(window: ptr TGLFWwindow;
                                     cbfun: TGLFWframebuffersizefun): TGLFWframebuffersizefun {.
    importc: "glfwSetFramebufferSizeCallback", dynlib: libglfw.}
#! @brief Processes all pending events.
#
#   This function processes only those events that have already been received
#   and then returns immediately.  Processing events will cause the window and
#   input callbacks associated with those events to be called.
#
#   This function is not required for joystick input to work.
#
#   @par New in GLFW 3
#   This function is no longer called by @ref glfwSwapBuffers.  You need to call
#   it or @ref glfwWaitEvents yourself.
#
#   @note This function may only be called from the main thread.
#
#   @note This function may not be called from a callback.
#
#   @note On some platforms, certain callbacks may be called outside of a call
#   to one of the event processing functions.
#
#   @sa glfwWaitEvents
#
#   @ingroup window
#

proc glfwPollEvents*() {.importc: "glfwPollEvents", dynlib: libglfw.}
#! @brief Waits until events are pending and processes them.
#
#   This function puts the calling thread to sleep until at least one event has
#   been received.  Once one or more events have been received, it behaves as if
#   @ref glfwPollEvents was called, i.e. the events are processed and the
#   function then returns immediately.  Processing events will cause the window
#   and input callbacks associated with those events to be called.
#
#   Since not all events are associated with callbacks, this function may return
#   without a callback having been called even if you are monitoring all
#   callbacks.
#
#   This function is not required for joystick input to work.
#
#   @note This function may only be called from the main thread.
#
#   @note This function may not be called from a callback.
#
#   @note On some platforms, certain callbacks may be called outside of a call
#   to one of the event processing functions.
#
#   @sa glfwPollEvents
#
#   @ingroup window
#

proc glfwWaitEvents*() {.importc: "glfwWaitEvents", dynlib: libglfw.}
#! @brief Returns the value of an input option for the specified window.
#
#   @param[in] window The window to query.
#   @param[in] mode One of `GLFW_CURSOR`, `GLFW_STICKY_KEYS` or
#   `GLFW_STICKY_MOUSE_BUTTONS`.
#
#   @sa glfwSetInputMode
#
#   @ingroup input
#

proc glfwGetInputMode*(window: ptr TGLFWwindow; mode: cint): cint {.
    importc: "glfwGetInputMode", dynlib: libglfw.}
#! @brief Sets an input option for the specified window.
#   @param[in] window The window whose input mode to set.
#   @param[in] mode One of `GLFW_CURSOR`, `GLFW_STICKY_KEYS` or
#   `GLFW_STICKY_MOUSE_BUTTONS`.
#   @param[in] value The new value of the specified input mode.
#
#   If `mode` is `GLFW_CURSOR`, the value must be one of the supported input
#   modes:
#   - `GLFW_CURSOR_NORMAL` makes the cursor visible and behaving normally.
#   - `GLFW_CURSOR_HIDDEN` makes the cursor invisible when it is over the client
#     area of the window.
#   - `GLFW_CURSOR_DISABLED` disables the cursor and removes any limitations on
#     cursor movement.
#
#   If `mode` is `GLFW_STICKY_KEYS`, the value must be either `GL_TRUE` to
#   enable sticky keys, or `GL_FALSE` to disable it.  If sticky keys are
#   enabled, a key press will ensure that @ref glfwGetKey returns @ref
#   GLFW_PRESS the next time it is called even if the key had been released
#   before the call.  This is useful when you are only interested in whether
#   keys have been pressed but not when or in which order.
#
#   If `mode` is `GLFW_STICKY_MOUSE_BUTTONS`, the value must be either `GL_TRUE`
#   to enable sticky mouse buttons, or `GL_FALSE` to disable it.  If sticky
#   mouse buttons are enabled, a mouse button press will ensure that @ref
#   glfwGetMouseButton returns @ref GLFW_PRESS the next time it is called even
#   if the mouse button had been released before the call.  This is useful when
#   you are only interested in whether mouse buttons have been pressed but not
#   when or in which order.
#
#   @sa glfwGetInputMode
#
#   @ingroup input
#

proc glfwSetInputMode*(window: ptr TGLFWwindow; mode: cint; value: cint) {.
    importc: "glfwSetInputMode", dynlib: libglfw.}
#! @brief Returns the last reported state of a keyboard key for the specified
#   window.
#
#   This function returns the last state reported for the specified key to the
#   specified window.  The returned state is one of `GLFW_PRESS` or
#   `GLFW_RELEASE`.  The higher-level state `GLFW_REPEAT` is only reported to
#   the key callback.
#
#   If the `GLFW_STICKY_KEYS` input mode is enabled, this function returns
#   `GLFW_PRESS` the first time you call this function after a key has been
#   pressed, even if the key has already been released.
#
#   The key functions deal with physical keys, with [key tokens](@ref keys)
#   named after their use on the standard US keyboard layout.  If you want to
#   input text, use the Unicode character callback instead.
#
#   @param[in] window The desired window.
#   @param[in] key The desired [keyboard key](@ref keys).
#   @return One of `GLFW_PRESS` or `GLFW_RELEASE`.
#
#   @note `GLFW_KEY_UNKNOWN` is not a valid key for this function.
#
#   @ingroup input
#

proc glfwGetKey*(window: ptr TGLFWwindow; key: cint): cint {.
    importc: "glfwGetKey", dynlib: libglfw.}
#! @brief Returns the last reported state of a mouse button for the specified
#   window.
#
#   This function returns the last state reported for the specified mouse button
#   to the specified window.
#
#   If the `GLFW_STICKY_MOUSE_BUTTONS` input mode is enabled, this function
#   returns `GLFW_PRESS` the first time you call this function after a mouse
#   button has been pressed, even if the mouse button has already been released.
#
#   @param[in] window The desired window.
#   @param[in] button The desired [mouse button](@ref buttons).
#   @return One of `GLFW_PRESS` or `GLFW_RELEASE`.
#
#   @ingroup input
#

proc glfwGetMouseButton*(window: ptr TGLFWwindow; button: cint): cint {.
    importc: "glfwGetMouseButton", dynlib: libglfw.}
#! @brief Retrieves the last reported cursor position, relative to the client
#   area of the window.
#
#   This function returns the last reported position of the cursor to the
#   specified window.
#
#   If the cursor is disabled (with `GLFW_CURSOR_DISABLED`) then the cursor
#   position is unbounded and limited only by the minimum and maximum values of
#   a `double`.
#
#   The coordinate can be converted to their integer equivalents with the
#   `floor` function.  Casting directly to an integer type works for positive
#   coordinates, but fails for negative ones.
#
#   @param[in] window The desired window.
#   @param[out] xpos Where to store the cursor x-coordinate, relative to the
#   left edge of the client area, or `NULL`.
#   @param[out] ypos Where to store the cursor y-coordinate, relative to the to
#   top edge of the client area, or `NULL`.
#
#   @sa glfwSetCursorPos
#
#   @ingroup input
#

proc glfwGetCursorPos*(window: ptr TGLFWwindow; xpos: ptr cdouble;
                       ypos: ptr cdouble) {.importc: "glfwGetCursorPos",
    dynlib: libglfw.}
#! @brief Sets the position of the cursor, relative to the client area of the window.
#
#   This function sets the position of the cursor.  The specified window must be
#   focused.  If the window does not have focus when this function is called, it
#   fails silently.
#
#   If the cursor is disabled (with `GLFW_CURSOR_DISABLED`) then the cursor
#   position is unbounded and limited only by the minimum and maximum values of
#   a `double`.
#
#   @param[in] window The desired window.
#   @param[in] xpos The desired x-coordinate, relative to the left edge of the
#   client area.
#   @param[in] ypos The desired y-coordinate, relative to the top edge of the
#   client area.
#
#   @sa glfwGetCursorPos
#
#   @ingroup input
#

proc glfwSetCursorPos*(window: ptr TGLFWwindow; xpos: cdouble; ypos: cdouble) {.
    importc: "glfwSetCursorPos", dynlib: libglfw.}
#! @brief Sets the key callback.
#
#   This function sets the key callback of the specific window, which is called
#   when a key is pressed, repeated or released.
#
#   The key functions deal with physical keys, with layout independent
#   [key tokens](@ref keys) named after their values in the standard US keyboard
#   layout.  If you want to input text, use the
#   [character callback](@ref glfwSetCharCallback) instead.
#
#   When a window loses focus, it will generate synthetic key release events
#   for all pressed keys.  You can tell these events from user-generated events
#   by the fact that the synthetic ones are generated after the window has lost
#   focus, i.e. `GLFW_FOCUSED` will be false and the focus callback will have
#   already been called.
#
#   The scancode of a key is specific to that platform or sometimes even to that
#   machine.  Scancodes are intended to allow users to bind keys that don't have
#   a GLFW key token.  Such keys have `key` set to `GLFW_KEY_UNKNOWN`, their
#   state is not saved and so it cannot be retrieved with @ref glfwGetKey.
#
#   Sometimes GLFW needs to generate synthetic key events, in which case the
#   scancode may be zero.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new key callback, or `NULL` to remove the currently
#   set callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup input
#

proc glfwSetKeyCallback*(window: ptr TGLFWwindow; cbfun: TGLFWkeyfun): TGLFWkeyfun {.
    importc: "glfwSetKeyCallback", dynlib: libglfw.}
#! @brief Sets the Unicode character callback.
#
#   This function sets the character callback of the specific window, which is
#   called when a Unicode character is input.
#
#   The character callback is intended for text input.  If you want to know
#   whether a specific key was pressed or released, use the
#   [key callback](@ref glfwSetKeyCallback) instead.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup input
#

proc glfwSetCharCallback*(window: ptr TGLFWwindow; cbfun: TGLFWcharfun): TGLFWcharfun {.
    importc: "glfwSetCharCallback", dynlib: libglfw.}
#! @brief Sets the mouse button callback.
#
#   This function sets the mouse button callback of the specified window, which
#   is called when a mouse button is pressed or released.
#
#   When a window loses focus, it will generate synthetic mouse button release
#   events for all pressed mouse buttons.  You can tell these events from
#   user-generated events by the fact that the synthetic ones are generated
#   after the window has lost focus, i.e. `GLFW_FOCUSED` will be false and the
#   focus callback will have already been called.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup input
#

proc glfwSetMouseButtonCallback*(window: ptr TGLFWwindow;
                                 cbfun: TGLFWmousebuttonfun): TGLFWmousebuttonfun {.
    importc: "glfwSetMouseButtonCallback", dynlib: libglfw.}
#! @brief Sets the cursor position callback.
#
#   This function sets the cursor position callback of the specified window,
#   which is called when the cursor is moved.  The callback is provided with the
#   position relative to the upper-left corner of the client area of the window.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup input
#

proc glfwSetCursorPosCallback*(window: ptr TGLFWwindow; cbfun: TGLFWcursorposfun): TGLFWcursorposfun {.
    importc: "glfwSetCursorPosCallback", dynlib: libglfw.}
#! @brief Sets the cursor enter/exit callback.
#
#   This function sets the cursor boundary crossing callback of the specified
#   window, which is called when the cursor enters or leaves the client area of
#   the window.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new callback, or `NULL` to remove the currently set
#   callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup input
#

proc glfwSetCursorEnterCallback*(window: ptr TGLFWwindow;
                                 cbfun: TGLFWcursorenterfun): TGLFWcursorenterfun {.
    importc: "glfwSetCursorEnterCallback", dynlib: libglfw.}
#! @brief Sets the scroll callback.
#
#   This function sets the scroll callback of the specified window, which is
#   called when a scrolling device is used, such as a mouse wheel or scrolling
#   area of a touchpad.
#
#   The scroll callback receives all scrolling input, like that from a mouse
#   wheel or a touchpad scrolling area.
#
#   @param[in] window The window whose callback to set.
#   @param[in] cbfun The new scroll callback, or `NULL` to remove the currently
#   set callback.
#   @return The previously set callback, or `NULL` if no callback was set or an
#   error occurred.
#
#   @ingroup input
#

proc glfwSetScrollCallback*(window: ptr TGLFWwindow; cbfun: TGLFWscrollfun): TGLFWscrollfun {.
    importc: "glfwSetScrollCallback", dynlib: libglfw.}
#! @brief Returns whether the specified joystick is present.
#
#   This function returns whether the specified joystick is present.
#
#   @param[in] joy The joystick to query.
#   @return `GL_TRUE` if the joystick is present, or `GL_FALSE` otherwise.
#
#   @ingroup input
#

proc glfwJoystickPresent*(joy: cint): cint {.importc: "glfwJoystickPresent",
    dynlib: libglfw.}
#! @brief Returns the values of all axes of the specified joystick.
#
#   This function returns the values of all axes of the specified joystick.
#
#   @param[in] joy The joystick to query.
#   @param[out] count Where to store the size of the returned array.  This is
#   set to zero if an error occurred.
#   @return An array of axis values, or `NULL` if the joystick is not present.
#
#   @note The returned array is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @note The returned array is valid only until the next call to @ref
#   glfwGetJoystickAxes for that joystick.
#
#   @ingroup input
#

proc glfwGetJoystickAxes*(joy: cint; count: ptr cint): ptr cfloat {.
    importc: "glfwGetJoystickAxes", dynlib: libglfw.}
#! @brief Returns the state of all buttons of the specified joystick.
#
#   This function returns the state of all buttons of the specified joystick.
#
#   @param[in] joy The joystick to query.
#   @param[out] count Where to store the size of the returned array.  This is
#   set to zero if an error occurred.
#   @return An array of button states, or `NULL` if the joystick is not present.
#
#   @note The returned array is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @note The returned array is valid only until the next call to @ref
#   glfwGetJoystickButtons for that joystick.
#
#   @ingroup input
#

proc glfwGetJoystickButtons*(joy: cint; count: ptr cint): ptr cuchar {.
    importc: "glfwGetJoystickButtons", dynlib: libglfw.}
#! @brief Returns the name of the specified joystick.
#
#   This function returns the name, encoded as UTF-8, of the specified joystick.
#
#   @param[in] joy The joystick to query.
#   @return The UTF-8 encoded name of the joystick, or `NULL` if the joystick
#   is not present.
#
#   @note The returned string is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @note The returned string is valid only until the next call to @ref
#   glfwGetJoystickName for that joystick.
#
#   @ingroup input
#

proc glfwGetJoystickName*(joy: cint): cstring {.importc: "glfwGetJoystickName",
    dynlib: libglfw.}
#! @brief Sets the clipboard to the specified string.
#
#   This function sets the system clipboard to the specified, UTF-8 encoded
#   string.  The string is copied before returning, so you don't have to retain
#   it afterwards.
#
#   @param[in] window The window that will own the clipboard contents.
#   @param[in] string A UTF-8 encoded string.
#
#   @note This function may only be called from the main thread.
#
#   @sa glfwGetClipboardString
#
#   @ingroup clipboard
#

proc glfwSetClipboardString*(window: ptr TGLFWwindow; string: cstring) {.
    importc: "glfwSetClipboardString", dynlib: libglfw.}
#! @brief Retrieves the contents of the clipboard as a string.
#
#   This function returns the contents of the system clipboard, if it contains
#   or is convertible to a UTF-8 encoded string.
#
#   @param[in] window The window that will request the clipboard contents.
#   @return The contents of the clipboard as a UTF-8 encoded string, or `NULL`
#   if an error occurred.
#
#   @note This function may only be called from the main thread.
#
#   @note The returned string is allocated and freed by GLFW.  You should not
#   free it yourself.
#
#   @note The returned string is valid only until the next call to @ref
#   glfwGetClipboardString or @ref glfwSetClipboardString.
#
#   @sa glfwSetClipboardString
#
#   @ingroup clipboard
#

proc glfwGetClipboardString*(window: ptr TGLFWwindow): cstring {.
    importc: "glfwGetClipboardString", dynlib: libglfw.}
#! @brief Returns the value of the GLFW timer.
#
#   This function returns the value of the GLFW timer.  Unless the timer has
#   been set using @ref glfwSetTime, the timer measures time elapsed since GLFW
#   was initialized.
#
#   @return The current value, in seconds, or zero if an error occurred.
#
#   @remarks This function may be called from secondary threads.
#
#   @note The resolution of the timer is system dependent, but is usually on the
#   order of a few micro- or nanoseconds.  It uses the highest-resolution
#   monotonic time source on each supported platform.
#
#   @ingroup time
#

proc glfwGetTime*(): cdouble {.importc: "glfwGetTime", dynlib: libglfw.}
#! @brief Sets the GLFW timer.
#
#   This function sets the value of the GLFW timer.  It then continues to count
#   up from that value.
#
#   @param[in] time The new value, in seconds.
#
#   @note The resolution of the timer is system dependent, but is usually on the
#   order of a few micro- or nanoseconds.  It uses the highest-resolution
#   monotonic time source on each supported platform.
#
#   @ingroup time
#

proc glfwSetTime*(time: cdouble) {.importc: "glfwSetTime", dynlib: libglfw.}
#! @brief Makes the context of the specified window current for the calling
#   thread.
#
#   This function makes the context of the specified window current on the
#   calling thread.  A context can only be made current on a single thread at
#   a time and each thread can have only a single current context at a time.
#
#   @param[in] window The window whose context to make current, or `NULL` to
#   detach the current context.
#
#   @remarks This function may be called from secondary threads.
#
#   @sa glfwGetCurrentContext
#
#   @ingroup context
#

proc glfwMakeContextCurrent*(window: ptr TGLFWwindow) {.
    importc: "glfwMakeContextCurrent", dynlib: libglfw.}
#! @brief Returns the window whose context is current on the calling thread.
#
#   This function returns the window whose context is current on the calling
#   thread.
#
#   @return The window whose context is current, or `NULL` if no window's
#   context is current.
#
#   @remarks This function may be called from secondary threads.
#
#   @sa glfwMakeContextCurrent
#
#   @ingroup context
#

proc glfwGetCurrentContext*(): ptr TGLFWwindow {.
    importc: "glfwGetCurrentContext", dynlib: libglfw.}
#! @brief Swaps the front and back buffers of the specified window.
#
#   This function swaps the front and back buffers of the specified window.  If
#   the swap interval is greater than zero, the GPU driver waits the specified
#   number of screen updates before swapping the buffers.
#
#   @param[in] window The window whose buffers to swap.
#
#   @remarks This function may be called from secondary threads.
#
#   @par New in GLFW 3
#   This function no longer calls @ref glfwPollEvents.  You need to call it or
#   @ref glfwWaitEvents yourself.
#
#   @sa glfwSwapInterval
#
#   @ingroup context
#

proc glfwSwapBuffers*(window: ptr TGLFWwindow) {.importc: "glfwSwapBuffers",
    dynlib: libglfw.}
#! @brief Sets the swap interval for the current context.
#
#   This function sets the swap interval for the current context, i.e. the
#   number of screen updates to wait before swapping the buffers of a window and
#   returning from @ref glfwSwapBuffers.  This is sometimes called 'vertical
#   synchronization', 'vertical retrace synchronization' or 'vsync'.
#
#   Contexts that support either of the `WGL_EXT_swap_control_tear` and
#   `GLX_EXT_swap_control_tear` extensions also accept negative swap intervals,
#   which allow the driver to swap even if a frame arrives a little bit late.
#   You can check for the presence of these extensions using @ref
#   glfwExtensionSupported.  For more information about swap tearing, see the
#   extension specifications.
#
#   @param[in] interval The minimum number of screen updates to wait for
#   until the buffers are swapped by @ref glfwSwapBuffers.
#
#   @remarks This function may be called from secondary threads.
#
#   @note Some GPU drivers do not honor the requested swap interval, either
#   because of user settings that override the request or due to bugs in the
#   driver.
#
#   @sa glfwSwapBuffers
#
#   @ingroup context
#

proc glfwSwapInterval*(interval: cint) {.importc: "glfwSwapInterval",
    dynlib: libglfw.}
#! @brief Returns whether the specified extension is available.
#
#   This function returns whether the specified
#   [OpenGL or context creation API extension](@ref context_glext) is supported
#   by the current context.  For example, on Windows both the OpenGL and WGL
#   extension strings are checked.
#
#   @param[in] extension The ASCII encoded name of the extension.
#   @return `GL_TRUE` if the extension is available, or `GL_FALSE` otherwise.
#
#   @remarks This function may be called from secondary threads.
#
#   @note As this functions searches one or more extension strings on each call,
#   it is recommended that you cache its results if it's going to be used
#   frequently.  The extension strings will not change during the lifetime of
#   a context, so there is no danger in doing this.
#
#   @ingroup context
#

proc glfwExtensionSupported*(extension: cstring): cint {.
    importc: "glfwExtensionSupported", dynlib: libglfw.}
#! @brief Returns the address of the specified function for the current
#   context.
#
#   This function returns the address of the specified
#   [client API or extension function](@ref context_glext), if it is supported
#   by the current context.
#
#   @param[in] procname The ASCII encoded name of the function.
#   @return The address of the function, or `NULL` if the function is
#   unavailable.
#
#   @remarks This function may be called from secondary threads.
#
#   @note The addresses of these functions are not guaranteed to be the same for
#   all contexts, especially if they use different client APIs or even different
#   context creation hints.
#
#   @ingroup context
#

proc glfwGetProcAddress*(procname: cstring): TGLFWglproc {.
    importc: "glfwGetProcAddress", dynlib: libglfw.}
#************************************************************************
#  Global definition cleanup
# ***********************************************************************
# ------------------- BEGIN SYSTEM/COMPILER SPECIFIC --------------------

# -------------------- END SYSTEM/COMPILER SPECIFIC ---------------------
