# GUCCI COLLECTION — Windows VST3 Installer

This project packages the two supplied Windows x64 VST3 bundles:
- **ZAY KEYS** (GOLDMINE AUDIO, version 1.0.1)
- **MPC3000 SIMULATOR** (MPC3000Sim, version 0.1.0)

## Build on Windows
1. Install Inno Setup 6.
2. Open PowerShell in this folder.
3. Run: `& \"${env:ProgramFiles(x86)}\\Inno Setup 6\\ISCC.exe\" GUCCI_COLLECTION.iss`
4. The installer will be created in `output/`.

## Build with GitHub Actions
Push this project to a GitHub repository and run **Build GUCCI COLLECTION Installer** from Actions (or push a change to the watched paths). Download the `GUCCI-COLLECTION-Windows-Installer` artifact from the successful workflow run.

## Installer behavior
- Full install selects both instruments by default.
- Custom install allows selecting either or both plugins.
- Default destination: `C:\Program Files\Common Files\VST3`.
- Each plugin is installed into its own `.vst3` bundle directory.
- The installer tracks installed files for normal uninstallation.

## Important
The installer packages the supplied plugin binaries; it does not compile, test, or certify the plugins. The VST3 bundles were checked for the expected Windows x64 binary and `moduleinfo.json` paths. Actual loading should still be tested in the target DAW.

The included descriptions are marketing copy, not a guarantee of additional features beyond the supplied plugin builds.
