// Lorem.swift
//
// Copyright (c) 2014–2015 Apostle (http://apostle.nl)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

open class Lorem {
    fileprivate static let wordList = [
        "alias", "consequatur", "aut", "perferendis", "sit", "voluptatem",
        "accusantium", "doloremque", "aperiam", "eaque","ipsa", "quae", "ab",
        "illo", "inventore", "veritatis", "et", "quasi", "architecto",
        "beatae", "vitae", "dicta", "sunt", "explicabo", "aspernatur", "aut",
        "odit", "aut", "fugit", "sed", "quia", "consequuntur", "magni",
        "dolores", "eos", "qui", "ratione", "voluptatem", "sequi", "nesciunt",
        "neque", "dolorem", "ipsum", "quia", "dolor", "sit", "amet",
        "consectetur", "adipisci", "velit", "sed", "quia", "non", "numquam",
        "eius", "modi", "tempora", "incidunt", "ut", "labore", "et", "dolore",
        "magnam", "aliquam", "quaerat", "voluptatem", "ut", "enim", "ad",
        "minima", "veniam", "quis", "nostrum", "exercitationem", "ullam",
        "corporis", "nemo", "enim", "ipsam", "voluptatem", "quia", "voluptas",
        "sit", "suscipit", "laboriosam", "nisi", "ut", "aliquid", "ex", "ea",
        "commodi", "consequatur", "quis", "autem", "vel", "eum", "iure",
        "reprehenderit", "qui", "in", "ea", "voluptate", "velit", "esse",
        "quam", "nihil", "molestiae", "et", "iusto", "odio", "dignissimos",
        "ducimus", "qui", "blanditiis", "praesentium", "laudantium", "totam",
        "rem", "voluptatum", "deleniti", "atque", "corrupti", "quos",
        "dolores", "et", "quas", "molestias", "excepturi", "sint",
        "occaecati", "cupiditate", "non", "provident", "sed", "ut",
        "perspiciatis", "unde", "omnis", "iste", "natus", "error",
        "similique", "sunt", "in", "culpa", "qui", "officia", "deserunt",
        "mollitia", "animi", "id", "est", "laborum", "et", "dolorum", "fuga",
        "et", "harum", "quidem", "rerum", "facilis", "est", "et", "expedita",
        "distinctio", "nam", "libero", "tempore", "cum", "soluta", "nobis",
        "est", "eligendi", "optio", "cumque", "nihil", "impedit", "quo",
        "porro", "quisquam", "est", "qui", "minus", "id", "quod", "maxime",
        "placeat", "facere", "possimus", "omnis", "voluptas", "assumenda",
        "est", "omnis", "dolor", "repellendus", "temporibus", "autem",
        "quibusdam", "et", "aut", "consequatur", "vel", "illum", "qui",
        "dolorem", "eum", "fugiat", "quo", "voluptas", "nulla", "pariatur",
        "at", "vero", "eos", "et", "accusamus", "officiis", "debitis", "aut",
        "rerum", "necessitatibus", "saepe", "eveniet", "ut", "et",
        "voluptates", "repudiandae", "sint", "et", "molestiae", "non",
        "recusandae", "itaque", "earum", "rerum", "hic", "tenetur", "a",
        "sapiente", "delectus", "ut", "aut", "reiciendis", "voluptatibus",
        "maiores", "doloribus", "asperiores", "repellat"
    ]
    
    /**
        Return a random word.
    
        - returns: Returns a random word.
    */
    open class func word() -> String {
        return wordList.random()!
    }
    
    /**
        Return an array of `count` words.
    
        - parameter count: The number of words to return.
    
        - returns: Returns an array of `count` words.
    */
    open class func words(_ count : Int = 3) -> [String] {
        return wordList.random(count)
    }
    
    /**
        Return a string of `count` words.
    
        - parameter count: The number of words the string should contain.
    
        - returns: Returns a string of `count` words.
    */
    open class func words(_ count : Int = 3) -> String {
        return words(count).joined(separator: " ")
    }
    
    /**
        Generate a sentence of `nbWords` words.

        - parameter nbWords:  The number of words the sentence should contain.
        - parameter variable: If `true`, the number of words will vary between
                              +/- 40% of `nbWords`.

        - returns:
    */
    open class func sentence(_ nbWords : Int = 6, variable : Bool = true) -> String {
        if nbWords <= 0 {
            return ""
        }
        
        let result : String = self.words(variable ? nbWords.randomize(40) : nbWords)
        
        return result.firstCapitalized + "."
    }
    
    /**
        Generate an array of sentences.

        - parameter nbSentences: The number of sentences to generate.
        
        - returns: Returns an array of random sentences.
    */
    open class func sentences(_ nbSentences : Int = 3) -> [String] {
        return (0..<nbSentences).map { _ in sentence() }
    }
    
    /**
        Generate a string of random sentences.

        - parameter nbSentences: The number of sentences to generate.

        - returns: Returns a string of random sentences.
    */
    open class func sentences(_ nbSentences : Int = 3) -> String {
        return sentences(nbSentences).joined(separator: " ")
    }
    
    /**
        Generate a paragraph with `nbSentences` random sentences.

        - parameter nbSentences: The number of sentences the paragraph should
                                 contain.
        - parameter variable:    If `true`, the number of sentences will vary
                                 between +/- 40% of `nbSentences`.

        - returns: Returns a paragraph with `nbSentences` random sentences.
    */
    open class func paragraph(_ nbSentences : Int = 3, variable : Bool = true) -> String {
        if nbSentences <= 0 {
            return ""
        }
        
        return sentences(variable ? nbSentences.randomize(40) : nbSentences).joined(separator: " ")
    }
    
    /**
        Generate an array of random paragraphs.

        - parameter nbParagraphs: The number of paragraphs to generate.

        - returns: Returns an array of `nbParagraphs` paragraphs.
    */
    open class func paragraphs(_ nbParagraphs : Int = 3) -> [String] {
        return (0..<nbParagraphs).map { _ in paragraph() }
    }
    
    /**
        Generate a string of random paragrahs.

        - parameter nbParagraphs: The number of paragraphs to generate.

        - returns: Returns a string of random paragraphs.
    */
    open class func paragraphs(_ nbParagraphs : Int = 3) -> String {
        return paragraphs(nbParagraphs).joined(separator: "\n\n")
    }
    
    /**
        Generate a string of at most `maxNbChars` characters.

        - parameter maxNbChars: The maximum number of characters the string
                                should contain.

        - returns: Returns a string of at most `maxNbChars` characters.
    */
    open class func text(_ maxNbChars : Int = 200) -> String {
        var result : [String] = []
        
        if maxNbChars < 5 {
            return ""
        } else if maxNbChars < 25 {
            while result.count == 0 {
                var size = 0
                
                while size < maxNbChars {
                    let w = (size != 0 ? " " : "") + word()
                    result.append(w)
                    size += w.characters.count
                }
                
                result.popLast()
            }
        } else if maxNbChars < 100 {
            while result.count == 0 {
                var size = 0
                
                while size < maxNbChars {
                    let s = (size != 0 ? " " : "") + sentence()
                    result.append(s)
                    size += s.characters.count
                }
                
                result.popLast()
            }
        } else {
            while result.count == 0 {
                var size = 0
                
                while size < maxNbChars {
                    let p = (size != 0 ? "\n" : "") + paragraph()
                    result.append(p)
                    size += p.characters.count
                }
                
                result.popLast()
            }
        }
        
        return result.joined(separator: "")
    }
}

extension String {
    var firstCapitalized : String {
        var string = self
        string.replaceSubrange(string.startIndex...string.startIndex, with: String(string[string.startIndex]).capitalized)
        
        return string
    }
}
