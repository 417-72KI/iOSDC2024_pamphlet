#!/usr/bin/env/ swift

import Foundation
#if canImport(FoundationXML)
import FoundationXML
#endif

let xml = """
                <root>
                <child>
                    <name>John</name>
                    <age>30</age>
                </child>
                <child>
                    <name>Jane</name>
                    <age>25</age>
                </child>
                </root>
                """
let xmlData = Data(xml.utf8)

let parser = XMLParser(data: xmlData)
