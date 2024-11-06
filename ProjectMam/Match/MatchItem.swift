// MatchItem.swift
import Foundation

struct MatchItem: Identifiable {
    let id = UUID()
    let text: String?
    let imageName: String?
    var isMatched: Bool = false
}
