extends Node

signal minute_passed(total_minutes)
signal hour_passed(hour)
signal day_started(day)
signal new_day
signal season_changed(season)

const MINUTES_PER_DAY = 1440
const MINUTES_PER_HOUR = 60
const IN_GAME_MINUTES_PER_REAL_SECOND = 1 # Default speed

var current_minute: int = 0
var current_hour: int = 6
var current_day: int = 1
var current_season: int = 0 # 0: Spring, 1: Summer, 2: Fall, 3: Winter
var current_year: int = 1

var time_scale: float = 60.0 # Real seconds per in-game day? No, usually X in-game mins per real sec.
# Let's say 1 real second = 1 in-game minute.
# So a day (1440 mins) takes 24 minutes.
# If we want faster, we increase the timer tick.

var timer: Timer
var is_paused: bool = false

enum Season { SPRING, SUMMER, FALL, WINTER }

func _ready():
	timer = Timer.new()
	timer.wait_time = 1.0 # 1 second
	timer.timeout.connect(_on_timer_timeout)
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	if is_paused: return
	advance_minutes(1)

func advance_minutes(amount: int):
	current_minute += amount
	if current_minute >= 60:
		current_minute -= 60
		current_hour += 1
		emit_signal("hour_passed", current_hour)
		
		if current_hour >= 24:
			current_hour = 0
			start_next_day()
	
	emit_signal("minute_passed", current_hour * 60 + current_minute)

func start_next_day():
	current_day += 1
	if current_day > 28: # 28 days per season
		current_day = 1
		current_season += 1
		if current_season > 3:
			current_season = 0
			current_year += 1
		emit_signal("season_changed", current_season)
	
	emit_signal("new_day")
	emit_signal("day_started", current_day)
	
	# Reset time to 6 AM
	current_hour = 6
	current_minute = 0

func get_time_string() -> String:
	return "%02d:%02d" % [current_hour, current_minute]

func get_date_string() -> String:
	var seasons = ["Spring", "Summer", "Fall", "Winter"]
	return "%s %d, Year %d" % [seasons[current_season], current_day, current_year]

func sleep():
	start_next_day()
	# Restore energy logic should be handled by Player listening to new_day
