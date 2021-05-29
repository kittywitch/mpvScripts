function on_pause_show_osc(name, value)
    if value == true then
        delayed(0, "no-osd set osd-level 0")
        delayed(0.1, "script-message osc-visibility always")
        delayed(0.3, "no-osd set osd-level 1")
    else
        delayed(0, "no-osd set osd-level 0")
        delayed(0.1, "script-message osc-visibility auto")
        delayed(0.3, "no-osd set osd-level 1")
    end
end


function show_osc_dur(duration)
        delayed(0, "no-osd set osd-level 0")
        delayed(0.1, "script-message osc-visibility always")
        delayed(0.3, "no-osd set osd-level 1")
        delayed(duration, "no-osd set osd-level 0")
        delayed(duration + 0.1, "script-message osc-visibility auto")
        delayed(duration + 0.3, "no-osd set osd-level 1")
end

function delayed(t, c)
   mp.add_timeout(t, function() mp.command(c) end)
end

mp.register_script_message("show_osc_dur", show_osc_dur)
mp.observe_property("pause", "bool", on_pause_show_osc)
