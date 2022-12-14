return function(awful, beautiful)
    local handle_border = function(c)
        local screen = c.screen
        local visible_clients = awful.client.tiled(screen)
        if #visible_clients == 1 then
            for _, val in pairs(visible_clients) do
                val.border_width = 0
            end
        else
            for _, val in pairs(visible_clients) do
                val.border_width = beautiful.border_width
            end
        end
    end

    tag.connect_signal("tagged", handle_border)
    tag.connect_signal("untagged", handle_border)
    tag.connect_signal("request::activate", handle_border)
    -- TODO: Connect also to float toggles
end
