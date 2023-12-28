
function run()
    local project_path = reaper.GetProjectPath()
    project_path = project_path:gsub("\\","/")
    local ret, url = reaper.GetUserInputs("Enter URL to download", 1,
        "URL to download", "")
    if not ret then return end

    local ytdlp_command = ("yt-dlp -x --audio-format vorbis "..
        "--print after_move:filepath -o \""..project_path..
        "/%(title)s.%(ext)s\" "..url)

    local file = io.popen(ytdlp_command, "r")
    if not file then return end
    local save_path = file:read("*a")
    file:close()
    if not save_path then return end
    save_path = save_path:gsub("\\","/"):match("^%s*(.-)%s*$")

    reaper.ShowConsoleMsg(save_path)
    assert(reaper.file_exists(save_path), "Output file DNE")

    reaper.InsertMedia(save_path, 0)
end

run()
