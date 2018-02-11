local theme_path = "/THEMES/KTheme/"

-- local options = {
--   { "Color", COLOR, WHITE }
-- }

local menuIconNormal = {}
local menuIconSelected = {}
local opentx_icon = Bitmap.open(theme_path.."topmenu_opentx.bmp")

local function loadMenuIcon(index, filename)
  menuIconNormal[index] = Bitmap.openMaskOnBackground(filename, HEADER_CURRENT_BGCOLOR, HEADER_BGCOLOR)
  menuIconSelected[index] = Bitmap.openMaskOnBackground(filename, MENU_TITLE_COLOR, HEADER_BGCOLOR)
end

local function loadColors()
  lcd.setColor(TEXT_COLOR, WHITE)
  lcd.setColor(TEXT_BGCOLOR, lcd.RGB(10, 78, 121))
  lcd.setColor(TEXT_INVERTED_COLOR, WHITE)
  lcd.setColor(TEXT_INVERTED_BGCOLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(LINE_COLOR, GREY)
  lcd.setColor(SCROLLBOX_COLOR,WHITE)
  lcd.setColor(MENU_TITLE_BGCOLOR, DARKGREY)
  lcd.setColor(MENU_TITLE_COLOR, WHITE)
  lcd.setColor(MENU_TITLE_DISABLE_COLOR, BLACK)
  lcd.setColor(HEADER_COLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(ALARM_COLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(WARNING_COLOR, YELLOW)
  lcd.setColor(TEXT_DISABLE_COLOR, GREY)
  lcd.setColor(CURVE_AXIS_COLOR, LIGHTGREY)
  lcd.setColor(CURVE_COLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(CURVE_CURSOR_COLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(TITLE_BGCOLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(TRIM_BGCOLOR, lcd.RGB(32, 34, 42))
  lcd.setColor(TRIM_SHADOW_COLOR, lcd.RGB(100, 100, 100))
  lcd.setColor(MAINVIEW_PANES_COLOR, GREY)
  lcd.setColor(MAINVIEW_GRAPHICS_COLOR, WHITE)
  lcd.setColor(HEADER_BGCOLOR, BLACK)
  lcd.setColor(HEADER_ICON_BGCOLOR, BLACK)
  lcd.setColor(HEADER_CURRENT_BGCOLOR, lcd.RGB(10, 78, 121))
  lcd.setColor(OVERLAY_COLOR, BLACK)
  -- lcd.setColor(BARGRAPH1_COLOR, RED)
  -- lcd.setColor(BARGRAPH2_COLOR, lcd.RGB(167, 167, 167))
  -- lcd.setColor(BARGRAPH_BGCOLOR, lcd.RGB(222, 222, 222))
end

local function loadMenusIcons()
  loadMenuIcon(ICON_OPENTX, "mask_opentx.png")
  loadMenuIcon(ICON_RADIO, "mask_menu_radio.png")
  loadMenuIcon(ICON_RADIO_SETUP, "mask_radio_setup.png")
  loadMenuIcon(ICON_RADIO_SD_BROWSER, "mask_radio_sd_browser.png")
  loadMenuIcon(ICON_RADIO_GLOBAL_FUNCTIONS, "mask_radio_global_functions.png")
  loadMenuIcon(ICON_RADIO_TRAINER, "mask_radio_trainer.png")
  loadMenuIcon(ICON_RADIO_HARDWARE, "mask_radio_hardware.png")
  loadMenuIcon(ICON_RADIO_VERSION, "mask_radio_version.png")
  loadMenuIcon(ICON_MODEL, "mask_menu_model.png")
  loadMenuIcon(ICON_MODEL_SETUP, "mask_model_setup.png")
  loadMenuIcon(ICON_MODEL_HELI, "mask_model_heli.png")
  loadMenuIcon(ICON_MODEL_FLIGHT_MODES, "mask_model_flight_modes.png")
  loadMenuIcon(ICON_MODEL_INPUTS, "mask_model_inputs.png")
  loadMenuIcon(ICON_MODEL_MIXER, "mask_model_mixer.png")
  loadMenuIcon(ICON_MODEL_OUTPUTS, "mask_model_outputs.png")
  loadMenuIcon(ICON_MODEL_CURVES, "mask_model_curves.png")
  loadMenuIcon(ICON_MODEL_GVARS, "mask_model_gvars.png")
  loadMenuIcon(ICON_MODEL_LOGICAL_SWITCHES, "mask_model_logical_switches.png")
  loadMenuIcon(ICON_MODEL_SPECIAL_FUNCTIONS, "mask_model_special_functions.png")
  loadMenuIcon(ICON_MODEL_LUA_SCRIPTS, "mask_model_lua_scripts.png")
  loadMenuIcon(ICON_MODEL_TELEMETRY, "mask_model_telemetry.png")
  loadMenuIcon(ICON_STATS, "mask_menu_stats.png")
  loadMenuIcon(ICON_STATS_THROTTLE_GRAPH, "mask_stats_throttle_graph.png")
  loadMenuIcon(ICON_STATS_TIMERS, "mask_stats_timers.png")
  loadMenuIcon(ICON_STATS_ANALOGS, "mask_stats_analogs.png")
  loadMenuIcon(ICON_STATS_DEBUG, "mask_stats_debug.png")
  loadMenuIcon(ICON_THEME, "mask_menu_theme.png")
  loadMenuIcon(ICON_THEME_SETUP, "mask_theme_setup.png")
  loadMenuIcon(ICON_THEME_VIEW1, "mask_theme_view1.png")
  loadMenuIcon(ICON_THEME_VIEW2, "mask_theme_view2.png")
  loadMenuIcon(ICON_THEME_VIEW3, "mask_theme_view3.png")
  loadMenuIcon(ICON_THEME_VIEW4, "mask_theme_view4.png")
  loadMenuIcon(ICON_THEME_VIEW5, "mask_theme_view5.png")
  loadMenuIcon(ICON_THEME_ADD_VIEW, "mask_theme_add_view.png")
  loadMenuIcon(ICON_MONITOR, "mask_monitor.png")
  loadMenuIcon(ICON_MONITOR_CHANNELS1, "mask_monitor_channels1.png")
  loadMenuIcon(ICON_MONITOR_CHANNELS2, "mask_monitor_channels2.png")
  loadMenuIcon(ICON_MONITOR_CHANNELS3, "mask_monitor_channels3.png")
  loadMenuIcon(ICON_MONITOR_CHANNELS4, "mask_monitor_channels4.png")
  loadMenuIcon(ICON_MONITOR_LOGICAL_SWITCHES, "mask_monitor_logsw.png")
end

local function load()
  loadColors()
  loadMenusIcons()
end

local function drawBackground()
  lcd.drawFilledRectangle(0, 0, LCD_W, LCD_H, TEXT_BGCOLOR);
end

local function drawTopbarBackground(icon)
  lcd.drawFilledRectangle(0, 0, LCD_W, MENU_HEADER_HEIGHT, HEADER_BGCOLOR)
  lcd.drawFilledRectangle(0, 0, 41, MENU_HEADER_HEIGHT, HEADER_ICON_BGCOLOR)
  if (icon == ICON_OPENTX) then
    lcd.drawBitmap(opentx_icon, 5, 7)
  else
    lcd.drawBitmap(menuIconSelected[icon], 5, 7);
  end
  lcd.drawTopbarDatetime()
end

local function drawMenuIcon(index, position, selected)
  if (selected) then
    lcd.drawBitmap(menuIconSelected[index], 50+position*MENU_ICONS_SPACING, 7)
  else
    lcd.drawBitmap(menuIconNormal[index], 50+position*MENU_ICONS_SPACING, 7)
  end
end

return { name="KTheme", load=load, drawBackground=drawBackground, drawTopbarBackground=drawTopbarBackground, drawMenuIcon=drawMenuIcon }
