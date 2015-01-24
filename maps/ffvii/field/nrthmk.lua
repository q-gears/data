EntityContainer = {}



EntityContainer[ "Director" ] = {
    on_start = function( self )
        background2d:autoscroll_to_entity( entity_manager:get_entity( "Cloud" ) )
        --0358 (end 0358): [UNREVERSED] BTLMD(20, 00);
        --035b (end 035b): music:execute_akao( 10, pointer_to_field_AKAO_0 ); -- play field music
        --035d (end 035d): field:map_name(2);

        return 0
    end,
}



EntityContainer[ "Cloud" ] = {
    cloud = nil,

    on_start = function( self )
        player_lock( true )
        set_entity_to_character( "Cloud", "Cloud" )
        self.cloud = entity_manager:get_entity( "Cloud" )
        self.cloud:set_solid( true )
        self.cloud:set_visible( true )
        player_lock( false )

        return 0
    end,
    
    script_3 = function( self )
        self.cloud:set_solid( false )
        self.cloud:set_position( 0, -7.82031, 3.83594 ) -- triangle_id=1
        self.cloud:set_move_speed( 4.21875 )
        script:wait( 1.83333 )
        self.cloud:move_to_position( 0.4375, -23.5 )
        self.cloud:move_sync()
        self.cloud:move_to_position( -4, -23.5 )
        self.cloud:move_sync()
        -- set speed of entity animation to "2"
        self.cloud:set_move_speed( 7.5 )
        self.cloud:set_rotation( 0 )
        self.cloud:play_animation_stop( "3" ) -- speed=1
        self.cloud:animation_sync()
        return 0
    end,
    
    script_4 = function( self )
        --self.cloud:play_animation( "4" ) -- speed=1
        --self.cloud:animation_sync()
        self.cloud:move_to_position( -9.67969, -24.1875 )
        self.cloud:move_sync()
        --041e (end 041e): music:execute_akao( 29, 40, 0, 0, 0, 0, 1a1 );
    return 0
    end,
}



EntityContainer[ "Barret" ] = {
    barret = nil,

    on_start = function( self )
        set_entity_to_character( "Barret", "Barret" )
        self.barret = entity_manager:get_entity( "Barret" )

        if FFVII.Data.progress_game == 27 then
            self.barret:set_position( 0, -7.82031, 3.83594 )
            self.barret:set_visible( true )
            script:request( Script.ENTITY, "Barret", "run_from_reactor", 6 )
        end

        self.barret:set_visible( false )

        return 0
    end,
    
    run_from_reactor = function( self )
        if FFVII.Data.progress_game == 27 then
        self.barret:set_move_auto_speed( 3.75 )
        self.barret:set_solid( false )
        self.barret:set_visible( true )
        script:wait( 0.133333 )
        self.barret:move_to_position( 0.046875, -23.6797 )
        self.barret:move_sync()
        self.barret:move_to_position( -9.67969, -23.7656 )
        self.barret:move_sync()
        end

        return 0
    end,
}


EntityContainer[ "Biggs" ] = {
    biggs = nil,

    on_start = function( self )
        self.biggs = entity_manager:get_entity( "Biggs" )

        self.biggs:set_position( 1.5, -23.3594, 3.83594 )
        self.biggs:set_solid( false )

        if FFVII.Data.progress_game >= 10 then
            --self.biggs:set_talkable( false );
            self.biggs:set_solid( false )
            self.biggs:set_visible( false )
        end
        
        if FFVII.Data.progress_game >= 27 then
            self.biggs:set_position( 0.296875, -8.08594, 3.83594 ) -- triangle_id=1
            --self.biggs:set_talkable( true );
            self.biggs:set_solid( true )
            self.biggs:set_visible( true )
        end

        script:request( Script.ENTITY, "Biggs", "main_script", 6 )

        return 0
    end,
    
    main_script = function( self )
        self.biggs:set_default_animation( "Run" ) -- speed=1
        self.biggs:play_animation( "Run" )
        self.biggs:set_move_auto_speed( 4.21875 )
        if FFVII.Data.progress_game >= 27 then
            self.biggs:move_to_position( 0.046875, -23.6797 )
            self.biggs:move_sync()
            self.biggs:move_to_position( -9.67969, -23.7656 )
            self.biggs:move_sync()
        end
        
        if FFVII.Data.progress_game < 10 then
            self.biggs:set_visible( true )
            self.biggs:move_to_position( -0.21875, -22.4219 )
            self.biggs:move_sync()
            self.biggs:move_to_position( 0.117188, -6.33594 )
            self.biggs:move_sync()
            --self.biggs:set_talkable( false );
            self.biggs:set_solid( false )
            self.biggs:set_visible( false )
        end

        self.biggs:set_visible( false )

        return 0
    end,
}



EntityContainer[ "Jessie" ] = {
    jessie = nil,

    on_start = function( self )
        self.jessie = entity_manager:get_entity( "Jessie" )

        self.jessie:set_position( 1.5, -23.3594, 3.83594 )
        self.jessie:set_solid( false )

        if FFVII.Data.progress_game >= 10 then
            --self.jessie:set_talkable( false );
            self.jessie:set_solid( false )
            self.jessie:set_visible( false )
        end
        
        if FFVII.Data.progress_game >= 27 then
            self.jessie:set_position( 0.296875, -8.08594, 3.83594 ) -- triangle_id=1
            --self.jessie:set_talkable( true );
            self.jessie:set_solid( true )
            self.jessie:set_visible( true )
        end

        script:request( Script.ENTITY, "Jessie", "main_script", 6 )

        return 0
    end,
    
    main_script = function( self )
        if FFVII.Data.progress_game >= 27 then
            self.jessie:set_solid( false )
            script:wait( 1.66667 )
            self.jessie:set_move_auto_speed( 5.39062 )
            self.jessie:move_to_position( 0.5, -24 )
            self.jessie:move_sync()
            self.jessie:move_to_position( -2, -23.875 )
            self.jessie:move_sync()
            self.jessie:set_default_animation( "Stumble" ) -- speed=1
            self.jessie:play_animation( "Stumble" )
            self.jessie:move_to_position( -448, -3056, false );
            self.jessie:set_move_speed( 1.875 )
            self.jessie:move_to_position( -512, -3056, false );
            self.jessie:play_animation_stop( "Stubmle", 0.633333, 0.633333 ) -- speed=1
            self.jessie:animation_sync()
        end
        
        if FFVII.Data.progress_game < 10 then
            self.jessie:set_visible( true )
            self.jessie:set_move_auto_speed( 5.39062 )
            self.jessie:move_to_position( -0.148438, -23.0078 )
            self.jessie:move_sync()
            self.jessie:move_to_position( 0.117188, -6.33594 )
            self.jessie:move_sync()
            --self.jessie:set_talkable( false );
            self.jessie:set_solid( false )
            self.jessie:set_visible( false )
        end

        self.jessie:set_visible( false )

        return 0
    end,
    
    get_up = function( self )
        self.jessie:set_move_speed( 7.5 )
        -- set speed of entity animation to "2"
        self.jessie:play_animation_stop( "StumbleGetUp" ) -- speed=1
        self.jessie:animation_sync()
        self.jessie:set_default_animation( "Idle" ) -- speed=1
        self.jessie:play_animation( "Idle" )
        self.jessie:move_to_position( -9.67969, -24 )
        self.jessie:move_sync()
        return 0
    end,
}



EntityContainer[ "Wedge" ] = {
    wedge = nil,

    on_start = function( self )
        self.wedge = entity_manager:get_entity( "Wedge" )
        self.wedge:set_position( 4.51563, -23.2109, 3.83594 )

        if FFVII.Data.progress_game >= 10 then
            self.wedge:set_visible( true )
            self.wedge:set_position( -6.97656, -23.7344, 3.83594 ) -- triangle_id=2
            self.wedge:set_rotation( 247.5 )
            self.wedge:set_default_animation( "LookAround" ) -- speed=1
            self.wedge:play_animation( "LookAround" )
        end
        script:request( Script.ENTITY, "Wedge", "main_script", 6 )

        return 0
    end,
    
        main_script = function( self )
        if FFVII.Data.progress_game < 10 then
            self.wedge:set_solid( true )
            self.wedge:set_visible( true )
            self.wedge:set_move_auto_speed( 3.51562 )
            self.wedge:move_to_position( -6.97656, -23.7344 )
            self.wedge:move_sync()
            self.wedge:set_rotation( 247.5 )
            self.wedge:set_default_animation( "LookAround" ) -- speed=1
            self.wedge:play_animation( "LookAround" )
            FFVII.Data.progress_game = 10

        end
        if FFVII.Data.progress_game >= 27 then
            script:wait( 4.66667 )
            self.wedge:set_move_speed( 2.34375 )
            self.wedge:move_to_position( -10.0938, -23.6719 )
            self.wedge:move_sync()
        end

        return 0
    end,
}



EntityContainer[ "BackgroundLight0" ] = {
    on_start = function( self )
        background2d:play_animation_looped( "Light0" )

        return 0
    end,
}



EntityContainer[ "BackgroundLight1" ] = {
    on_start = function( self )
        script:wait( 0.133333 )
        background2d:play_animation_looped( "Light1" )

        return 0
    end,
}



EntityContainer[ "BackgroundLight2" ] = {
    on_start = function( self )
        while true do
            local number = math.random( 1, 3 )
            background2d:play_animation_once( "Light2_" .. number )
            background2d:animation_sync( "Light2_" .. number )
        end

        return 0
    end,
}



EntityContainer[ "BackgroundWarning" ] = {
    on_start = function( self )
        local temp5_27 = 0;

        while true do
            if temp5_27 > 2 then
                temp5_27 = 0
            end

            local number = math.random( 0, 3 )
            if number == 0 then
                number = 1
            end

            for v = 0, number, 1 do
                background2d:play_animation_once( "Warning" .. temp5_27 .. "Zizizi" )
                background2d:animation_sync( "Warning" .. temp5_27 .. "Zizizi" )
            end

            background2d:play_animation_once( "Warning" .. temp5_27 .. "Light" )
            background2d:animation_sync( "Warning" .. temp5_27 .. "Light" )
            script:wait( 0.0333333 )
            background2d:play_animation_once( "Warning" .. temp5_27 .. "Light" )
            background2d:animation_sync( "Warning" .. temp5_27 .. "Light" )
            script:wait( 0.0333333 )
            background2d:play_animation_once( "Warning" .. temp5_27 .. "Light" )
            background2d:animation_sync( "Warning" .. temp5_27 .. "Light" )
            background2d:play_animation_once( "WarningBlank" )
            background2d:animation_sync( "WarningBlank" )
            script:wait( 0.0333333 )

            temp5_27 = temp5_27 + 1
        end

        return 0
    end,
}



EntityContainer[ "Gateway0" ] = {
    on_start = function( self )
        return 0
    end,

    on_enter_line = function( self, entity )
        return 0
    end,

    on_move_to_line = function( self, entity )
        return 0
    end,

    on_cross_line = function( self, entity )
        if entity == "Cloud" then
            load_field_map_request( "ffvii_md1_2", "Spawn_nrthmk" )
        end

        return 0
    end,

    on_leave_line = function( self, entity )
        return 0
    end,
}



EntityContainer[ "Gateway1" ] = {
    on_start = function( self )
        return 0
    end,

    on_enter_line = function( self, entity )
        return 0
    end,

    on_move_to_line = function( self, entity )
        return 0
    end,

    on_cross_line = function( self, entity )
        if entity == "Cloud" then
            load_field_map_request( "ffvii_nmkin_1", "Spawn_nrthmk" )
        end

        return 0
    end,

    on_leave_line = function( self, entity )
        return 0
    end,
}

EntityContainer[ "Gateway1" ] = {
    on_start = function( self )
        return 0
    end,

    on_enter_line = function( self, entity )
        return 0
    end,

    on_move_to_line = function( self, entity )
        return 0
    end,

    on_cross_line = function( self, entity )
        if entity == "Cloud" then
            load_field_map_request( "ffvii_nmkin_1", "Spawn_nrthmk" )
        end

        return 0
    end,

    on_leave_line = function( self, entity )
        return 0
    end,
}

EntityContainer[ "Gateway2" ] = {
    on_start = function( self )
        return 0
    end,

    on_enter_line = function( self, entity )
        return 0
    end,

    on_move_to_line = function( self, entity )
        return 0
    end,

    on_cross_line = function( self, entity )
        --if entity == "Cloud" then
        --    load_field_map_request( "ffvii_nmkin_1", "Spawn_nrthmk" )
        --end

        return 0
    end,

    on_leave_line = function( self, entity )
        return 0
    end,
}