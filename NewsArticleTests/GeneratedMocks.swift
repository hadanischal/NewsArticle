// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetNewsHandler.swift at 2019-08-23 12:25:49 +0000

//
//  GetNewsHandler.swift
//  NewsArticle
//
//  Created by Nischal Hada on 6/18/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Cuckoo
@testable import NewsArticle

import RxCocoa
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

     override var resource: Resource<ArticlesList> {
        get {
            return cuckoo_manager.getter("resource",
                superclassCall:

                    super.resource
                    ,
                defaultCall: __defaultImplStub!.resource)
        }

        set {
            cuckoo_manager.setter("resource",
                value: newValue,
                superclassCall:

                    super.resource = newValue
                    ,
                defaultCall: __defaultImplStub!.resource = newValue)
        }

    }

     override func populateNews() -> Observable<ArticlesList?> {

    return cuckoo_manager.call("populateNews() -> Observable<ArticlesList?>",
            parameters: (),
            escapingParameters: (),
            superclassCall:

                super.populateNews()
                ,
            defaultCall: __defaultImplStub!.populateNews())

    }

	 struct __StubbingProxy_GetNewsHandler: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    var resource: Cuckoo.ClassToBeStubbedProperty<MockGetNewsHandler, Resource<ArticlesList>> {
	        return .init(manager: cuckoo_manager, name: "resource")
	    }

	    func populateNews() -> Cuckoo.ClassStubFunction<(), Observable<ArticlesList?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsHandler.self, method: "populateNews() -> Observable<ArticlesList?>", parameterMatchers: matchers))
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

	    var resource: Cuckoo.VerifyProperty<Resource<ArticlesList>> {
	        return .init(manager: cuckoo_manager, name: "resource", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }

	    @discardableResult
	    func populateNews() -> Cuckoo.__DoNotUse<(), Observable<ArticlesList?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("populateNews() -> Observable<ArticlesList?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class GetNewsHandlerStub: GetNewsHandler {

     override var resource: Resource<ArticlesList> {
        get {
            return DefaultValueRegistry.defaultValue(for: (Resource<ArticlesList>).self)
        }

        set { }

    }

     override func populateNews() -> Observable<ArticlesList?> {
        return DefaultValueRegistry.defaultValue(for: (Observable<ArticlesList?>).self)
    }

}

// MARK: - Mocks generated from file: NewsArticle/APIWrappers/GetNewsHandlerProtocol.swift at 2019-08-23 12:25:49 +0000

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

     func populateNews() -> Observable<ArticlesList?> {

    return cuckoo_manager.call("populateNews() -> Observable<ArticlesList?>",
            parameters: (),
            escapingParameters: (),
            superclassCall:

                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.populateNews())

    }

	 struct __StubbingProxy_GetNewsHandlerProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager

	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }

	    func populateNews() -> Cuckoo.ProtocolStubFunction<(), Observable<ArticlesList?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockGetNewsHandlerProtocol.self, method: "populateNews() -> Observable<ArticlesList?>", parameterMatchers: matchers))
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
	    func populateNews() -> Cuckoo.__DoNotUse<(), Observable<ArticlesList?>> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("populateNews() -> Observable<ArticlesList?>", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }

	}
}

 class GetNewsHandlerProtocolStub: GetNewsHandlerProtocol {

     func populateNews() -> Observable<ArticlesList?> {
        return DefaultValueRegistry.defaultValue(for: (Observable<ArticlesList?>).self)
    }

}
