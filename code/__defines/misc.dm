#define DEBUG

#define subtypesof(type) (typesof(type) - type)

#define get_turf(A) get_step(A,0)

#define IN_RANGE(source, target) (get_dist(source, target) <= 1)

// Turf-only flags.
#define NOJAUNT 1 // This is used in literally one place, turf.dm, to block ethereal jaunt.

#define TRANSITIONEDGE 7 // Distance from edge to move to another z-level.

// Invisibility constants.
#define INVISIBILITY_LIGHTING             20
#define INVISIBILITY_LEVEL_ONE            35
#define INVISIBILITY_LEVEL_TWO            45
#define INVISIBILITY_OBSERVER             60
#define INVISIBILITY_EYE                  61

#define SEE_INVISIBLE_LIVING              25
#define SEE_INVISIBLE_OBSERVER_NOLIGHTING 15
#define SEE_INVISIBLE_LEVEL_ONE           35
#define SEE_INVISIBLE_LEVEL_TWO           45
#define SEE_INVISIBLE_CULT		          60
#define SEE_INVISIBLE_OBSERVER            61

#define SEE_INVISIBLE_MINIMUM 5
#define INVISIBILITY_MAXIMUM 100

// For secHUDs and medHUDs and variants. The number is the location of the image on the list hud_list of humans.
#define      HEALTH_HUD 1 // A simple line rounding the mob's number health.
#define      STATUS_HUD 2 // Alive, dead, diseased, etc.
#define          ID_HUD 3 // The job asigned to your ID.
#define      WANTED_HUD 4 // Wanted, released, paroled, security status.
#define    IMPLOYAL_HUD 5 // Loyality implant.
#define     IMPCHEM_HUD 6 // Chemical implant.
#define    IMPTRACK_HUD 7 // Tracking implant.
#define SPECIALROLE_HUD 8 // AntagHUD image.
#define  STATUS_HUD_OOC 9 // STATUS_HUD without virus DB check for someone being ill.
#define 	  LIFE_HUD 10 // STATUS_HUD that only reports dead or alive

//some colors
#define COLOR_WHITE				"#FFFFFF"
#define COLOR_SILVER			"#C0C0C0"
#define COLOR_GRAY				"#808080"
#define COLOR_BLACK				"#000000"
#define COLOR_RED				"#FF0000"
#define COLOR_MAROON			"#800000"
#define COLOR_YELLOW			"#FFFF00"
#define COLOR_OLIVE				"#808000"
#define COLOR_LIME				"#00FF00"
#define COLOR_GREEN				"#008000"
#define COLOR_CYAN				"#00FFFF"
#define COLOR_TEAL				"#008080"
#define COLOR_BLUE				"#0000FF"
#define COLOR_NAVY				"#000080"
#define COLOR_PINK				"#FF00FF"
#define COLOR_PURPLE			"#800080"
#define COLOR_ORANGE			"#FF9900"
#define COLOR_LUMINOL			"#66FFFF"
#define COLOR_BEIGE				"#CEB689"
#define COLOR_BLUE_GRAY			"#6A97B0"
#define COLOR_BROWN				"#B19664"
#define COLOR_DARK_BROWN		"#917448"
#define COLOR_DARK_ORANGE		"#B95A00"
#define COLOR_GREEN_GRAY		"#8DAF6A"
#define COLOR_RED_GRAY			"#AA5F61"
#define COLOR_PALE_BLUE_GRAY	"#8BBBD5"
#define COLOR_PALE_GREEN_GRAY	"#AED18B"
#define COLOR_PALE_RED_GRAY		"#CC9090"
#define COLOR_PALE_PURPLE_GRAY	"#BDA2BA"
#define COLOR_PURPLE_GRAY		"#A2819E"

//	Backpacks
#define BACKPACK_COMMON      1
#define BACKPACK_MEDICAL     2
#define BACKPACK_PARAMEDIC   3
#define BACKPACK_SECURITY    4
#define BACKPACK_ENGINEERING 5
#define BACKPACK_SCIENCE     6
#define BACKPACK_CAPTAIN     7

//	Shuttles.

// These define the time taken for the shuttle to get to the space station, and the time before it leaves again.
#define SHUTTLE_PREPTIME                300 // 5 minutes = 300 seconds - after this time, the shuttle departs centcom and cannot be recalled.
#define SHUTTLE_LEAVETIME               180 // 3 minutes = 180 seconds - the duration for which the shuttle will wait at the station after arriving.
#define SHUTTLE_TRANSIT_DURATION        300 // 5 minutes = 300 seconds - how long it takes for the shuttle to get to the station.
#define SHUTTLE_TRANSIT_DURATION_RETURN 120 // 2 minutes = 120 seconds - for some reason it takes less time to come back, go figure.

// Shuttle moving status.
#define SHUTTLE_IDLE      0
#define SHUTTLE_WARMUP    1
#define SHUTTLE_INTRANSIT 2

// Ferry shuttle processing status.
#define IDLE_STATE   0
#define WAIT_LAUNCH  1
#define FORCE_LAUNCH 2
#define WAIT_ARRIVE  3
#define WAIT_FINISH  4

// Event defines.
#define EVENT_LEVEL_MUNDANE  1
#define EVENT_LEVEL_MODERATE 2
#define EVENT_LEVEL_MAJOR    3

//General-purpose life speed define for plants.
#define HYDRO_SPEED_MULTIPLIER 1

//Area flags, possibly more to come
#define RAD_SHIELDED 1 //shielded from radiation, clearly

// Custom layer definitions, supplementing the default TURF_LAYER, MOB_LAYER, etc.
#define DOOR_OPEN_LAYER 2.7		//Under all objects if opened. 2.7 due to tables being at 2.6
#define DOOR_CLOSED_LAYER 3.1	//Above most items if closed
#define LIGHTING_LAYER 11
#define HUD_LAYER 20			//Above lighting, but below obfuscation. For in-game HUD effects (whereas SCREEN_LAYER is for abstract/OOC things like inventory slots)
#define OBFUSCATION_LAYER 21	//Where images covering the view for eyes are put
#define SCREEN_LAYER 22			//Mob HUD/effects layer

#define BOMBCAP_DVSTN_RADIUS (max_explosion_range/4)
#define BOMBCAP_HEAVY_RADIUS (max_explosion_range/2)
#define BOMBCAP_LIGHT_RADIUS max_explosion_range
#define BOMBCAP_FLASH_RADIUS (max_explosion_range*1.5)

#define RANGE_TURFS(RADIUS, CENTER) \
  block( \
    locate(max(CENTER.x-(RADIUS),1),          max(CENTER.y-(RADIUS),1),          CENTER.z), \
    locate(min(CENTER.x+(RADIUS),world.maxx), min(CENTER.y+(RADIUS),world.maxy), CENTER.z) \
)

#define RANDOM_BLOOD_TYPE pick(4;"O-", 36;"O+", 3;"A-", 28;"A+", 1;"B-", 20;"B+", 1;"AB-", 5;"AB+")

//Grid for Item Placement
#define CELLS 8								//Amount of cells per row/column in grid
#define CELLSIZE (world.icon_size/CELLS)	//Size of a cell in pixels

#define WIZARD_KNOWLEDGE 1
#define WIZARD_CLOTHINGS 2

#define CELL_FULLCHARGED -1

#define SURGERY_FAILURE -1

// Special return values from bullet_act(). Positive return values are already used to indicate the blocked level of the projectile.
#define PROJECTILE_CONTINUE   -1 //if the projectile should continue flying after calling bullet_act()
#define PROJECTILE_FORCE_MISS -2 //if the projectile should treat the attack as a miss (suppresses attack and admin logs) - only applies to mobs.

#define MAX_GEAR_COST 10 // Used in chargen for accessory loadout limit.

#define WALL_CAN_OPEN 1
#define WALL_OPENING 2

//datum may be null, but it does need to be a typed var
#define NAMEOF(datum, X) (#X || ##datum.##X)

