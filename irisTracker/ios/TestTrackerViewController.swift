//
//  TestTrackerViewController.swift
//  TrainingApp
//
//  Created by Ekam  on 2021-06-04.
//

import UIKit
import SceneKit
import ARKit

class TestTrackerViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate,TrackerDelegate {

  private var imageView: UIImageView!
  let camera = Camera()
  var tracker: IrisTracker = IrisTracker()!


  override func viewDidLoad() {
      super.viewDidLoad()

    imageView = UIImageView(frame: self.view.frame)
    self.view.addSubview(imageView)


      camera.setSampleBufferDelegate(self)
      camera.start()

      self.tracker.delegate = self
      self.tracker.startGraph()



  }

  func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
      let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
      tracker.processVideoFrame(pixelBuffer)

      DispatchQueue.main.async {
              self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer!))
      }
  }

  func irisTracker(_ irisTracker: IrisTracker!, didOutputLandmarks landmarks: [Landmark]!) {
    print("The landmarks are: \(landmarks.count)")
  }

  func irisTracker(_ irisTracker: IrisTracker!, didOutputPixelBuffer pixelBuffer: CVPixelBuffer!) {
    DispatchQueue.main.async {
            self.imageView.image = UIImage(ciImage: CIImage(cvPixelBuffer: pixelBuffer))

    }
  }

}

