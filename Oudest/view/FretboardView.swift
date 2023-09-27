//
//  FretboardView.swift
//  Oudest
//
//  Created by mazen baddad on 9/16/23.
//

import UIKit

class FretboardView: UIStackView {
    
    private var nutView: UIView = UIView()
    private var strings: Array<UIStackView> = []
    
    private var tuning: Tuning
    
    init(tuning: Tuning) {
        self.tuning = tuning
        super.init(frame: .zero)
    }
    
    func drawUI() {
        setupFretboardStackView()
        setupStringViews()
        setupTheNutView()
        addNotes()
    }
    
    private func setupFretboardStackView() {
        self.backgroundColor = .clear
        self.axis = .vertical
        self.spacing = UIScreen.main.bounds.height/15
        self.clipsToBounds = false
    }
    
    private func setupTheNutView() {
        nutView.backgroundColor = .label
        self.addSubview(nutView)
        nutView.anchor(axisAnchors: .leading(self.leadingAnchor, constant: 44),
                       .bottom(self.bottomAnchor),
                       .top(self.topAnchor),
                       .width(16)
        )
    }
    
    private func setupStringViews() {
        for i in 0..<tuning.keyNotes.count {
            let stringLine = UIView()
            stringLine.backgroundColor = .label
            self.addArrangedSubview(stringLine)
            stringLine.anchor(axisAnchors: .height(4))
            
            let string = createAStringView()
            string.tag = i
            self.addSubview(string)
            string.anchor(axisAnchors: .leading(stringLine.leadingAnchor),
                          .centerY(stringLine.centerYAnchor))
            self.strings.append(string)
            
        }
    }
    
    private func createAStringView() -> UIStackView {
        let stringStackView = UIStackView()
        stringStackView.axis = .horizontal
        stringStackView.alignment = .leading
        stringStackView.spacing = 32
        stringStackView.backgroundColor = .clear
        return stringStackView
    }
    
    private func addNotes() {
        self.layoutIfNeeded()
        for (i, note) in tuning.keyNotes.enumerated() {
            if let string = strings.filter({ $0.tag == i}).first {
                addNotes(firstNote: note, for: string)
            }
        }
    }
    
    private func addNotes(firstNote: Note, for string: UIStackView) {
        let numberOfNoteInString = 15
        var currentNote: Note = firstNote
        for _ in 0..<numberOfNoteInString {
            let noteView = create(note: currentNote)
            string.addArrangedSubview(noteView)
            noteView.widthAnchor.constraint(equalTo: string.heightAnchor).isActive = true
            currentNote = currentNote.next
        }
    }
    
    private func create(note: Note) -> SelectionLabel {
        let noteView = SelectionLabel()
        noteView.setTitle(note.name, for: true)
        noteView.setBackground(color: .systemBlue, for: true)
        return noteView
    }
    
    func apply(scale: Scale) {
        let scaleNoteNames = scale.notes.map { $0.name }
        for string in strings {
            for note in string.arrangedSubviews {
                if let selectionNoteView = note as? SelectionLabel {
                    let shouldHide = !scaleNoteNames.contains(selectionNoteView.selectionTitleLabel.text!)
                    selectionNoteView.alpha = shouldHide ? 0.2 : 1
                    selectionNoteView.isEnabled = !shouldHide
                }
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
