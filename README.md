xinwei-s-QSBK
=============
xinwei's qiu shi bai ke iOS APP without Ad.<br />

本项目完全开源，欢迎大家在这个基础上进行改进，并与大家分享。<br />
如您感觉本项目中有不妥之处或者有不爽的地方，欢迎提交问题或更改方案，我会及时的对您提交的修改给予反馈。 <br />
希望能为开发者提供一款开源好用的iOS版客户端产品。 一款好产品需要大家共同努力，大家共勉！
内涵糗事 iPhone客户端项目简析
-------------
注：本文假设你已经有xcode4或以上的开发环境，支持iOS5及以上设备,非ARC

直接用双击 XWQiuShiBaiKe.xcodeproj 文件启动 xcode 即可 

下面将简单的解析下项目：

> 1、VideoPlayerKit --- 播放视频控件<br />
> 2、PSCollection --- 瀑布流控件<br />
> 3、HUD --- 等待提示控件<br />
> 4、JSON --- 解析JSON<br />
> 5、LoadMoreFooterView --- 加载更多<br />
> 6、RefreshTableHeaderView --- 下拉刷新<br />
> 7、Custom --- 自定义控件<br />
> 8、3rd Libs --- 第三方平台组件<br />
> 9、ASIHttpRequest --- 开源的网络库，负责网络请求<br />
> 10、SDWebImage --- 异步图像控件<br />
> 11、UIViewBlock --- 使用block做为回调的对话框<br />
> 12、uiimage-from-animated-gif --- 显示gif图像<br />
> 13、Setting --- 设置界面<br />
> 14、Auth --- 登录，注册<br />
> 15、SideBarViewController --- 左侧拉栏<br />
> 16、SideBar --- 主界面容器<br />
> 17、Share --- 分享控件<br />
> 18、Common --- 包括工具类，自定义cell<br />
> 19、Article --- 包含所有显示内容的界面<br />
> 20、Model --- 项目所有的实体对象<br />
> 21、Resource --- 项目资源<br />

项目的功能流程
-------------
###1、 程序功能
> （1）随便逛逛：嫩草、干货<br />
> （2）精华：日、周、月<br />
> （3）有图有真相：硬菜、时令<br />
> （4）穿越<br />
> （5）我的：收藏的、评论的<br />
> （6）热门囧图、美图<br />
> （7）热门视频<br />

###2、 ipa文件的生成
> 1、在 OS X 系统上启动iTunes程序<br />
> 2、启动Xcode，将项目中的 XWQiuShiBaiKe/Products/XWQiuShiBaiKe.app 按住command键然后用鼠标拖放到iTunes的应用程序栏目<br />
> 3、然后在iTunes程序中右键点击"内涵糗事"图标，在弹出的的菜单中选择"在Finder中显示"，这样你就看到ipa文件的路径了。<br />

声明
=============
> 项目完全开源仅供网友下载交流学习使用，请勿擅自用于商业用途，违反必究！

> 项目完成时间较仓促，仍需继续重构ing，也希望有空闲时间的朋友可以加入一起完成。

> 项目中使用的图片资源及接口数据均取自糗事百科，若有疑问请及时与本人联系

> 如有需要请联系 邮箱：362922604@qq.com
