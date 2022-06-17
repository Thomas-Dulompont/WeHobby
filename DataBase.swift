//
//  DataBase.swift
//  WeHubbyTests
//
//  Created by apprenant50 on 17/06/2022.
//

import Foundation


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

var userProfiles : [Friends] = [Friends(userPsedo: "Cindie", userBio: "J'adore les créations manuelles mais j'aimerai découvrir de nouveaux loisirs et rencontrer de nouvelles personnes", userTag: [.crea, .nature, .relaxa], userCover: "malta", pictures: ["epoxy", "accrobranche"], pastEvents: [], futureEvents: [], isCurrentUser: true, favoriteCategory: [categoris[0], categoris[4], categoris[11]], isOnline: true, userPicture: "cindie"),
                                Friends(userPsedo: "Cesaltina", userBio: "Couture, broderie, scrapbooking... J'aimerai partager avec des personnes de la communauté", userTag: [.crea, .sante], userCover: "couture", pictures: ["couture"], pastEvents: [], futureEvents: [], isCurrentUser: false, favoriteCategory: [categoris[5], categoris[10], categoris[9]], isOnline: true, userPicture: "cesal"),
                                Friends(userPsedo: "Morgan", userBio: "Fan de cuisine et de relaxation, j'aimerai m'ouvrir à d'autres horizons", userTag: [.relaxa], userCover: "poterie", pictures: ["poterie", "broderie", "epoxy"], pastEvents: [], futureEvents: [], isCurrentUser: false, favoriteCategory: [categoris[6], categoris[10], categoris[8]], isOnline: false, userPicture: "morgan")]
