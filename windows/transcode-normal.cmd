mkdir mp4

for %%i in (*) do (
	@echo %%i
	x264 "%%i" -q 31 --preset fast --vf resize:width=640,height=480 -o .\mp4\temp.v.mp4
	ffmpeg -y -i "%%i" ".\mp4\temp.wav"
	normalize ".\mp4\temp.wav"
	neroAacEnc -q 0.25 -if ".\mp4\temp.wav" -of ".\mp4\temp.a.mp4"
	MP4Box.exe -inter 500 -add ".\mp4\temp.v.mp4" -add ".\mp4\temp.a.mp4" -new ".\mp4\%%i.mp4"
	del .\mp4\temp.wav
	del .\mp4\temp.v.mp4
	del .\mp4\temp.a.mp4
)