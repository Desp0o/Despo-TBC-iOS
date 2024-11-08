//
//  ImageViewModel.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import Foundation
import UIKit

final class ImageViewModel {
    private let networkManager: NetworkManaging
    private let imageProcessor: ImageProcessing
    
    var onImagesUpdated: (() -> Void)?
    
    var images: [UIImage] = [] {
        didSet {
            onImagesUpdated?()
        }
    }
    
    private var imageUrls: [URL] = []
    
    init(
        networkManager: NetworkManaging = NetworkManager(),
        imageProcessor: ImageProcessing = ImageProcessor()
    ) {
        self.networkManager = networkManager
        self.imageProcessor = imageProcessor
    }
    
    // MARK: - დეველოპერებო, აქ უნდა ღვაროთ ოფლი
    
    // დაასრულეთ მეთოდის იმპლემენტაცია GCD-ის გამოყენებით (DispatchGroup)
    func fetchImagesWithGCD() {
        // არ დაგავიწყდეთ, გადმოწერილი იმიჯები საბოლოოდ უნდა მოხვდეს images მასივში.
        var downlaodedImages: [UIImage] = []
        let group = DispatchGroup()
        
        for url in imageUrls {
            group.enter()
            
            DispatchQueue.global().async {[weak self] in
                self?.fetchAndProcessImage(from: url) { image in
                    guard let image else {return}
                    downlaodedImages.append(image)
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {[weak self] in
            DispatchQueue.main.async {
                self?.images = downlaodedImages
            }
        }
    }
    
    // დაასრულეთ მეთოდის იმპლემენტაცია NSOperationQueue-ის გამოყენებით
    func fetchImagesWithOperationQueue() {
        var downloadedImages: [UIImage] = []
        let semaphore = DispatchSemaphore(value: 0)
        let operationQueue = OperationQueue()
        operationQueue.underlyingQueue = DispatchQueue.global(qos: .userInitiated)
        
        for url in imageUrls {
            let operation = BlockOperation {[weak self] in
                self?.fetchAndProcessImage(from: url) { image in
                    guard let image = image else { return }
                    downloadedImages.append(image)
                    semaphore.signal()
                }
            }
            
            operationQueue.addOperation(operation)
        }
        
        for _ in imageUrls {
            semaphore.wait()
        }
        
        DispatchQueue.main.async {[weak self] in
            self?.images = downloadedImages
        }
    }
    
    func fetchImagesWithOperationQueueSecond() {
        var downloadedImages: [UIImage] = []
        let lock = NSLock()
        let operationQueue = OperationQueue()
        operationQueue.underlyingQueue = DispatchQueue.global(qos: .userInitiated)
        
        var count = 0
        
        for url in imageUrls {
            let operation = BlockOperation { [weak self] in
                self?.fetchAndProcessImage(from: url) { image in
                    guard let image else { return }
                    lock.lock()
                    downloadedImages.append(image)
                    lock.unlock()
                    
                    count += 1
                    if count == self?.imageUrls.count {
                        DispatchQueue.main.async {
                            self?.images = downloadedImages
                        }
                    }
                }
            }
            operationQueue.addOperation(operation)
        }
    }
    
    // დაასრულეთ მეთოდის იმპლემენტაცია async/await-ის გამოყენებით (შეგიძლიათ დაიხმაროთ fetchAndProcessImageAsync())
    func fetchImagesWithAsyncAwait() {
        Task {[weak self] in
            var downloadedImages: [UIImage] = []

            guard let self = self else { return }
            
            for url in imageUrls {
                async let image = self.fetchAndProcessImageAsync(from: url)
                if let image = await image { downloadedImages.append(image) }
            }
            
            self.images = downloadedImages
        }
    }

    
    func updateNumberOfImages(to count: Int) {
        generateImageUrls(numberOfImages: count)
    }
    
    private func generateImageUrls(numberOfImages: Int) {
        let maxImageNumber = 700
        var urls: [URL] = []
        
        for _ in 1...numberOfImages {
            let randomImageNumber = Int.random(in: 1...maxImageNumber)
            if let url = URL(string: "https://yavuzceliker.github.io/sample-images/image-\(randomImageNumber).jpg") {
                urls.append(url)
            }
        }
        
        self.imageUrls = urls
    }
    
    private func fetchAndProcessImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url else { return }
        networkManager.downloadImage(from: url) { [weak self] image in
            guard let self = self, let image = image else {
                completion(nil)
                return
            }
            self.imageProcessor.applyFilter(to: image) { processedImage in
                completion(processedImage)
            }
        }
    }
    
    private func fetchAndProcessImageAsync(from url: URL?) async -> UIImage? {
        await withCheckedContinuation { continuation in
            self.fetchAndProcessImage(from: url) { image in
                continuation.resume(returning: image)
            }
        }
    }
}
