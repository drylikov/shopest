# shopest
### e-commerce example
![image](https://github.com/thq919/shopest/blob/main/github_assets/screen.gif)





### architecture:
map:

- core
  - usecases (shared interface for domain/usecases)
  - db (shared in source managers per page)
  - http (shared in source managers per page)
  - errors (db/server types of errors)
 
- features
	- feature_name (single screen)	
		- data
			- sources (local/remote)		
			- model (extends domain/entity)
			- source_manager(repositories impl of domain/interface)
		- domain 
			- source_manager_interface (repositories interface)
			- entity
			- usecases (extends core/usecases)
		- presentation
			- state_manager (provider)
			- pages
			- widgets

###  testing:
```
cd new-folder/shopest
git clone git@github.com:thq919/shopest.git
flutter run
```
in case of any issues try run
```
flutter doctor
```
