package io.flutter.plugins;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;

/**
 * Crate by E470PD on 2019/3/29
 */
public class PlatFromChannel {
    public static final String BATTERY_CHANNEL = "BATTERY_CHANNEL";
    //flutter 跳转到原生
    public static final String F_N_CHANNEL = "F_N_CHANNEL";
    //原生跳转到flutter
    public static final String N_F_CHANNEL = "N_F_CHANNEL";
    //event 主动发送数据N－F
    public static final String EVENT_BATTER_CHANNEL = "EVENT_BATTER_CHANNEL";
    public static MethodChannel fNChannel;
    public static MethodChannel nFChannel;
    public static MethodChannel batteryMethodChannel;
    public static EventChannel batteryEventChannel;

}
