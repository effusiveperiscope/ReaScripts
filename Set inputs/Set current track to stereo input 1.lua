selected_count = reaper.CountSelectedTracks(0)
for i=0, selected_count-1 do
    media_track = reaper.GetSelectedTrack(0,i)
    if media_track ~= nil then
        reaper.SetMediaTrackInfo_Value(media_track, 'I_RECINPUT', 1024)
        if reaper.GetMediaTrackInfo_Value(media_track, 'I_RECARM') == 0 then
            reaper.SetMediaTrackInfo_Value(media_track, 'I_RECARM', 1)
        else
            reaper.SetMediaTrackInfo_Value(media_track, 'I_RECARM', 0)
        end
    end
end
