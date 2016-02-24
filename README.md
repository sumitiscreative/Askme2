# Askme2
Askme - question done in objective C

Here is short description of things done :

1. ImageManager : to download image and take care of caching. This class is made for all the image operations. Caching can be improved further by using SHA1sum.

2. Cells classes : (View classes)
  OnlyImageCell : Template 1 cell
  CollectionCell :  Template 2 cell
  ScrollViewCell : Template 3 cell

3. HomeController : To display the data present on json (controller class)

4. Items : (model class)

5. CollectionViewCell : To display horizontal cards

6. pods are integrated, but there was no use of it.

Library for horizontal scroller is available via pods. but, i have created it as per design from scratch here.
Upper top bar is not working as we dont have any use case for the same here.

1.	Followed MVC architecture
2.	Non UI blocking Code -- as we are using dispatch_async to download images
3.	Image Caching -- done
4.	Unit Testing -- not done 
5.	Good  workflow with  version control system . (Frequent and meaningful commits   pushes , feature branching etc.) -- done
6.	Meaningful documentation . -- done 
7.	Memory Management if required -- done
8.	Use of dynamic layout elements  ( like UICollectionview ) -- yes used
9.	Support for multiple  screens  -- yes it supports all screens in portrait.


Thanks


