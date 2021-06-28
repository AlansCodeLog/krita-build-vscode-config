The .vscode folder I use for building krita on windows, though the scripts can also be run by themselves as well. Mostly publishing this for myself but I tried to make it configurable.

Works pretty well, includes are understood, etc, autocomplete is slow as hell but works. Debugging seems to work although honestly I do not launch the debugger much at all.

# Installing/Configuring

## VS Code

Extensions used:

C/C++ (required)
Qt tools - Lets you open .ui files in Qt Creator + provides debugger extensions (via natvis files).
CMake Tools - Only because Qt Tools needs it. I did not have time to read the docs and it was just easier to create scripts+tasks, it's disabled from auto running in the included settings.

Other Useful Extensions:

SVG Gallery - for quickly browsing icons
quick-run-panel - for quickly launching tasks
Rewrap - for wrapping comments/commits

### Setup

Clone the repo so it's your `.vscode` folder inside the krita source folder. To ignore the folder without touching the `.gitignore`, copy the included `git-info-exclude`:
```cmd
copy ".vscode\git-info-exclude" ".git\info\exclude" 
```

Configure all the parts that say `TOCONFIGURE` inside `settings.json`. You can check they're correct by running the `Echo VS Code Variable` task.

## Configuring Scripts

Open `env.bat` and configure all the variables inside the TOCONFIGURE region.

Note that in both VS Code and the scripts there are some env variables named `DIR_*` and `PATH_*`. These are system wide variables I have set for convenience (I use a program called Rapid Environment Editor, it's great). You can ignore them and set hardcoded paths.

To be able to run the scripts from anywhere without VS Code, you will need to set a `KRITA_SCRIPTS_DIR` env variable that points to the folder the scripts are kept. This way the scripts can run `env.bat` and take care of cd-ing to the right folders.

If using the VS Code's terminal, the variable is set in the `settings.json` and is therefore available to all terminals it launches.

# Other Notes

- The `Open resourcescache.sqlite` task assumes DB Browser is installed.

- The secret to getting vscode to understand everything is configuring the project with  `-DCMAKE_EXPORT_COMPILE_COMMANDS=ON` and setting `compileCommands` to it in `c_cpp_properties.json`.

- If you're using an SSD, the C++ extension is known to cache huge amounts of data, you migh want to set `C_Cpp.intelliSenseCachePath` and `C_Cpp.default.browse.databaseFilename` in your user settings.

- Tests do not work out of the box, they must be copied from the build directory to the install directory or they just all fail. My test script takes care of it.

- Variable expansion on windows is ***weird***. If using something like Rapid Environment Variable to edit them, it might look like variables will expand correctly in the program, but they don't in the command line. Unfortunately the simplest thing, short of trying to alphabetically order paths :vomiting_face:, seems to be to avoid nesting. Have only PATH be expandable and constructed from other non-expandable variables (e.g. `PATH_*`), which can only contain hardcoded paths, no referencing useful variables (e.g. `DIR_*`) :weary:.

