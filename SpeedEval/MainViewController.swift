/*
 *  FILENAME : MainViewController.swift
 *  APPID : eu.soleriant.SpeedEval
 *  CREATION DATE : 2021, May 9th
 *  LAST UPDATE : 2026, October 13th
 *  AUTHOR : GK
 *  CONTRIBUTORS : -
 *  NOTES : PURPOSE > Testing the speed of the Fisher-Yates algorithm to shuffle an array of 1.000.000 integers,
 *                    through 3 different languages: C++/ObjC++, ObjC, Swift
 *          The interface is built in code with Auto Layout (stack views), so it adapts to every screen size,
 *          orientation and Dynamic Type setting. The benchmark itself runs on a background queue.
 *  COPYRIGHT : Copyright © 2021. All rights reserved.
 */

import UIKit

final class MainViewController: UIViewController
{
    private let activity = UIActivityIndicatorView(style: .medium)
    private let runButton = UIButton(type: .custom)
    private let statusLabel = UILabel()
    private var resultLabels: [Implementation: UILabel] = [:]

    override func viewDidLoad()
    {
        super.viewDidLoad()

        /*-------------------------------------------------------------------------------------------------------------------------------*/

        self.createInterface()
        self.runBenchmark()

        /*-------------------------------------------------------------------------------------------------------------------------------*/
    }

    /*-----------------------------------------------------------------------------------------------------------------------------------*/
    /* INTERFACE */

    /// Verdana scaled with the user's Dynamic Type setting.
    private func verdana(_ size: CGFloat) -> UIFont
    {
        let base = UIFont(name: "Verdana", size: size) ?? .systemFont(ofSize: size)
        return UIFontMetrics(forTextStyle: .body).scaledFont(for: base)
    }

    private func makeLabel(text: String? = nil, size: CGFloat, color: String) -> UILabel
    {
        let label = UILabel()
        label.text = text
        label.font = verdana(size)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = UIColor(named: color) /* Toggle dark mode in the simulator : Cmd + Shift + A */
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }

    func createInterface()
    {
        /*-------------------------------------------------------------------------------------------------------------------------------*/

        /* BASICS */
        self.view.backgroundColor = UIColor(named: "SpecGray")

        /*-------------------------------------------------------------------------------------------------------------------------------*/

        /* INTRO */
        let count = NumberFormatter.localizedString(from: NSNumber(value: Benchmark.elementCount), number: .decimal)
        var introText = "PURPOSE\nTesting the speed of the Fisher-Yates algorithm to shuffle an array of "
            + "\(count) integers, through 3 different languages:\nC++/ObjC++, ObjC, Swift\n\n"
            + "Median of \(Benchmark.measuredRounds) runs, after \(Benchmark.warmUpRounds) warm-up runs."
        #if DEBUG
        /* In Debug, Swift is compiled with -Onone and C/C++ with -O0 : timings say more about the build settings
         * than about the languages. Edit Scheme > Run > Build Configuration > Release for meaningful numbers. */
        introText += "\n\n⚠︎ Debug build : compiler optimisations are off, timings are not representative."
        #endif
        let intro = makeLabel(text: introText, size: 13, color: "SpecBlack")

        /*-------------------------------------------------------------------------------------------------------------------------------*/

        /* CASES : one title + one framed result label per implementation */
        let casesStack = UIStackView()
        casesStack.axis = .vertical
        casesStack.spacing = 6

        for implementation in Implementation.allCases
        {
            let title = makeLabel(text: implementation.title, size: 16, color: "SpecWhite")

            let result = makeLabel(text: "–", size: 15, color: "SpecBlack")
            result.layer.borderColor = UIColor.white.cgColor
            result.layer.borderWidth = 2
            result.layer.cornerRadius = 10
            result.heightAnchor.constraint(greaterThanOrEqualToConstant: 36).isActive = true
            resultLabels[implementation] = result

            casesStack.addArrangedSubview(title)
            casesStack.addArrangedSubview(result)
            casesStack.setCustomSpacing(18, after: result)
        }

        /*-------------------------------------------------------------------------------------------------------------------------------*/

        /* STATUS : tells whether every language produced the same permutation */
        statusLabel.font = verdana(12)
        statusLabel.adjustsFontForContentSizeCategory = true
        statusLabel.textColor = UIColor(named: "SpecBlack")
        statusLabel.textAlignment = .center
        statusLabel.numberOfLines = 0

        /*-------------------------------------------------------------------------------------------------------------------------------*/

        /* BUTTON */
        runButton.setBackgroundImage(UIImage(named: "Bkg_Normal"), for: .normal)
        runButton.setBackgroundImage(UIImage(named: "Bkg_Selected"), for: .highlighted)
        runButton.setTitle("Run Fisher-Yates again", for: .normal)
        runButton.setTitle("Running…", for: .disabled)
        runButton.setTitleColor(.white, for: .normal)
        runButton.setTitleColor(.lightGray, for: .disabled)
        runButton.titleLabel?.font = verdana(16)
        runButton.titleLabel?.adjustsFontForContentSizeCategory = true
        /* The background images are 1920x300 px at @1x, so the button's intrinsic height would be 300 pt.
         * The fixed height (priority 800) beats the intrinsic size (compression resistance 750),
         * while the title constraint still lets the button grow with large Dynamic Type sizes. */
        let fixedHeight = runButton.heightAnchor.constraint(equalToConstant: 50)
        fixedHeight.priority = UILayoutPriority(800)
        fixedHeight.isActive = true
        if let title = runButton.titleLabel
        {
            runButton.heightAnchor.constraint(greaterThanOrEqualTo: title.heightAnchor, constant: 16).isActive = true
        }
        runButton.addTarget(self, action: #selector(runBenchmark), for: .touchUpInside)

        activity.hidesWhenStopped = true
        activity.color = UIColor(named: "SpecWhite")

        /*-------------------------------------------------------------------------------------------------------------------------------*/

        /* LAYOUT : everything in a scroll view, so that large Dynamic Type sizes stay readable */
        let mainStack = UIStackView(arrangedSubviews: [intro, casesStack, statusLabel, activity, runButton])
        mainStack.axis = .vertical
        mainStack.spacing = 24
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(mainStack)
        self.view.addSubview(scrollView)

        let margins = self.view.layoutMarginsGuide
        let content = scrollView.contentLayoutGuide
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: margins.trailingAnchor),

            mainStack.topAnchor.constraint(equalTo: content.topAnchor, constant: 16),
            mainStack.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -16),
            mainStack.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            mainStack.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
        ])

        /*-------------------------------------------------------------------------------------------------------------------------------*/
    }

    /*-----------------------------------------------------------------------------------------------------------------------------------*/
    /* BENCHMARK */

    @objc func runBenchmark()
    {
        runButton.isEnabled = false
        activity.startAnimating()
        statusLabel.text = nil

        /* The benchmark takes a while : running it on the main thread would freeze the interface
         * (and the activity indicator would never get a chance to be drawn). */
        DispatchQueue.global(qos: .userInitiated).async
        {
            let report = Benchmark.run()

            /* UIKit may only be touched from the main thread. */
            DispatchQueue.main.async
            {
                self.display(report)
                self.activity.stopAnimating()
                self.runButton.isEnabled = true
            }
        }
    }

    private func display(_ report: BenchmarkReport)
    {
        guard let reference = report.stats[.cpp]?.median else { return }

        for (implementation, label) in resultLabels
        {
            guard let stats = report.stats[implementation] else { continue }

            let ratio = implementation == .cpp ? "ref." : String(format: "x %.2f", stats.median / reference)
            label.text = String(format: "%.3f ms  ( %@ )", stats.median * 1000, ratio)
        }

        statusLabel.text = report.checksumsMatch
            ? "✓ All languages produced identical permutations."
            : "⚠︎ The implementations produced different permutations : at least one of them is wrong."
    }
}
