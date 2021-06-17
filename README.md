The .vscode folder I use for building krita on windows.

Scripts can be run by themselves, of course. Just set an env `SCRIPTS` to the folder the scripts are kept, configure `env.bat`, run any script from anywhere, they take care of cd-ing to the right folders.

Mostly saving this for myself but publishing in case anyone is curious.

Works pretty well, includes are understood, etc, autocomplete is slow as hell but works. Debugging seems to work although honestly I do not launch the debugger much at all.

With VS Code requires the following extensions:

C/C++
Qt tools - Not exactly required but a really nice extra.
CMake Tools - Only because Qt Tools needs it. I did not have time to read the docs and it was just easier to create scripts+tasks.

Also useful:

SVG Gallery - for quickly browsing icons
quick-run-panel - for quickly launching tasks
Rewrap - for wrapping comments/commits

# Other Notes

The secret to getting vscode to understand everything is configuring the project with  `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` and setting `compileCommands` to it in `c_cpp_properties.json`.

Tests do not work out of the box, they must be copied from the build directory to the install directory or they just all fail. My test script takes care of it.

# How the Scripts Work

VS Code can't really do env variables that depend on variables. In general, using only tasks is a headache, using bat scripts ends up being easier and is also more portable.

Build directories and all variables can be customized in `env.bat`.

But the other scripts when called need to know where `env.bat` is to set them.

So a SCRIPTS variable is set (in settings.json so that it's accessible to all terminal instances) that points to the .vscode folder containing the scripts.
