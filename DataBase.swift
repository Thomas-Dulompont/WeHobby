//
//  DataBase.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import Foundation
import MapKit


var categoris : [Categoriz] = [Categoriz(nameCategory: .artist, picCategory: "articon"),
                               Categoriz(nameCategory: .collec, picCategory: "basketicon"),
                               Categoriz(nameCategory: .cook, picCategory: "cookicon"),
                               Categoriz(nameCategory: .culture, picCategory: "theatreicon"),
                               Categoriz(nameCategory: .deco, picCategory: "decoicon"),
                               Categoriz(nameCategory: .games, picCategory: "gameicon"),
                               Categoriz(nameCategory: .garden, picCategory: "gardenicon"),
                               Categoriz(nameCategory: .brico, picCategory: "bricoicon"),
                               Categoriz(nameCategory: .info, picCategory: "infoicon"),
                               Categoriz(nameCategory: .lecture, picCategory: "booksicon"),
                               Categoriz(nameCategory: .manu, picCategory: "coutureicon"),
                               Categoriz(nameCategory: .relax, picCategory: "relaxicon"),
                               Categoriz(nameCategory: .society, picCategory: "jeuxicon"),
                               Categoriz(nameCategory: .sport, picCategory: "runicon")]

var userProfiles : [Friends] = [
                                Friends(userPsedo: "Cindie", userBio: "J'adore les créations manuelles mais j'aimerai découvrir de nouveaux loisirs et rencontrer de nouvelles personnes", userTag: [.crea, .nature, .relaxa], userCover: "malta", pictures: ["epoxy", "accrobranche", "poterie", "couture", "malta", "tricotevent", "tricot", "coutureevent"], pastEvents: [], futureEvents: [], isCurrentUser: true, favoriteCategory: [categoris[0], categoris[4], categoris[11]], isOnline: true, userPicture: "cindie"),
                                Friends(userPsedo: "Ana", userBio: "Couture, broderie, scrapbooking... J'aimerai partager avec des personnes de la communauté", userTag: [.crea, .sante], userCover: "couture", pictures: ["couture"], pastEvents: [], futureEvents: [], isCurrentUser: false, favoriteCategory: [categoris[5], categoris[10], categoris[9]], isOnline: true, userPicture: "ana"),
                                Friends(userPsedo: "Morgan", userBio: "Fan de cuisine et de relaxation, j'aimerai m'ouvrir à d'autres horizons", userTag: [.relaxa], userCover: "poterie", pictures: ["poterie", "broderie", "epoxy"], pastEvents: [], futureEvents: [], isCurrentUser: false, favoriteCategory: [categoris[6], categoris[10], categoris[8]], isOnline: false, userPicture: "morgan")]


var loisirs : [Hobbies] = [Hobbies(hobbyName: "Couture", hobbyDescription: "Une couture est l'assemblage de deux ou plusieurs pièces à l'aide de fil à coudre, soit manuellement avec une aiguille, soit en utilisant une machine à coudre ou une surjeteuse. ", subtitleSwipe: "Assemblez des pièces de tissus à l'aide d'une aiguille ou d'une machine.", hobbyPic: "couture", hobbyTags: [.crea, .relaxa], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Broderie", hobbyDescription: "La broderie est un art de décoration des tissus qui consiste à ajouter sur un tissu un motif plat ou en relief fait de fils simples, parfois en intégrant des matériaux tels que des paillettes, des perles, voire des pierres précieuses.", subtitleSwipe: "Embellisez des pièces de tissus à la main", hobbyPic: "broderie", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Poterie", hobbyDescription: "La poterie consiste à créer des vases et récipients à la main à partir de terre cuite.", subtitleSwipe: "Créez vos propres vases et récipients", hobbyPic: "poterie", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Bougies artisanales", hobbyDescription: "La création de bougies artisanales permet de faire et personnaliser à souhait des bougies de toutes tailles, de toutes formes et de toutes odeurs.", subtitleSwipe: "Créez vos propres bougies personnalisées", hobbyPic: "bougie", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Résines d'epoxy", hobbyDescription: "La résine d'epoxy permet de faire énormément d'objets différents à partir de ce matériau, de les personnalisé grâce à des couleurs et différentes formes grâce à des moules.", subtitleSwipe: "Créez tout type d'objet de toute forme grâce à la résine d'epoxy", hobbyPic: "epoxy", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10])]

var evenements : [Events] = [Events(eventName: "Tricot Participatif", eventHobby: loisirs[0], eventPlace: "Roubaix", eventDate: "23/06/2022", eventDesc: "Venez participer à notre premier tricot participatif de Roubaix. Les différents dons seront reversés à la ville. Le but étant de créer une grande fresque pour l'évènement musicale de l'été.", isOut: false, eventPicture: "coutureevent", participants: [userProfiles[0], userProfiles[1], userProfiles[2]], participate: true, comms: [], coordonnnes: CLLocationCoordinate2D(latitude: 50.690738, longitude: 3.189492), lieuComplet: "La Condition Publique, 14 Place du Général Faidherbe, 59100 Roubaix"),
                             Events(eventName: "Tricot Solidaire", eventHobby: loisirs[0], eventPlace: "Lille", eventDate: "17/07/2022", eventDesc: "Venez participer à notre premier tricot participatif de Lille. Les différents dons seront reversés à la ville. Le but étant de créer une grande fresque pour la grande Braderie de Lille.", isOut: true, eventPicture: "tricot", participants: [userProfiles[0], userProfiles[1], userProfiles[2]], participate: true, comms: [], coordonnnes: CLLocationCoordinate2D(latitude: 50.629256, longitude: 3.058154), lieuComplet: "Théâtre Sebastopol, Place Sebastopol, 59000 Lille"),
                             Events(eventName: "Tricotathlon", eventHobby: loisirs[0], eventPlace: "Tourcoing", eventDate: "01/08/2022", eventDesc: "Venez participer à notre premier tricotathlon de Tourcoing. Les différents dons seront reversés à la ville. Le but étant de créer une grande fresque pour afficher à la mairie.", isOut: false, eventPicture: "tricotevent", participants: [userProfiles[0], userProfiles[1], userProfiles[2]], participate: true, comms: [], coordonnnes: CLLocationCoordinate2D(latitude: 50.723749, longitude: 3.160691), lieuComplet: "Mairie de Tourcoing, 10 Place Victor Hassebroucq, 59200 Tourcoing")]

var listTutos: [Tutos] = [Tutos(tutoImage: "bobines", tutoTitle: "Le matériel de base", tutoSubtitle: "", creator: "Anne de L'Atelier des gourdes"),
Tutos(tutoImage: "femmemac", tutoTitle: "Prendre en main une machine à coudre", tutoSubtitle: "", creator: "Patricia Mac"),
Tutos(tutoImage: "enfant", tutoTitle: "La couture avec les enfants", tutoSubtitle: "", creator: "Mam'zelle"),
Tutos(tutoImage: "jupe2", tutoTitle: "Réaliser sa première jupe", tutoSubtitle: "", creator: "Julie -  Textile lab")]

var listTutosDetail: [TutosDetail] = [
    TutosDetail(tutoImage: "maincouture", tutoTitle: "Comment démarrer en couture ?", tutoSubtitle: "Tu n'as jamais utilisé une machine à coudre ni même une aiguille ? Tu as envie de réaliser tes propres vêtements ou de réparer ton jean. Conseils pour s'y mettre et progresser.", creator: "Anne de L'Atelier des gourdes", creatorAvatar: "fil", tutoDuration: "3 min", tutoParagraph1: "C'est en cousant régulièrement que tu vas maîtriser les gestes, acquérir des réflexes et gagner en expérience. Dégage un peu de temps pour te consacrer à cette activité ultra-gratifiante !", tutoTitleParagraph1: "Prendre du temps", tutoParagraph2: "Fixe-toi des objectifs pour progresser. Quitte à te tromper et à recommencer ! Apprends de tes erreurs et confronte-toi à de nouvelles difficultés pour enrichir ton savoir-faire.", tutoTitleParagraph2: "Se lancer des défis", tutoParagraph3: "Apprendre par toi-même, c’est top mais tu prendras de bons conseils et tu pourras tester différentes techniques au contact de personnes expérimentées. WeHobby est là pour mettre en relation couturières novices et plus aguerries. Rien de mieux que le partage de conseils et d'expériences entre passionnées. Tu gagneras de nouvelles amies pour faire des apéros couture !", tutoTitleParagraph3: "Rencontrer d'autres couturières", tutos: listTutos, tutoImageSecondary: ["maincouture", "stylismeviolet", "femmeatelier"]),
    TutosDetail(tutoImage: "femmecoupanttissu", tutoTitle: "Comment démarrer en couture ?", tutoSubtitle: "Vous bla bla bla bla", creator: "Anne de Resap Paris", creatorAvatar: "fil", tutoDuration: "3 min", tutoParagraph1: "", tutoTitleParagraph1: "", tutoParagraph2: "",  tutoTitleParagraph2: "",  tutoParagraph3: "", tutoTitleParagraph3: "", tutos: listTutos, tutoImageSecondary: ["maincouture", "bobines"])
]

var listCommentsHobby: [CommentsHobby] = [
    CommentsHobby(userPics: "cindie", userName: "cindie", commDetailHobby:" Waouh 😍 ! J'espère arriver à coudre la jupe de mes rêves"),
    CommentsHobby(userPics: "morgan", userName: "Morgan", commDetailHobby:" Trop cool ! Merci pour les explications !")
]
