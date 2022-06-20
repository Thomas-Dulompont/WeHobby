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
                                Friends(userPsedo: "Cesaltina", userBio: "Couture, broderie, scrapbooking... J'aimerai partager avec des personnes de la communauté", userTag: [.crea, .sante], userCover: "couture", pictures: ["couture"], pastEvents: [], futureEvents: [], isCurrentUser: false, favoriteCategory: [categoris[5], categoris[10], categoris[9]], isOnline: true, userPicture: "cesal"),
                                Friends(userPsedo: "Morgan", userBio: "Fan de cuisine et de relaxation, j'aimerai m'ouvrir à d'autres horizons", userTag: [.relaxa], userCover: "poterie", pictures: ["poterie", "broderie", "epoxy"], pastEvents: [], futureEvents: [], isCurrentUser: false, favoriteCategory: [categoris[6], categoris[10], categoris[8]], isOnline: false, userPicture: "morgan")]


var loisirs : [Hobbies] = [Hobbies(hobbyName: "Couture", hobbyDescription: "Une couture est l'assemblage de deux ou plusieurs pièces à l'aide de fil à coudre, soit manuellement avec une aiguille, soit en utilisant une machine à coudre ou une surjeteuse. ", subtitleSwipe: "Assemblez des pièces de tissus à l'aide d'une aiguille ou d'une machine.", hobbyPic: "couture", hobbyTags: [.crea, .relaxa], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Broderie", hobbyDescription: "La broderie est un art de décoration des tissus qui consiste à ajouter sur un tissu un motif plat ou en relief fait de fils simples, parfois en intégrant des matériaux tels que des paillettes, des perles, voire des pierres précieuses.", subtitleSwipe: "Embellisez des pièces de tissus à la main", hobbyPic: "broderie", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Poterie", hobbyDescription: "La poterie consiste à créer des vases et récipients à la main à partir de terre cuite.", subtitleSwipe: "Créez vos propres vases et récipients", hobbyPic: "poterie", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Bougies artisanales", hobbyDescription: "La création de bougies artisanales permet de faire et personnaliser à souhait des bougies de toutes tailles, de toutes formes et de toutes odeurs.", subtitleSwipe: "Créez vos propres bougies personnalisées", hobbyPic: "bougie", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10]),
                           Hobbies(hobbyName: "Résines d'epoxy", hobbyDescription: "La résine d'epoxy permet de faire énormément d'objets différents à partir de ce matériau, de les personnalisé grâce à des couleurs et différentes formes grâce à des moules.", subtitleSwipe: "Créez tout type d'objet de toute forme grâce à la résine d'epoxy", hobbyPic: "epoxy", hobbyTags: [.crea], hobbyEvents: [], hobbyComs: [], tutoHobby: [], category: categoris[10])]

var evenements : [Events] = [Events(eventName: "Tricot Participatif", eventHobby: loisirs[0], eventPlace: "Roubaix", eventDate: "23/06/2022", eventDesc: "Venez participer à notre premier tricot participatif de Roubaix. Les différents dons seront reversés à la ville. Le but étant de créer une grande fresque pour l'évènement musicale de l'été.", isOut: false, eventPicture: "coutureevent", participants: [userProfiles[0], userProfiles[1], userProfiles[2]], participate: true, comms: [], coordonnnes: CLLocationCoordinate2D(latitude: 50.690738, longitude: 3.189492)),
                             Events(eventName: "Tricot Solidaire", eventHobby: loisirs[0], eventPlace: "Lille", eventDate: "17/07/2022", eventDesc: "Venez participer à notre premier tricot participatif de Lille. Les différents dons seront reversés à la ville. Le but étant de créer une grande fresque pour la grande Braderie de Lille.", isOut: true, eventPicture: "tricot", participants: [userProfiles[0], userProfiles[1], userProfiles[2]], participate: true, comms: [], coordonnnes: CLLocationCoordinate2D(latitude: 50.629256, longitude: 3.058154)),
                             Events(eventName: "Tricotathlon", eventHobby: loisirs[0], eventPlace: "Tourcoing", eventDate: "01/08/2022", eventDesc: "Venez participer à notre premier tricotathlon de Tourcoing. Les différents dons seront reversés à la ville. Le but étant de créer une grande fresque pour afficher à la mairie.", isOut: false, eventPicture: "tricotevent", participants: [userProfiles[0], userProfiles[1], userProfiles[2]], participate: true, comms: [], coordonnnes: CLLocationCoordinate2D(latitude: 50.723749, longitude: 3.160691))]
