on run {input, parameters}
	set PathToThunderbird to "/Applications/Thunderbird.app/Contents/MacOS/thunderbird -compose "
	set MessageSubject to "subject='Neue Datei'"
	set MessageBody to "body='Text...'"
	
	set PathToFiles to {}
	repeat with inputitem in input
		set iteminfo to info for (inputitem as alias)
		if not folder of iteminfo then
			set PathToFiles to PathToFiles & (POSIX path of (inputitem as Unicode text))
		end if
	end repeat
	
	set Attachments to "attachment='"
	repeat with a_file in PathToFiles
		if a_file as string is (last item of PathToFiles) then
			set Attachments to Attachments & "file://" & a_file
		else
			set Attachments to Attachments & "file://" & a_file & ","
		end if
	end repeat
	
	set Arguments to MessageSubject & "," & MessageBody & "," & Attachments & "'"
	
	do shell script PathToThunderbird & quoted form of Arguments
end run