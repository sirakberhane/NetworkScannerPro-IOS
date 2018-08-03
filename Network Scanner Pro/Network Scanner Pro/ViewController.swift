//
//  ViewController.swift
//  Network Scanner Pro
//
//  Created by Sirak Berhane on 2018-07-26.
//  Copyright © 2018 Sirak Berhane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var IP6_TextField: UILabel!
  @IBOutlet weak var IP4_TextField: UILabel!
  @IBOutlet weak var IP6B_TextField: UILabel!
  @IBOutlet weak var IP6C_TextField: UILabel!
  @IBOutlet weak var IP6D_TextField: UILabel!
  @IBOutlet weak var IP6E_TextField: UILabel!

  @IBOutlet weak var download_Label: UILabel!
 
  @IBOutlet weak var startTime_Label: UILabel!
  @IBOutlet weak var endTime_Label: UILabel!

  //Ports
  @IBOutlet weak var _21: UILabel!
  @IBOutlet weak var _22: UILabel!
  @IBOutlet weak var _23: UILabel!
  @IBOutlet weak var _25: UILabel!
  @IBOutlet weak var _53: UILabel!
  @IBOutlet weak var _80: UILabel!
  @IBOutlet weak var _110: UILabel!
  @IBOutlet weak var _1433: UILabel!
  @IBOutlet weak var _3389: UILabel!
  @IBOutlet weak var _5900: UILabel!
  @IBOutlet weak var _115: UILabel!
  @IBOutlet weak var _135: UILabel!
  @IBOutlet weak var _139: UILabel!
  @IBOutlet weak var _143: UILabel!
  @IBOutlet weak var _194: UILabel!
  @IBOutlet weak var _443: UILabel!
  @IBOutlet weak var _445: UILabel!
  @IBOutlet weak var _3306: UILabel!
  @IBOutlet weak var _5632: UILabel!


  typealias speedTestCompletionHandler = (_ megabytesPerSecond: Double? , _ error: Error?) -> Void

  var speedTestCompletionBlock : speedTestCompletionHandler?

  var startTime: CFAbsoluteTime!
  var stopTime: CFAbsoluteTime!
  var bytesReceived: Int!
  var bytesReceivedCG: CGFloat = 0.0;

  

  override func viewDidLoad() {
    super.viewDidLoad()
    checkForSpeedTest();
    startTime_Label?.text? = "\(String(round(startTime.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60) - startTime.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60) )))"
    download_Label?.text? = "\(bytesReceivedCG)";
    endTime_Label?.text? = "\(String(round(stopTime!.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60))))";

    var addr = getIFAddresses();

    let IP6_A = addr[0];
    let IP4_0 = addr[1];
    let IP6_B = addr[2];
    let IP6_C = addr[3];
    let IP6_D = addr[4];
    let IP6_E = addr[5];

    IP6_TextField?.text?   = IP6_A;
    IP4_TextField?.text?   = IP4_0;
    IP6B_TextField?.text?  = IP6_B;
    IP6C_TextField?.text?  = IP6_C;
    IP6D_TextField?.text?  = IP6_D;
    IP6E_TextField?.text?  = IP6_E;

    /*
     21 FTP
     22 SSH
     23 TELNET
     25 SMTP
     53 DNS
     80 HTTP
     110 POP3
     115 SFTP
     135 RPC
     139 NetBIOS
     143 IMAP
     194 IRC
     443 SSL
     445 SMB
     1433 MSSQL
     3306 MySQL
     3389 Remote Desktop
     5632 PCAnywhere
     */

    if (checkTcpPortForListen(port: 21) == true){
      _21?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 22) == true){
      _22?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 23) == true){
      _23?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 25) == true){
      _25?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 53) == true){
      _53?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 110) == true){
      _110?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 115) == true){
      _115?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 135) == true){
      _135?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 139) == true){
      _139?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 143) == true){
      _143?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 194) == true){
      _194?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 443) == true){
      _443?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 445) == true){
      _445?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 1433) == true){
      _1433?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 3306) == true){
      _3306?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 3389) == true){
      _3389?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 5632) == true){
      _5632?.textColor = UIColor.orange
    }
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func refreshNetworkInfo(_ sender: UIButton) {
    checkForSpeedTest();
    startTime_Label?.text? = "\(String(round(startTime.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60) - startTime.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60) )))"
    download_Label?.text? = "\(bytesReceivedCG)";
    endTime_Label?.text? = "\(String(round(stopTime!.truncatingRemainder(dividingBy: 3600).truncatingRemainder(dividingBy: 60))))";

    var addr = getIFAddresses();

    let IP6_A = addr[0];
    let IP4_0 = addr[1];
    let IP6_B = addr[2];
    let IP6_C = addr[3];
    let IP6_D = addr[4];
    let IP6_E = addr[5];

    IP6_TextField?.text?   = IP6_A;
    IP4_TextField?.text?   = IP4_0;
    IP6B_TextField?.text?  = IP6_B;
    IP6C_TextField?.text?  = IP6_C;
    IP6D_TextField?.text?  = IP6_D;
    IP6E_TextField?.text?  = IP6_E;

    if (checkTcpPortForListen(port: 21) == true){
      _21?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 22) == true){
      _22?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 23) == true){
      _23?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 25) == true){
      _25?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 53) == true){
      _53?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 110) == true){
      _110?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 115) == true){
      _115?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 135) == true){
      _135?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 139) == true){
      _139?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 143) == true){
      _143?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 194) == true){
      _194?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 443) == true){
      _443?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 445) == true){
      _445?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 1433) == true){
      _1433?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 3306) == true){
      _3306?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 3389) == true){
      _3389?.textColor = UIColor.orange
    }

    if (checkTcpPortForListen(port: 5632) == true){
      _5632?.textColor = UIColor.orange
    }
  }

  @IBAction func versionInfo(_ sender: UIButton) {
    let alert = UIAlertController(title: "Version 1.0.1-BETA 01: What's new ?\n", message: "* New 'Scan Network' button for continous refresh of network settings.\n\n * Version control notification for new updated versions of the NSP app\n\n * Check network speed, ports, network map, and current location data \n\n * Future implementation includes multi-function support with page control, network mapper, and many more.", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      switch action.style{
      case .default:
        print("default [OK Pressed]")

      case .cancel:
        print("cancel [CANCEL Pressed]")

      case .destructive:
        print("destructive [Destructive Type: After n seconds]")
      }}))
    self.present(alert, animated: true, completion: nil)
  }

  func getIFAddresses() -> [String] {
    var addresses = [String]()

    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return [] }
    guard let firstAddr = ifaddr else { return [] }

    // For each interface ...
    for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
      let flags = Int32(ptr.pointee.ifa_flags)
      let addr = ptr.pointee.ifa_addr.pointee

      // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
      if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
        if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {

          // Convert interface address to a human readable string:
          var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
          if (getnameinfo(ptr.pointee.ifa_addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),
                          nil, socklen_t(0), NI_NUMERICHOST) == 0) {
            let address = String(cString: hostname)
            addresses.append(address)
          }
        }
      }
    }

    freeifaddrs(ifaddr)
    return addresses
  }

  func checkForSpeedTest() {
      testDownloadSpeedWithTimout(timeout: 10.0) { (speed, error) in
      print("Download Speed:", speed ?? "NA")
      print("Speed Test Error:", error ?? "NA")
    }
  }

  func testDownloadSpeedWithTimout(timeout: TimeInterval, withCompletionBlock: @escaping speedTestCompletionHandler) {
      startTime = CFAbsoluteTimeGetCurrent()
      testSpeed()
      stopTime = CFAbsoluteTimeGetCurrent()
  }

  func testSpeed()  {
    let url = URL(string: "https://images.apple.com/v/imac-with-retina/a/images/overview/5k_image.jpg")
    let request = URLRequest(url: url!)
    let session = URLSession.shared
    let startTime = Date()

    let task =  session.dataTask(with: request) { (data, resp, error) in
      guard error == nil && data != nil else{
        print("connection error or data is nill")
        return
      }

      guard resp != nil else{
        print("respons is nill")
        return
      }

      let length  = CGFloat( (resp?.expectedContentLength)!) / 1000000.0
      print(length)
      let elapsed = CGFloat( Date().timeIntervalSince(startTime))
      print("elapsed: \(elapsed)")
      self.bytesReceivedCG = length/elapsed;
      print("Speed: \(length/elapsed) Mb/sec")

    }
    task.resume()
  }

  func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
    bytesReceived! += data.count
    stopTime = CFAbsoluteTimeGetCurrent()
  }

  func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {

    let elapsed = stopTime - startTime

    if let aTempError = error as NSError?, aTempError.domain != NSURLErrorDomain && aTempError.code != NSURLErrorTimedOut && elapsed == 0  {
      speedTestCompletionBlock?(nil, error)
      return
    }

    let speed = elapsed != 0 ? Double(bytesReceived) / elapsed / 1024.0 / 1024.0 : -1
    speedTestCompletionBlock?(speed, nil)
  }

  // Check Port
  func checkTcpPortForListen(port: in_port_t) -> (Bool) {

    let socketFileDescriptor = socket(AF_INET, SOCK_STREAM, 0)
    if socketFileDescriptor == -1 {
      print("SocketCreationFailed, \(descriptionOfLastError())")
      return false
    }

    var addr = sockaddr_in()
    let sizeOfSockkAddr = MemoryLayout<sockaddr_in>.size
    addr.sin_len = __uint8_t(sizeOfSockkAddr)
    addr.sin_family = sa_family_t(AF_INET)
    addr.sin_port = Int(OSHostByteOrder()) == OSLittleEndian ? _OSSwapInt16(port) : port
    addr.sin_addr = in_addr(s_addr: inet_addr("0.0.0.0"))
    addr.sin_zero = (0, 0, 0, 0, 0, 0, 0, 0)
    var bind_addr = sockaddr()
    memcpy(&bind_addr, &addr, Int(sizeOfSockkAddr))

    if Darwin.bind(socketFileDescriptor, &bind_addr, socklen_t(sizeOfSockkAddr)) == -1 {
      let details = descriptionOfLastError()
      release(socket: socketFileDescriptor)
      print("\(port), BindFailed, \(details)")
      return false
    }
    if listen(socketFileDescriptor, SOMAXCONN ) == -1 {
      let details = descriptionOfLastError()
      release(socket: socketFileDescriptor)
      print("\(port), BindFailed, \(details)")
      return false
    }
    release(socket: socketFileDescriptor)
    print("\(port) is free for use")
    return true
  }

  func release(socket: Int32) {
    Darwin.shutdown(socket, SHUT_RDWR)
    close(socket)
  }

  func descriptionOfLastError() -> String {
    return String.init(cString: (UnsafePointer(strerror(errno))))
  }
}
