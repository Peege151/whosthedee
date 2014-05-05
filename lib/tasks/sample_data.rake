namespace :db do
  desc "Fill database with sample data"
  users_to_create = 50
  dogs_to_create = users_to_create * 10
  breed_array_size = 177 #0 indexed
  array_zips = ["11211", "11215", "01776"]
  task populate: :environment do
    admin = User.create!(name: "Patrick Sullivan",
                         email: "Pjsulli2k@gmail.com",
                         password: "shithead1",
                         password_confirmation: "shithead1",
                         zip_code: "11211",
                         admin: true)

    users_to_create.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password  = "password123"
      zip_code2 = array_zips.sample
      User.create!(name: name,
                   email: email,
                   password: password,
                   zip_code: zip_code2, 
                   password_confirmation: password)
    end
       Dog.create!( user_id: 1,
                    name: "Willie",
                    nick: "Dee",
                    age: 4,
                    primarybreed: "shetland_sheepdog",
                    secondarybreed: "Purebred")               

    dogs_to_create.times do |d|
    primary_breed = 
      
['affenpinscher'],
['afghan_hound'],
['airedale_terrier'],
['akita'],
['alaskan_malamute'],
['american_english_coonhound'],
['american_eskimo_dog'],
['american_foxhound'],
['american_staffordshire_terrier'],
['american_water_spaniel'],
['anatolian_shepherd_dog'],
['australian_cattle_dog'],
['australian_shepherd'],
['australian_terrier'],
['basenji'],
['basset_hound'],
['beagle'],
['bearded_collie'],
['beauceron'],
['bedlington_terrier'],
['belgian_malinois'],
['belgian_sheepdog'],
['belgian_tervuren'],
['bernese_mountain_dog'],
['bichon_frise'],
['black_russian_terrier'],
['black_and_tan_coonhound'],
['bloodhound'],
['bluetick_coonhound'],
['border_collie'],
['border_terrier'],
['borzoi'],
['boston_terrier'],
['bouvier_des_flandres'],
['boxer'],
['boykin_spaniel'],
['briard'],
['brittany'],
['brussels_griffon'],
['bull_terrier'],
['bulldog'],
['bullmastiff'],
['cairn_terrier'],
['canaan_dog'],
['cane_corso'],
['cardigan_welsh_corgi'],
['cavalier_king_charles_spaniel'],
['cesky_terrier'],
['chesapeake_bay_retriever'],
['chihuahua'],
['chinese_crested'],
['chinese_shar-pei'],
['chinook'],
['chow_chow'],
['clumber_spaniel'],
['cocker_spaniel'],
['collie'],
['curly-coated_retriever'],
['dachshund'],
['dalmatian'],
['dandie_dinmont_terrier'],
['doberman_pinscher'],
['dogue_de_bordeaux'],
['english_cocker_spaniel'],
['english_foxhound'],
['english_setter'],
['english_springer_spaniel'],
['english_toy_spaniel'],
['entlebucher_mountain_dog'],
['field_spaniel'],
['finnish_lapphund'],
['finnish_spitz'],
['flat-coated_retriever'],
['french_bulldog'],
['german_pinscher'],
['german_shepherd_dog'],
['german_shorthaired_pointer'],
['german_wirehaired_pointer'],
['giant_schnauzer'],
['glen_of_imaal_terrier'],
['golden_retriever'],
['gordon_setter'],
['great_dane'],
['great_pyrenees'],
['greater_swiss_mountain_dog'],
['greyhound'],
['harrier'],
['havanese'],
['ibizan_hound'],
['icelandic_sheepdog'],
['irish_red_and_white_setter'],
['irish_setter'],
['irish_terrier'],
['irish_water_spaniel'],
['irish_wolfhound'],
['italian_greyhound'],
['japanese_chin'],
['keeshond'],
['kerry_blue_terrier'],
['komondor'],
['kuvasz'],
['labrador_retriever'],
['lakeland_terrier'],
['leonberger'],
['lhasa_apso'],
['lowchen'],
['maltese'],
['manchester_terrier'],
['mastiff'],
['miniature_bull_terrier'],
['miniature_pinscher'],
['miniature_schnauzer'],
['neapolitan_mastiff'],
['newfoundland'],
['norfolk_terrier'],
['norwegian_buhund'],
['norwegian_elkhound'],
['norwegian_lundehund'],
['norwich_terrier'],
['nova_scotia_duck_tolling_retriever'],
['old_english_sheepdog'],
['otterhound'],
['papillon'],
['parson_russell_terrier'],
['pekingese'],
['pembroke_welsh_corgi'],
['petit_basset_griffon_vendeen'],
['pharaoh_hound'],
['plott'],
['pointer'],
['polish_lowland_sheepdog'],
['pomeranian'],
['poodle'],
['portuguese_podengo_pequeno'],
['portuguese_water_dog'],
['pug'],
['puli'],
['pyrenean_shepherd'],
['rat_terrier'],
['redbone_coonhound'],
['rhodesian_ridgeback'],
['rottweiler'],
['russell_terrier'],
['saluki'],
['samoyed'],
['schipperke'],
['scottish_deerhound'],
['scottish_terrier'],
['sealyham_terrier'],
['shetland_sheepdog'],
['shiba_inu'],
['shih_tzu'],
['siberian_husky'],
['silky_terrier'],
['skye_terrier'],
['smooth_fox_terrier'],
['soft_coated_wheaten_terrier'],
['spinone_italiano'],
['st._bernard'],
['staffordshire_bull_terrier'],
['standard_schnauzer'],
['sussex_spaniel'],
['swedish_vallhund'],
['tibetan_mastiff'],
['tibetan_spaniel'],
['tibetan_terrier'],
['toy_fox_terrier'],
['treeing_walker_coonhound'],
['vizsla'],
['weimaraner'],
['welsh_springer_spaniel'],
['welsh_terrier'],
['west_highland_white_terrier'],
['whippet'],
['wire_fox_terrier'],
['wirehaired_pointing_griffon'],
['xoloitzcuintli'],
['yorkshire_terrier']
      user_id = rand(1..users_to_create)
      name = Faker::Name.name
      nick = Faker::Name.name[0..2]
      if d < breed_array_size
      primarybreed = primary_breed[d].join('').to_s
      else
      primarybreed = primary_breed.sample.join('').to_s#terribly off balance
      end
      secondarybreed = "Purebred"
      age = rand(1..12)
      Dog.create!(user_id: user_id,
                  name: name,
                  nick: nick,
                  age: age,
                  primarybreed: primarybreed,
                  secondarybreed: secondarybreed
                  )
    end

   Dog.all.each { |dog| dog.image=File.open(Dir.glob(File.join(Rails.root, "public/images/fake_dogs/#{dog.primarybreed}", '*')).sample); dog.save! }

  end

end