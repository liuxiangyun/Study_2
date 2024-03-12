import router from '@ohos.router'
import { ABuilder } from './Second'

@Entry
@Component
struct Third {
  @State text: string = '我是自定义组件一'
  @State text1: string = '我是自定义组件一'
  @State text2: string = '我是自定义组件三'
  @State countDown: number = 5

  @Builder a() {
    Text('this直接引用自定义构建函数')
  }

  build() {
    Row() {
      Column() {
        CustomText({ text: this.text, click: () => {
          this.text = "我是自定义组件一:点击了我"
        }, closer: ABuilder })

        CustomText({ text: this.text1, click: () => {
          this.text1 = "我是自定义组件二:点击了我"
        }, closer: this.a })

        CustomText({ text: this.text2, click: () => {
          this.text2 = "我是自定义组件三:点击关闭整个页面"
          let intervalId = setInterval(() => {
            this.countDown--
            if (this.countDown == 0) {
              clearInterval(intervalId)
              router.back()
            }
          }, 1000)
        } }) {
          Text(`倒计时${this.countDown}s`)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}


@Component
struct CustomText {
  @Prop text: string
  click?: () => void
  @BuilderParam closer: () => void

  build() {
    Column() {
      Text(`自定义组件-${this.text}`).onClick(this.click)
      this.closer()
    }
  }
}