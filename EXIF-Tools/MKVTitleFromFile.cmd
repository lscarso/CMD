@echo off
echo * Starting Tagging MKV files
for %%m in (%~1\*.mkv) do (
echo Changing %%m Title to "%%~nm"
"C:\Data\mkvtoolnixPortable\mkvtoolnix\mkvpropedit" "%%m" -e info -s title="%%~nm"
echo -----
)
echo * Finished