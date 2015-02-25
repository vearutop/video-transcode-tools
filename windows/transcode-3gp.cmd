mkdir 3gp

for %%i in (*) do (
	@echo %%i
	ffmpeg -i "%%i" -s 320x240 -vcodec mpeg4 -b 200000 -an -y .\3gp\temp.v.3gp
	ffmpeg -y -i "%%i" ".\3gp\temp.wav"
	normalize ".\3gp\temp.wav"
	neroAacEnc -q 0.15 -if ".\3gp\temp.wav" -of ".\3gp\temp.a.aac"
	Mp4Box.exe -inter 500 -add ".\3gp\temp.v.3gp" -add ".\3gp\temp.a.aac" -new ".\3gp\%%i.3gp"
	del .\3gp\temp.wav
	del .\3gp\temp.v.3gp
	del .\3gp\temp.a.3gp
)