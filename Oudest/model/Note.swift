//
//  Note.swift
//  Oudest
//
//  Created by mazen baddad on 9/14/23.
//

import Foundation

enum Note: Int, CaseIterable {
    case a
    case aSharp
    case b
    case c
    case cSharp
    case d
    case dSharp
    case e
    case f
    case fSharp
    case g
    case gSharp
    
    var name: String {
        switch self {
        case .a     : return "A"
        case .aSharp: return "A#"
        case .b     : return "B"
        case .c     : return "C"
        case .cSharp: return "C#"
        case .d     : return "D"
        case .dSharp: return "D#"
        case .e     : return "E"
        case .f     : return "F"
        case .fSharp: return "F#"
        case .g     : return "G"
        case .gSharp: return "G#"
        }
    }
    
    var next: Note {
        let noteIndex = rawValue
        let numberOfNotes = Note.allCases.count
        let nextNoteIndex = (noteIndex + 1) % numberOfNotes
        return Note(rawValue: nextNoteIndex) ?? .a
    }
}
