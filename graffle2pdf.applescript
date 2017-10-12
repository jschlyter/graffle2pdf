on run argv
	
	if (count of argv) is not 1 then
		error "usage graffle2pdf /full/path/to/file.graffle"
	end if
	
	set theGraffleFile to POSIX file (item 1 of argv)
	--set theGraffleFile to "work:kirei:proj:isoc-il:report:figures:x.graffle"
	
	tell application "OmniGraffle"
		try
			open file theGraffleFile
			log "Opening " & theGraffleFile
		on error
			activate
			set theMessage to "Error: couldn't open graffle file " & (item 1 of argv)
			beep
			error theMessage
		end try
		
		set theDocument to front document
		set theCanvases to every canvas of theDocument
		set fileName to (name of theDocument)
		set filePath to (path of theDocument)
		set adjustment to (length of filePath) - (length of fileName)
		set fileDirectory to texts 1 thru adjustment of filePath
		
		set canvasCount to count of canvases of theDocument
		set area type of current export settings to current canvas
		
		repeat with canvasNumber from 1 to canvasCount
			set canvasName to name of canvas canvasNumber of theDocument
			set canvasName to canvasName's words as string
			set canvas of front window to canvas canvasNumber of theDocument
			set saveLocation to fileDirectory & canvasName & ".pdf"
			set area type of current export settings to all graphics
			log "Exporting canvas '" & canvasName & "' to " & saveLocation
			save theDocument as "pdf" in POSIX file (saveLocation)
		end repeat
		
		close theDocument without saving
		
	end tell
end run
