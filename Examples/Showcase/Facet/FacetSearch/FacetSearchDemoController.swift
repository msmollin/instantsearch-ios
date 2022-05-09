//
//  FacetSearchDemoController.swift
//  Examples
//
//  Created by Vladislav Fitc on 07.04.2022.
//

import Foundation
import InstantSearch

class FacetSearchDemoController {
  
  let facetSearcher: FacetSearcher
  let filterState: FilterState
  let clearFilterConnector: FilterClearConnector
  let facetListConnector: FacetListConnector
  let queryInputConnector: QueryInputConnector
  
  init() {
    filterState = .init()
    clearFilterConnector = .init(filterState: filterState)
    facetSearcher = FacetSearcher(client: .instantSearch,
                                  indexName: .facetSearch,
                                  facetName: "brand")
    facetListConnector = .init(searcher: facetSearcher,
                               filterState: filterState,
                               attribute: "brand",
                               operator: .or)
    queryInputConnector = QueryInputConnector(searcher: facetSearcher)
    facetSearcher.search()
  }
  
}
