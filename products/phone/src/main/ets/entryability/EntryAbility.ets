import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { Log } from '@abner/log';
import { deviceInfo } from '@kit.BasicServicesKit';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    Log.init({
      tag: "MeikouLog",
      domain: 0x0000,
      close: false,
      isHilog: true,
      showLogLocation: true,
      logSize: 1024
    })
  }

  onDestroy(): void {
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {

    windowStage.loadContent('pages/Index', (err) => {
      if (deviceInfo.deviceType !== '2in1') {
        // 开启全屏
        const win = windowStage.getMainWindowSync()
        win.setWindowLayoutFullScreen(true)
        // 获取安全区域高度
        const top = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).topRect
        AppStorage.setOrCreate<number>('safeTop', px2vp(top.height))
        const bottom = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR).bottomRect
        AppStorage.setOrCreate('safeBottom', px2vp(bottom.height))
      }
    });
  }

  onWindowStageDestroy(): void {
  }

  onForeground(): void {
  }

  onBackground(): void {
  }
}
