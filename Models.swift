//
//  Models.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import Foundation
import CoreLocation


//enum Loisirs

enum Categories: String {
    case manu = "Loisirs créatifs"
    case sport = "Activités physiques"
    case relax = "Relaxation"
    case collec = "Sports collectifs"
    case culture = "Sorties culturelles"
    case society = "Jeux de société"
    case artist = "Activités artistiques"
    case cook = "Activités cullinaires"
    case brico = "Bricolage"
    case garden = "Jardinage"
    case deco = "Décoration"
    case lecture = "Lecture et Écriture"
    case games = "Jeux vidéos"
    case info = "Informatique"
}

struct Categoriz : Identifiable {
    var id = UUID()
    var nameCategory : Categories
    var picCategory : String
}

enum Tags: String {
    case relaxa = "Bien-être"
    case nature = "Nature"
    case sport = "Sport"
    case crea = "Création"
    case sante = "Santé"
}

// Loisirs

struct Hobbies : Identifiable {
    var id = UUID()
    var hobbyName : String
    var hobbyDescription : String
    var subtitleSwipe : String
    var hobbyPic : String
    var hobbyTags : [Tags]
    var hobbyEvents : [Events]
    var hobbyComs : [Comments]
    var tutoHobby : [Tutos]
    var category : Categoriz
}


// tuto

struct Tutos : Identifiable {
    var id = UUID()
    var tutoImage : String
    var tutoTitle : String
    var tutoSubtitle : String
    var creator : String
}


// Events

struct Events : Identifiable, Equatable {
    static func == (lhs: Events, rhs: Events) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var eventName : String
    var eventHobby : Hobbies
    var eventPlace : String
    var eventDate : String
    var eventDesc : String
    var isOut : Bool
    var eventPicture : String
    var participants : [Friends]
    var participate : Bool
    var comms : [Comments]
    var coordonnnes : CLLocationCoordinate2D
    var lieuComplet : String
}


// Commentaires

struct Comments : Identifiable {
    var id = UUID()
    var userPics: String
    var userName: String
    var commDetail : String
}


// Profil Amis
struct Friends : Identifiable {
    var id = UUID()
    var userPsedo : String
    var userBio : String
    var userTag : [Tags]
    var userCover : String
    var pictures : [String]
    var pastEvents : [Events]
    var futureEvents: [Events]
    var isCurrentUser: Bool
    var favoriteCategory : [Categoriz]
    var isOnline: Bool
    var userPicture : String
}

struct Chat : Identifiable {
    var id = UUID()
    var userChat : Friends
    var message : String
}



