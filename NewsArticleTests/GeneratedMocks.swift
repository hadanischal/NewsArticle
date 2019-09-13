// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetNewsHandler.swift at 2019-09-11 08:49:52 +0000

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
    

    

    

    
    
    
     override func getTopHeadlines(withParameter param: [String: String]?) -> Observable<ArticlesList?> {
        
    return cuckoo_manager.call("getTopHeadlines(withParameter: [String: String]?) -> Observable<ArticlesList?>",
            parameters: (param),
            escapingParameters: (param),
            superclassCall:
                
                super.getTopHeadlines(withParameter: param)
                ,
            defaultCall: __defaultImplStub!.getTopHeadlines(withParameter: param))
        
    }
    

	 struct __StubbingProxy_GetNewsHandler: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getTopHeadlines<M1: Cuckoo.OptionalMatchable>(withParameter param: M1) -> Cuckoo.ClassStubFunction<([String: String]?), Observable<ArticlesList?>> where M1.OptionalMatchedType == [String: String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String: String]?)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsHandler.self, method: "getTopHeadlines(withParameter: [String: String]?) -> Observable<ArticlesList?>", parameterMatchers: matchers))
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
	    func getTopHeadlines<M1: Cuckoo.OptionalMatchable>(withParameter param: M1) -> Cuckoo.__DoNotUse<([String: String]?), Observable<ArticlesList?>> where M1.OptionalMatchedType == [String: String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String: String]?)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("getTopHeadlines(withParameter: [String: String]?) -> Observable<ArticlesList?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetNewsHandlerStub: GetNewsHandler {
    

    

    
     override func getTopHeadlines(withParameter param: [String: String]?) -> Observable<ArticlesList?>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<ArticlesList?>).self)
    }
    
}


// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetNewsHandlerProtocol.swift at 2019-09-11 08:49:52 +0000

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
    

    

    

    
    
    
     func getTopHeadlines(withParameter param: [String: String]?) -> Observable<ArticlesList?> {
        
    return cuckoo_manager.call("getTopHeadlines(withParameter: [String: String]?) -> Observable<ArticlesList?>",
            parameters: (param),
            escapingParameters: (param),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getTopHeadlines(withParameter: param))
        
    }
    

	 struct __StubbingProxy_GetNewsHandlerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getTopHeadlines<M1: Cuckoo.OptionalMatchable>(withParameter param: M1) -> Cuckoo.ProtocolStubFunction<([String: String]?), Observable<ArticlesList?>> where M1.OptionalMatchedType == [String: String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String: String]?)>] = [wrap(matchable: param) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsHandlerProtocol.self, method: "getTopHeadlines(withParameter: [String: String]?) -> Observable<ArticlesList?>", parameterMatchers: matchers))
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
	    func getTopHeadlines<M1: Cuckoo.OptionalMatchable>(withParameter param: M1) -> Cuckoo.__DoNotUse<([String: String]?), Observable<ArticlesList?>> where M1.OptionalMatchedType == [String: String] {
	        let matchers: [Cuckoo.ParameterMatcher<([String: String]?)>] = [wrap(matchable: param) { $0 }]
	        return cuckoo_manager.verify("getTopHeadlines(withParameter: [String: String]?) -> Observable<ArticlesList?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetNewsHandlerProtocolStub: GetNewsHandlerProtocol {
    

    

    
     func getTopHeadlines(withParameter param: [String: String]?) -> Observable<ArticlesList?>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<ArticlesList?>).self)
    }
    
}


// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetSourcesHandlerProtocol.swift at 2019-09-11 08:49:52 +0000

//
//  GetSourcesHandlerProtocol.swift
//  NewsArticle
//
//  Created by Nischal Hada on 31/8/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxSwift


 class MockGetSourcesHandlerProtocol: GetSourcesHandlerProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = GetSourcesHandlerProtocol
    
     typealias Stubbing = __StubbingProxy_GetSourcesHandlerProtocol
     typealias Verification = __VerificationProxy_GetSourcesHandlerProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: GetSourcesHandlerProtocol?

     func enableDefaultImplementation(_ stub: GetSourcesHandlerProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func getSources() -> Observable<SourceListModel?> {
        
    return cuckoo_manager.call("getSources() -> Observable<SourceListModel?>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getSources())
        
    }
    

	 struct __StubbingProxy_GetSourcesHandlerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func getSources() -> Cuckoo.ProtocolStubFunction<(), Observable<SourceListModel?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGetSourcesHandlerProtocol.self, method: "getSources() -> Observable<SourceListModel?>", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_GetSourcesHandlerProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func getSources() -> Cuckoo.__DoNotUse<(), Observable<SourceListModel?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getSources() -> Observable<SourceListModel?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class GetSourcesHandlerProtocolStub: GetSourcesHandlerProtocol {
    

    

    
     func getSources() -> Observable<SourceListModel?>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<SourceListModel?>).self)
    }
    
}


// MARK: - Mocks generated from file: NewsArticle/FileManagerHandler/CategoriesHandlerProtocol.swift at 2019-09-11 08:49:52 +0000

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
    
    
    
     func getEndpoint() -> Observable<EndpointsModel> {
        
    return cuckoo_manager.call("getEndpoint() -> Observable<EndpointsModel>",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.getEndpoint())
        
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
	    
	    func getEndpoint() -> Cuckoo.ProtocolStubFunction<(), Observable<EndpointsModel>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCategoriesHandlerProtocol.self, method: "getEndpoint() -> Observable<EndpointsModel>", parameterMatchers: matchers))
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
	    
	    @discardableResult
	    func getEndpoint() -> Cuckoo.__DoNotUse<(), Observable<EndpointsModel>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("getEndpoint() -> Observable<EndpointsModel>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CategoriesHandlerProtocolStub: CategoriesHandlerProtocol {
    

    

    
     func getCategories() -> Observable<CategoriesModel>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<CategoriesModel>).self)
    }
    
     func getEndpoint() -> Observable<EndpointsModel>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<EndpointsModel>).self)
    }
    
}


// MARK: - Mocks generated from file: NewsArticle/FileManagerHandler/FileManagerHandlerProtocol.swift at 2019-09-11 08:49:52 +0000

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
    

    

    
     func load<T: Decodable>(resource: FileManagerResource<T>) -> Observable<T>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }
    
}


// MARK: - Mocks generated from file: NewsArticle/Networking/WebServiceProtocol.swift at 2019-09-11 08:49:52 +0000

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
    

    

    
     func load<T: Decodable>(resource: Resource<T>) -> Observable<T>  {
        return DefaultValueRegistry.defaultValue(for: (Observable<T>).self)
    }
    
}

