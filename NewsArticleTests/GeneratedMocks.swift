// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetNewsHandler.swift at 2019-08-27 12:50:56 +0000

//
//  GetNewsHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxSwift
import UIKit

 class MockGetNewsHandler: GetNewsHandler, Cuckoo.ClassMock {

     typealias MocksType = GetNewsHandler

     typealias Stubbing = __StubbingProxy_GetNewsHandler
     typealias Verification = __VerificationProxy_GetNewsHandler

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    private var __defaultImplStub: GetNewsHandler?

     func enableDefaultImplementation(_ stub: GetNewsHandler) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

     override func populateNews(withCategory category: String) -> Observable<ArticlesList?> {

    return cuckoo_manager.call("populateNews(withCategory: String) -> Observable<ArticlesList?>",
            parameters: (category),
            escapingParameters: (category),
            superclassCall:

                super.populateNews(withCategory: category)
                ,
            defaultCall: __defaultImplStub!.populateNews(withCategory: category))

    }

	 struct __StubbingProxy_GetNewsHandler: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    func populateNews<M1: Cuckoo.Matchable>(withCategory category: M1) -> Cuckoo.ClassStubFunction<(String), Observable<ArticlesList?>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: category) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsHandler.self, method: "populateNews(withCategory: String) -> Observable<ArticlesList?>", parameterMatchers: matchers))
	    }

	}

	 struct __VerificationProxy_GetNewsHandler: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation

	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }

	    @discardableResult
	    func populateNews<M1: Cuckoo.Matchable>(withCategory category: M1) -> Cuckoo.__DoNotUse<(String), Observable<ArticlesList?>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: category) { $0 }]
	        return cuckoo_manager.verify("populateNews(withCategory: String) -> Observable<ArticlesList?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class GetNewsHandlerStub: GetNewsHandler {

     override func populateNews(withCategory category: String) -> Observable<ArticlesList?> {
        return DefaultValueRegistry.defaultValue(for: (Observable<ArticlesList?>).self)
    }

}

// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetNewsHandlerProtocol.swift at 2019-08-27 12:50:56 +0000

//
//  GetNewsHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxSwift

 class MockGetNewsHandlerProtocol: GetNewsHandlerProtocol, Cuckoo.ProtocolMock {

     typealias MocksType = GetNewsHandlerProtocol

     typealias Stubbing = __StubbingProxy_GetNewsHandlerProtocol
     typealias Verification = __VerificationProxy_GetNewsHandlerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: GetNewsHandlerProtocol?

     func enableDefaultImplementation(_ stub: GetNewsHandlerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

     func populateNews(withCategory category: String) -> Observable<ArticlesList?> {

    return cuckoo_manager.call("populateNews(withCategory: String) -> Observable<ArticlesList?>",
            parameters: (category),
            escapingParameters: (category),
            superclassCall:

                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.populateNews(withCategory: category))

    }

	 struct __StubbingProxy_GetNewsHandlerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    func populateNews<M1: Cuckoo.Matchable>(withCategory category: M1) -> Cuckoo.ProtocolStubFunction<(String), Observable<ArticlesList?>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: category) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsHandlerProtocol.self, method: "populateNews(withCategory: String) -> Observable<ArticlesList?>", parameterMatchers: matchers))
	    }

	}

	 struct __VerificationProxy_GetNewsHandlerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation

	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }

	    @discardableResult
	    func populateNews<M1: Cuckoo.Matchable>(withCategory category: M1) -> Cuckoo.__DoNotUse<(String), Observable<ArticlesList?>> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: category) { $0 }]
	        return cuckoo_manager.verify("populateNews(withCategory: String) -> Observable<ArticlesList?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class GetNewsHandlerProtocolStub: GetNewsHandlerProtocol {

     func populateNews(withCategory category: String) -> Observable<ArticlesList?> {
        return DefaultValueRegistry.defaultValue(for: (Observable<ArticlesList?>).self)
    }

}

// MARK: - Mocks generated from file: NewsArticle/FileManagerHandler/CategoriesHandlerProtocol.swift at 2019-08-27 12:50:56 +0000

//
//  CategoriesHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxSwift

 class MockCategoriesHandlerProtocol: CategoriesHandlerProtocol, Cuckoo.ProtocolMock {

     typealias MocksType = CategoriesHandlerProtocol

     typealias Stubbing = __StubbingProxy_CategoriesHandlerProtocol
     typealias Verification = __VerificationProxy_CategoriesHandlerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: CategoriesHandlerProtocol?

     func enableDefaultImplementation(_ stub: CategoriesHandlerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

     func getCategories() -> Observable<CategoriesModel> {

    return cuckoo_manager.call("getCategories() -> Observable<CategoriesModel>",
            parameters: (),
            escapingParameters: (),
            superclassCall:

                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getCategories())

    }

	 struct __StubbingProxy_CategoriesHandlerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    func getCategories() -> Cuckoo.ProtocolStubFunction<(), Observable<CategoriesModel>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCategoriesHandlerProtocol.self, method: "getCategories() -> Observable<CategoriesModel>", parameterMatchers: matchers))
	    }

	}

	 struct __VerificationProxy_CategoriesHandlerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation

	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }

	    @discardableResult
	    func getCategories() -> Cuckoo.__DoNotUse<(), Observable<CategoriesModel>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getCategories() -> Observable<CategoriesModel>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class CategoriesHandlerProtocolStub: CategoriesHandlerProtocol {

     func getCategories() -> Observable<CategoriesModel> {
        return DefaultValueRegistry.defaultValue(for: (Observable<CategoriesModel>).self)
    }

}

// MARK: - Mocks generated from file: NewsArticle/FileManagerHandler/FileManagerHandlerProtocol.swift at 2019-08-27 12:50:56 +0000

//
//  FileManagerHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 25/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxSwift

 class MockFileManagerHandlerProtocol: FileManagerHandlerProtocol, Cuckoo.ProtocolMock {

     typealias MocksType = FileManagerHandlerProtocol

     typealias Stubbing = __StubbingProxy_FileManagerHandlerProtocol
     typealias Verification = __VerificationProxy_FileManagerHandlerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: FileManagerHandlerProtocol?

     func enableDefaultImplementation(_ stub: FileManagerHandlerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

     func load<T: Decodable>(resource: FileManagerResource<T>) -> Observable<T> {

    return cuckoo_manager.call("load(resource: FileManagerResource<T>) -> Observable<T>",
            parameters: (resource),
            escapingParameters: (resource),
            superclassCall:

                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.load(resource: resource))

    }

	 struct __StubbingProxy_FileManagerHandlerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    func load<M1: Cuckoo.Matchable, T: Decodable>(resource: M1) -> Cuckoo.ProtocolStubFunction<(FileManagerResource<T>), Observable<T>> where M1.MatchedType == FileManagerResource<T> {
	        let matchers: [Cuckoo.ParameterMatcher<(FileManagerResource<T>)>] = [wrap(matchable: resource) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockFileManagerHandlerProtocol.self, method: "load(resource: FileManagerResource<T>) -> Observable<T>", parameterMatchers: matchers))
	    }

	}

	 struct __VerificationProxy_FileManagerHandlerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation

	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }

	    @discardableResult
	    func load<M1: Cuckoo.Matchable, T: Decodable>(resource: M1) -> Cuckoo.__DoNotUse<(FileManagerResource<T>), Observable<T>> where M1.MatchedType == FileManagerResource<T> {
	        let matchers: [Cuckoo.ParameterMatcher<(FileManagerResource<T>)>] = [wrap(matchable: resource) { $0 }]
	        return cuckoo_manager.verify("load(resource: FileManagerResource<T>) -> Observable<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class FileManagerHandlerProtocolStub: FileManagerHandlerProtocol {

     func load<T: Decodable>(resource: FileManagerResource<T>) -> Observable<T> {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }

}

// MARK: - Mocks generated from file: NewsArticle/Networking/WebServiceProtocol.swift at 2019-08-27 12:50:56 +0000

//
//  WebServiceProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 27/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxSwift

 class MockWebServiceProtocol: WebServiceProtocol, Cuckoo.ProtocolMock {

     typealias MocksType = WebServiceProtocol

     typealias Stubbing = __StubbingProxy_WebServiceProtocol
     typealias Verification = __VerificationProxy_WebServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    private var __defaultImplStub: WebServiceProtocol?

     func enableDefaultImplementation(_ stub: WebServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }

     func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {

    return cuckoo_manager.call("load(resource: Resource<T>) -> Observable<T>",
            parameters: (resource),
            escapingParameters: (resource),
            superclassCall:

                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.load(resource: resource))

    }

	 struct __StubbingProxy_WebServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    func load<M1: Cuckoo.Matchable, T: Decodable>(resource: M1) -> Cuckoo.ProtocolStubFunction<(Resource<T>), Observable<T>> where M1.MatchedType == Resource<T> {
	        let matchers: [Cuckoo.ParameterMatcher<(Resource<T>)>] = [wrap(matchable: resource) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockWebServiceProtocol.self, method: "load(resource: Resource<T>) -> Observable<T>", parameterMatchers: matchers))
	    }

	}

	 struct __VerificationProxy_WebServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation

	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }

	    @discardableResult
	    func load<M1: Cuckoo.Matchable, T: Decodable>(resource: M1) -> Cuckoo.__DoNotUse<(Resource<T>), Observable<T>> where M1.MatchedType == Resource<T> {
	        let matchers: [Cuckoo.ParameterMatcher<(Resource<T>)>] = [wrap(matchable: resource) { $0 }]
	        return cuckoo_manager.verify("load(resource: Resource<T>) -> Observable<T>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class WebServiceProtocolStub: WebServiceProtocol {

     func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }

}
