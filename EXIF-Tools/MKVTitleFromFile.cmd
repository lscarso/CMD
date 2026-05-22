@echo off
echo * Starting Tagging MKV files
pushd %~1
for /R %%m in (*.mkv) do (
echo Changing %%m Title to "%%~nm"
"C:\Data\mkvtoolnixPortable\mkvpropedit" "%%m" -e info -s title="%%~nm"
echo -----
)
echo * Finished
popd
