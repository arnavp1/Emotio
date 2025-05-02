import Foundation
import SwiftData
import SwiftUI

@Model
class MoodEntry: Identifiable {
    var id: UUID
    var date: Date
    var moodRawValue: String

    @Transient
    var mood: MoodType {
        get { MoodType(rawValue: moodRawValue) ?? .neutral }
        set { moodRawValue = newValue.rawValue }
    }

    init(id: UUID = .init(), date: Date = .init(), mood: MoodType) {
        self.id = id
        self.date = date
        self.moodRawValue = mood.rawValue
    }
}

enum MoodType: String, CaseIterable, Identifiable {
    case happy              = "😀"
    case joyful             = "😃"
    case beaming            = "😄"
    case grinning           = "😁"
    case laughingSquint     = "😆"
    case relievedSmile      = "😅"
    case tearsJoy           = "😂"
    case rollingLaugh       = "🤣"
    case relaxed            = "☺️"
    case blush              = "😊"
    case angelic            = "😇"
    case slightSmile        = "🙂"
    case upsideDown         = "🙃"
    case wink               = "😉"
    case peaceful           = "😌"
    case inLove             = "😍"
    case heartsSmile        = "🥰"
    case kiss               = "😘"
    case kissing            = "😗"
    case kissSmile          = "😙"
    case kissEyes           = "😚"
    case tasty              = "😋"
    case tongueOut          = "😛"
    case squintTongue       = "😝"
    case silly              = "😜"
    case zany               = "🤪"
    case skepticBrow        = "🤨"
    case observant          = "🧐"
    case nerd               = "🤓"
    case cool               = "😎"
    case starStruck         = "🤩"
    case celebrating        = "🥳"
    case smirk              = "😏"
    case annoyed            = "😒"
    case disappointed       = "😞"
    case pensive            = "😔"
    case worried            = "😟"
    case confused           = "😕"
    case frown              = "🙁"
    case sad                = "☹️"
    case weary              = "😣"
    case frustratedCry      = "😖"
    case exhausted          = "😫"
    case tired              = "😩"
    case pleading           = "🥺"
    case cryingSoft         = "😢"
    case sobbing            = "😭"
    case steamNose          = "😤"
    case mad                = "😠"
    case angry              = "😡"
    case enraged            = "🤬"
    case mindBlown          = "🤯"
    case flushed            = "😳"
    case overheated         = "🥵"
    case freezing           = "🥶"
    case scream             = "😱"
    case fearful            = "😨"
    case anxious            = "😰"
    case relievedTear       = "😥"
    case sweat              = "😓"
    case hugging            = "🤗"
    case thinking           = "🤔"
    case giggle             = "🤭"
    case shush              = "🤫"
    case dishonest          = "🤥"
    case blank              = "😶"
    case neutral            = "😐"
    case meh                = "😑"
    case grimace            = "😬"
    case eyeRoll            = "🙄"
    case hushed             = "😯"
    case astonishedLow      = "😦"
    case anguished          = "😧"
    case openMouth          = "😮"
    case shocked            = "😲"
    case sleepy             = "😴"
    case drooling           = "🤤"
    case sleepyDrool        = "😪"
    case dizzy              = "😵"
    case zipper             = "🤐"
    case woozy              = "🥴"
    case nauseated          = "🤢"
    case vomiting           = "🤮"
    case sneeze             = "🤧"
    case masked             = "😷"
    case ill                = "🤒"
    case bandaged           = "🤕"
    case rich               = "🤑"
    case cowboy             = "🤠"
    case devilSmirk         = "😈"
    case devilAngry         = "👿"
    case ogre               = "👹"
    case goblin             = "👺"
    case clown              = "🤡"
    case poop               = "💩"
    case ghost              = "👻"
    case skull              = "💀"
    case monkey             = "🐒"
    case usa                = "🇺🇸"
    case goat               = "🐐"
    case book               = "📚"
    case potato             = "🥔"
    case fries              = "🍟"
    case mushroom           = "🍄"
    case boba               = "🧋"
    
    var id: String { rawValue }

    var motivationalText: String {
        switch self {
        case .happy:              return "Bright and bubbly—spread those vibes!"
        case .joyful:             return "Joy is contagious. Keep it flowing!"
        case .beaming:            return "Your grin lights up the room."
        case .grinning:           return "Hold onto that spark!"
        case .laughingSquint:     return "Laughter is your super-power today."
        case .relievedSmile:      return "Swept through the challenge—nice work."
        case .tearsJoy:           return "Sharing laughs heals hearts."
        case .rollingLaugh:       return "Rolling with the fun—keep it up!"
        case .relaxed:            return "A gentle day does wonders."
        case .blush:              return "Your warm glow lifts others."
        case .angelic:            return "Soft hearts change worlds."
        case .slightSmile:        return "Small smiles count too."
        case .upsideDown:         return "New angles bring new insight."
        case .wink:               return "A wink of mischief spices life."
        case .peaceful:           return "Guard your calm—it’s gold."
        case .inLove:             return "Love is fueling you—share it."
        case .heartsSmile:        return "Surrounded by love—let it radiate."
        case .kiss:               return "Kindness kisses back."
        case .tasty:              return "Savor the simple joys."
        case .tongueOut:          return "Playful spirit, playful day."
        case .squintTongue:       return "Go full goofy—it’s allowed."
        case .silly:              return "Silliness is a gift—unwrap it."
        case .zany:               return "Zany ideas spark magic."
        case .skepticBrow:        return "Curiosity sharpens vision."
        case .observant:          return "Your keen eye notices the good."
        case .nerd:               return "Knowledge is your playground."
        case .cool:               return "Confidence looks great on you."
        case .starStruck:         return "Big dreams feel close today."
        case .celebrating:        return "Celebrate the wins—big or small!"
        case .smirk:              return "A dash of swagger suits you."
        case .annoyed:            return "Pause. Choose peace over peeve."
        case .disappointed:       return "It’s a bump, not the end."
        case .pensive:            return "Gentle reflection grows resilience."
        case .worried:            return "Worry shows you care—just breathe."
        case .confused:           return "Questions lead to answers—keep asking."
        case .frown:              return "Down moments teach compassion."
        case .sad:                return "It’s okay to slow down and feel."
        case .weary:              return "Rest now; rise recharged."
        case .frustratedCry:      return "Tears water tomorrow’s growth."
        case .exhausted:          return "You’ve given a lot—refuel."
        case .tired:              return "Rest is productive, too."
        case .pleading:           return "You are deserving of kindness."
        case .cryingSoft:         return "Healing starts with tears."
        case .sobbing:            return "Storms pass—hold on."
        case .steamNose:          return "Channel that power into progress."
        case .mad:                return "Set boundaries; guard your peace."
        case .angry:              return "Anger is energy—shape it wisely."
        case .enraged:            return "Powerful fire—aim it at goals."
        case .mindBlown:          return "Big revelations! Let them settle."
        case .flushed:            return "Surprise can spark growth."
        case .overheated:         return "Cool off and keep shining."
        case .freezing:           return "Warmth comes—hang tight."
        case .scream:             return "Release the tension—then regroup."
        case .fearful:            return "Courage is acting with fear."
        case .anxious:            return "One calm breath at a time."
        case .relievedTear:       return "Relief reminds you you’re safe."
        case .sweat:              return "Effort shows you care."
        case .hugging:            return "Spread hugs—people need them."
        case .thinking:           return "Thoughtfulness is strength."
        case .giggle:             return "Secret joys make days sweet."
        case .shush:              return "Silence can be soothing."
        case .dishonest:          return "Honesty begins within."
        case .blank:              return "Not every moment needs words."
        case .neutral:            return "Even valleys have beauty."
        case .meh:                return "Average days matter too."
        case .grimace:            return "Awkward? Laugh it off."
        case .eyeRoll:            return "Shake it off; focus on what matters."
        case .hushed:             return "Listen—life whispers wisdom."
        case .astonishedLow:      return "Take a breath—it's okay to be overwhelmed for a moment."
        case .anguished:          return "Pain is part of growth. Let it shape you, not stop you."
        case .openMouth:          return "You’re in the middle of a big moment—lean into the surprise."
        case .shocked:            return "Even sudden changes bring new perspectives. You’ve got this."
        case .sleepy:             return "Dreams await—drift off."
        case .drooling:           return "You deserve delicious rest."
        case .sleepyDrool:        return "Heavy lids? Nap time."
        case .dizzy:              return "Steady yourself—clarity returns."
        case .zipper:             return "Boundaries are brave."
        case .woozy:              return "Everything feels fuzzy—take it slow."
        case .nauseated:          return "Be gentle with your body."
        case .vomiting:           return "Flush the bad; start fresh."
        case .sneeze:             return "Healing vibes on the way."
        case .masked:             return "Health first—rest up."
        case .ill:                return "Hydrate, rest, repeat."
        case .bandaged:           return "Recovery in progress."
        case .rich:               return "Abundance mindset activated."
        case .cowboy:             return "Yee-haw! Own your trail."
        case .devilSmirk:         return "A bit of edge—use it for bold moves."
        case .devilAngry:         return "Channel intensity into creativity."
        case .ogre:               return "Face big feelings with humor."
        case .goblin:             return "Tricky times—stay grounded."
        case .clown:              return "Laughter is medicine—dose daily."
        case .poop:               return "Crummy day? Flush and move on."
        case .ghost:              return "Let go of what haunts you."
        case .skull:              return "Dark humor keeps you resilient."
        case .monkey:             return "Stay playful and curious—swing into your goals!"
        case .usa:                return "Bold, brave, and a bit patriotic—stand tall today!"
        
        case .goat:               return "WWW GOAT ez dubs!"
        case .book:               return "Might as well be a goblin with the library as your home."
        case .potato:             return "Probably some potato farmer from Idaho or something."
        case .fries:              return "Put the fries in the bag lil bro."
        case .mushroom:           return "Time to a go on a hunt for an elusive fungus."
        case .boba:               return "A boba a day keeps the doctor away!"
            
        default:                  return "However you feel, keep moving forward—you’ve got this!"
        }
    }

    var moodColor: Color {
        switch self {
        // bright yellows
        case .happy, .joyful, .beaming, .grinning, .laughingSquint,
             .tearsJoy, .rollingLaugh:
            return .yellow

        // calm/blues
        case .blush, .angelic, .peaceful, .hugging, .thinking,
             .relievedTear, .sweat:
            return .blue

        // energetic oranges
        case .starStruck, .celebrating, .mindBlown, .flushed:
            return .orange

        // passionate reds
        case .steamNose, .mad, .angry, .enraged, .overheated,
             .devilSmirk, .devilAngry, .ogre, .goblin:
            return .red

        // playful mints/greens
        case .upsideDown, .wink, .tongueOut, .squintTongue, .silly,
             .clown, .tasty, .rich:
            return .mint

        // indigos / deep purples
        case .cool, .observant, .skepticBrow, .fearful, .anxious,
             .cowboy:
            return .purple

        // soft pinks
        case .inLove, .heartsSmile, .kiss, .pleading:
            return .pink

        // subdued grays
        case .blank, .neutral, .meh, .annoyed, .eyeRoll, .dishonest,
             .zipper, .shush:
            return .gray

        // tired teals
        case .tired, .sleepy, .sleepyDrool:
            return .teal

        // cool cyan/dizzy
        case .dizzy, .nauseated, .woozy:
            return .cyan

        // health-related green opacity
        case .masked, .ill, .bandaged, .vomiting, .sneeze, .freezing,
             .skull, .poop:
            return .green.opacity(0.6)
            
        // custom emojis
        case .goat: return .purple
        case .book: return .red.opacity(0.5)
        case .potato: return .brown.opacity(0.7)
        case .fries: return .yellow
        case .mushroom: return .brown.opacity(0.6)
        case .boba:     return .purple.opacity(0.7)
        case .monkey:   return .brown
        case .usa:      return .blue

        // default fallback
        default:
            return .orange.opacity(0.5)
        }
    }
}
