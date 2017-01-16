require 'faker'
# - User schema -
# User(id: integer, f_name: string, l_name: string, username: string, password_digest: string, created_at: datetime, updated_at: datetime)

# - Subject schema -
# Subject(id: integer, parent_id: integer, title: string, note_taker_id: integer, created_at: datetime, updated_at: datetime)

# - Topic Schema -
# Topic(id: integer, subject_id: integer, title: string, created_at: datetime, updated_at: datetime)

# - Tag Schema -
# Tag(id: integer, tag_name: string, created_at: datetime, updated_at: datetime)

# - Note_Module Schema -
# NoteModule(id: integer, topic_id: integer, module_type: string, created_at: datetime, updated_at: datetime)

# - Note_Tag Schema -
# NoteTag(tag_id: integer, note_module_id: integer, created_at: datetime, updated_at: datetime)


# -- Faker Data --

subjects = ["Music_Theory","Cars","Coffee","Rock_N_Roll","Snowboarding"]

topics = {
	"Music_Theory" => ["Scales", "Chords", "Intervals", "Keys", "Pitch"],
	"Cars" => ["NASCAR", "Trucks", "German", "Muscle", "Off-Road"],
	"Coffee"=> ["Location", "Roast", "Social Impacts", "Caffeine", "Brewing"],
	"Rock_N_Roll" => ["History", "Artists", "Intruments", "Hall of Fame", "Songs"],
	"Snowboarding" => ["Board-Tech", "Mountains", "Back-country", "Park", "Tricks"]
}

tags = {
	"Scales"=> ['Major', "Minor", "Penatonic"], "Chords"=> ["C", "D", "G"], "Intervals"=> ["P1", "P4", "P5"], "Keys"=> ["A#min", "B\U+266D", "Cmaj"], "Pitch"=> ["440", "220", "110"],
	"NASCAR"=> ["Tracks", "Racers", "Winners"], "Trucks"=> ["Ford", "Off-Road", "Tow-Weight"], "German"=> ["BMW", "Merc", "Audi"], "Muscle"=> ["Chevy", "Road-Runner", "Big-Block"], "Off-Road"=> ["Mud", "Big-Tires", "Lift"],
	"Location"=> ["South America", "Africa", "Asia"], "Roast"=> ["Culumbian", "French", "Dark"], "Social Impacts"=> ["Farmers", "Addiction", "Talkative"], "Caffeine"=> ["Addictive", "Drug", "Stength"], "Brewing"=> ["Cold-Press", "Drip", "French-Press"],
	"History"=> ["Blues", "Race-music", "Boogie-Woogie"], "Artists"=> ["Chuck Berry", "The Beatles", "British Invasion"], "Intruments"=> ["Electric", "Guitar", "Drums"], "Hall of Fame"=> ["Led Zeppline", "BB King", "the Police"], "Songs"=> ["12 Bar Blues", "Guitar-Solo", "Folsom Prison Blues"],
	"Board-Tech"=> ["Wood", "Laminate", "Carbon-fibre"], "Mountains"=> ["Vail", "Breckenridge", "Copper"], "Back-country"=> ["Avalange", "Powder", "Heli"], "Park"=> ["Rails", "Kickers", "Tow-Rope"], "Tricks"=> ["Off-Axis", "Front-Side", "Grabs"]
}

module_types = ["note_resource", "note_question", "note_general", "note_term"]

# --- User Seed ---
User.create(f_name: "Mitch", l_name: "Kroska", username: "kromitj", password_digest: "password")

# --- Subject Seed ---

mitch = User.first

subjects.each do |subject|
  mitch.subjects.create(parent_id: 0, title: subject)
end


# --- Topic Seed ---

subjects.each do |subject|
	current_subject = mitch.subjects.where(title: subject).first
	current_topics = topics[subject]
	5.times do |i|
		current_topic = current_topics[i]
		current_subject.topics.create(title: current_topic)
	end
end

# --- Tag Seed ---

topics.values.flatten.each do |topic|
	current_tags = tags[topic]
	current_tags.each do |current_tag|
		Tag.create(tag_name: current_tag)
	end
end

# --- NoteModule Seed ---

# uses module_types faker data
module_index = 0 # loops(0..3) through 4 module_types
mitch.subjects.each do |subject|
	subject.topics.each do |topic|
		module_index = 0 if module_index == 4
		topic.note_modules.create(module_type: module_types[module_index])
		module_index+=1
	end
end


# --- NoteTags Seed ---
note_module_num = 1 # iteratates(1..25) +=1 for every 3 tags
Tag.all.each do |tag|	# iterates(1..75)
	NoteTag.create(tag_id: tag.id, note_module_id: note_module_num)
	note_module_num+=1 if tag.id % 3 == 0
end

# --- ModuleType Seed ---

(1..25).each do |num|
	mod_type = NoteModule.where(id: num).first.module_type
	case mod_type
	when "note_resource"
	  NoteResource.create(note_module_id: num, title: Faker::StarWars.quote, resource_url: Faker::Internet.url)
	when "note_question"
	  NoteQuestion.create(note_module_id: num, note_question: "#{Faker::TwinPeaks.quote}?", google_responce_id: 1)
	when "note_general"
	  NoteGeneral.create(note_module_id: num, note_content: Faker::Lorem.sentence(3, true, 20))
	when "note_term"
	  NoteTerm.create(note_module_id: num, term: Faker::Pokemon.name, definition: Faker::Lorem.sentence(3, true))
	else
		puts "Oh no what happended?"
		puts "mod_type: #{mod_type}"
	end
end





