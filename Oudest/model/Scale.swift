//
//  Scale.swift
//  Oudest
//
//  Created by mazen baddad on 9/14/23.
//

import Foundation

struct Scale {
    var name: String
    var key: Note // e = 7      f = 8
    var intervals: Array<Interval>
    var notes: Array<Note> {
        var notes: Array<Note> = []
        for interval in intervals {
            let noteIndex = (key.rawValue + interval.rawValue) % Interval.allCases.count
            if let note = Note(rawValue: noteIndex) {
                notes.append(note)
            }
        }
        return notes
    }
}
