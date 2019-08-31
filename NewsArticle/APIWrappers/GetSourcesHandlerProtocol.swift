//
//  GetSourcesHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import RxSwift

protocol GetSourcesHandlerProtocol {
    func getSources() -> Observable<SourceListModel?>
}
