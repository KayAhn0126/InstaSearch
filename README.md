# InstaSearch
- UICollectionView with Storyboard
- UITabBar Controller
- UISearchController

## 🍎 작동 화면

|5가지 탭 전시 | 뉴스피드 탭 | 서치 탭 |
|:-:|:-:|:-:|
|![](https://i.imgur.com/6F4xIaE.gif) | ![InstaSearchPlayNewsFeedGIF](https://user-images.githubusercontent.com/40224884/186312236-0cf77fb6-85d4-4182-8bde-3868ed2dc43b.gif) | ![InstaSearchPlaySearchGIF](https://user-images.githubusercontent.com/40224884/186311914-c534f494-f3a0-4bdf-a600-b4930021407f.gif) | 

## 🍎 전체적인 화면 구성
<img width="1920" alt="InstaSearchMap" src="https://user-images.githubusercontent.com/40224884/186313258-359b2e73-17d7-4bc5-8d9a-adeb7a832bdf.png">


## 🍎 Tab Bar Controller
- Embed In 기능으로 구현
- 맨 위에 탭 바 컨트롤러를 만들고 순서대로 홈, 서치, 비디오, 쇼핑, 프로필 탭을 구성.


## 🍎 search view Controller

```swift
class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        ...
        
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Type Here!"
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}
```
- self.navigationItem.title = "Search"
    - 해당 VC의 네비게이션 아이템의 타이틀을 Search로 만들어준다

- let searchController = UISearchController(searchResultsController: nil)
    - 이니셜라이저 인자로 searchResultsController를 넣을 수 있다(옵셔널). Jump to Definition으로 들어가서 보면,
    - "Pass nil if you wish to display search results in the same view that you are searching."
    - 즉, nil로 설정하면 search controller를 생성한 VC에서 서칭과 결과를 둘 다 받는다는 이야기이고, nil 대신 특정 컨트롤러를 넣게된다면 해당 컨트롤러에서 결과를 받아 처리한다는 이야기이다.

- searchController.hidesNavigationBarDuringPresentation = false
    - search bar가 활성화 될 때 네비게이션 바를 숨길것인지 물어보는 프로퍼티.

- searchController.searchBar.placeholder = "Type Here!"
    - 아무것도 입력하지 않았을때 사용자에게 무엇을 입력해야 하는지 유도하는 문자열.

- self.navigationItem.searchController = searchController
    - 해당 VC의 네비게이션 아이템의 searchController 프로퍼티에 위에서 설정해준 searchController를 넣어준다.
 
- searchController.searchResultsUpdater = self
    - SearchViewController가 UISearchResultsUpdating 프로토콜을 준수하겠다는 이야기.
    - 다른 말로 searchResultsUpdater에 대한 정보는 SearchViewController가 주겠다는 이야기.
    - 아래의 코드를 작성함으로써 준수한다.
    ```swift
    extension SearchViewController: UISearchResultsUpdating {
        func updateSearchResults(for searchController: UISearchController) { // searchController를 통해서 search bar나 search text에 접근 할 수 있다.
            let search = searchController.searchBar.text
            print("search: \(search)")
        }
    }
    ```
