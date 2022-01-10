on run {input, parameters}
	set MessageRecipient to "john.doe@example.com"
	set MessageSubject to "Example with attachment"
	set MessageBody to "Whatever..."
	
	set pathToFile to POSIX path of input
	set theAttachment to pathToFile as «class furl»
	
	tell application "Microsoft Outlook"
		activate
		set newMessage to make new outgoing message with properties {subject:MessageSubject, content:MessageBody}
		make new recipient at newMessage with properties {type:to recipient type, email address:{address:MessageRecipient}}
		make new attachment at end of newMessage with properties {file:theAttachment}
		open newMessage
	end tell
end run